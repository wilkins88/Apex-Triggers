/**
 * @File Name          : TriggerDispatcher.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 2/28/2020, 3:59:25 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
public class TriggerDispatcher {

    @TestVisible
    private static final String CANNOT_DISABLE_TRIGGERS = 'Can only disable triggers in a test context.';

    @TestVisible
    private static Map<String, List<ITriggerHandler>> handlerMap {
        get {
            if (handlerMap == null) handlerMap = new Map<String, List<ITriggerHandler>>();
            return handlerMap;
        } set;
    }

    @TestVisible
    private static TriggerContext ctx {
        get {
            if (ctx == null) ctx = new TriggerContext();
            return ctx;
        } set;
    }

    @TestVisible
    private static Boolean executeHandlers {
        get {
            if (executeHandlers == null) return false;
            return executeHandlers;
        } set;
    }

    /**
    * @description Dispatches the trigger handlers for the provided sObjectType
    * @author Thomas Wilkins | 2/28/2020 
    * @param sObjType The type of sObject e.g. Account to run triggers for
    * @return void 
    **/
    public static void dispatch(Schema.SObjectType sObjType) {
        if (!executeHandlers) return;
        for (ITriggerHandler handler : loadHandlers(sObjType)) {
            if (ctx.isBeforeInsert()) handler.doBeforeInsert();
            else if (ctx.isBeforeUpdate()) handler.doBeforeUpdate();
            else if (ctx.isBeforeDelete()) handler.doBeforeDelete();
            else if (ctx.isAfterInsert()) handler.doAfterInsert();
            else if (ctx.isAfterUpdate()) handler.doAfterUpdate();
            else if (ctx.isAfterDelete()) handler.doAfterDelete();
            else if (ctx.isAfterUndelete()) handler.doAfterUndelete();
        }
    }

    /**
    * @description Used to disable triggers in tests. This is good for generating test data without having to deal with impacts 
    * of other triggers, which makes unit tests less brittle
    * @author Thomas Wilkins | 2/28/2020 
    * @param shouldExecute Whether or not triggers should execute
    * @return void 
    **/
    public static void shouldExecuteHandlers(Boolean shouldExecute) {
        if (System.Test.isRunningTest()) throw new TriggerDispatcherException(CANNOT_DISABLE_TRIGGERS);
        executeHandlers = shouldExecute;
    }

    /**
    * @description Helper that loads the handlers basedo n the SObject Type
    * @author Thomas Wilkins | 2/28/2020 
    * @param sObjType type of sObject (e.g. Account) to load handlers for
    * @return List<ITriggerHandler> 
    **/
    @TestVisible
    private static List<ITriggerHandler> loadHandlers(Schema.SObjectType sObjType) {
        String sObjTypeStr = String.valueOf(sObjType);
        if (handlerMap.containsKey(sObjTypeStr)) return handlerMap.get(sObjTypeStr);

        List<SObjectTriggerSetting__mdt> sObjectSettings = [
            SELECT SObjectType__c, (SELECT ClassName__c FROM TriggerHandlerSettings__r WHERE IsActive__c = true)
            FROM SObjectTriggerSetting__mdt
            WHERE SObjectType__c = :sObjTypeStr
            AND IsActive__c = true
        ];

        for (SObjectTriggerSetting__mdt sObjectSetting : sObjectSettings) {
            List<ITriggerHandler> handlers = new List<ITriggerHandler>();
            for (TriggerHandlerSetting__mdt handlerSetting : sObjectSetting.TriggerHandlerSettings__r) {
                ITriggerHandler handler = (ITriggerHandler)Type.forName(handlerSetting.ClassName__c).newInstance();
                handler.setTriggerContext(ctx);
                handlers.add(handler);
            }
            handlerMap.put(sObjectSetting.SObjectType__c, handlers);
        }
        return handlers;
    }
}
