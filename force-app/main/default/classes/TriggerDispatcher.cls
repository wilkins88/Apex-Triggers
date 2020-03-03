/**
 * @File Name          : TriggerDispatcher.cls
 * @Description        : Primary dispatcher for routing trigger logic. The dispatch method should be invoked directly from the triggers
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 5:39:53 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class TriggerDispatcher {

    @TestVisible
    private static final String CANNOT_DISABLE_TRIGGERS = 'Can only disable triggers in a test context.';

    @TestVisible
    private TriggerContext ctx;
    @TestVisible
    private SObjectTriggerSettingSelector selector;
    @TestVisible
    private Map<String, List<ITriggerHandler>> handlerMap {
        get {
            if (handlerMap == null) handlerMap = new Map<String, List<ITriggerHandler>>();
            return handlerMap;
        } set;
    }
    @TestVisible
    private Boolean executeHandlers {
        get {
            if (executeHandlers == null) return true;
            return executeHandlers;
        } set;
    }

    public TriggerDispatcher(TriggerContext ctx, SObjectTriggerSettingSelector selector) {
        this.ctx = ctx;
        this.selector = selector;
    }

    /**
    * @description Dispatches the trigger handlers for the provided sObjectType
    * @author Thomas Wilkins | 2/28/2020 
    * @param sObjType The type of sObject e.g. Account to run triggers for
    * @return void 
    **/
    public void dispatch(Schema.SObjectType sObjType) {
        if (!executeHandlers) return;
        for (ITriggerHandler handler : this.loadHandlers(sObjType)) {
            if (this.ctx.isBeforeInsert()) handler.doBeforeInsert();
            else if (this.ctx.isBeforeUpdate()) handler.doBeforeUpdate();
            else if (this.ctx.isBeforeDelete()) handler.doBeforeDelete();
            else if (this.ctx.isAfterInsert()) handler.doAfterInsert();
            else if (this.ctx.isAfterUpdate()) handler.doAfterUpdate();
            else if (this.ctx.isAfterDelete()) handler.doAfterDelete();
            else if (this.ctx.isAfterUndelete()) handler.doAfterUndelete();
        }
    }

    /**
    * @description Used to disable triggers in tests. This is good for generating test data without having to deal with impacts 
    * of other triggers, which makes unit tests less brittle
    * @author Thomas Wilkins | 2/28/2020 
    * @param shouldExecute Whether or not triggers should execute
    * @return void 
    **/
    public void shouldExecuteHandlers(Boolean shouldExecute) {
        if (!System.Test.isRunningTest()) throw new TriggerDispatcherException(CANNOT_DISABLE_TRIGGERS);
        this.executeHandlers = shouldExecute;
    }

    /**
    * @description Helper that loads the handlers basedo n the SObject Type
    * @author Thomas Wilkins | 2/28/2020 
    * @param sObjType type of sObject (e.g. Account) to load handlers for
    * @return List<ITriggerHandler> 
    **/
    @TestVisible
    private List<ITriggerHandler> loadHandlers(Schema.SObjectType sObjType) {
        String sObjTypeStr = String.valueOf(sObjType);
        if (this.handlerMap.containsKey(sObjTypeStr)) return this.handlerMap.get(sObjTypeStr);

        List<SObjectTriggerSetting__mdt> settings = this.selector.getSObjectTriggerSettings(sObjTypeStr);

        // support multiple settings per sObject here in case you have multiple
        // settings split across multiple packages that get 
        List<ITriggerHandler> handlers = new List<ITriggerHandler>();
        for (SObjectTriggerSetting__mdt sObjectSetting : settings) {
            for (TriggerHandlerSetting__mdt handlerSetting : sObjectSetting.TriggerHandlerSettings__r) {
                ITriggerHandler handler = (ITriggerHandler)Type.forName(handlerSetting.ClassName__c).newInstance();
                handler.setTriggerContext(ctx);
                handlers.add(handler);
            }
        }
        this.handlerMap.put(sObjTypeStr, handlers);
        return handlers;
    }
}
