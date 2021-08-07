/**
 * @File Name          : TriggerDispatcher_Test.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 3:34:59 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/2/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public class TriggerDispatcher_Test {

    private static SObjectTriggerSettingSelectorMock generateSelectorMock() {
        Map<String, Object> settingMap = new Map<String, Object>();
        settingMap.put('SObjectType__c', 'Account');
        Map<String, Object> handlers = new Map<String, Object>();
        handlers.put('totalSize', 1);
        handlers.put('done', true);
        handlers.put('records', new List<Map<String, Object>> { new Map<String, Object> {
            'IsActive__c' => true,
            'ClassName__c' => 'TriggerDispatcher_Test.TriggerHandlerMock'
        }});
        SettingMap.put('TriggerHandlerSettings__r', handlers);
        Map<String, List<SObjectTriggerSetting__mdt>> settings = new Map<String, List<SObjectTriggerSetting__mdt>> {
            'Account' => new List<SObjectTriggerSetting__mdt> {
                (SObjectTriggerSetting__mdt)JSON.deserialize(JSON.serialize(settingMap), SObjectTriggerSetting__mdt.class)
            }
        };
        return new SObjectTriggerSettingSelectorMock(settings);
    }


    @IsTest
    private static void dispatch_beforeInsert_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeInsertMock(null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeInsert);
    }

    @IsTest
    private static void dispatch_beforeUpdate_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeUpdateMock(null, null, null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeUpdate);
    }

    @IsTest
    private static void dispatch_beforeDelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeDeleteMock(null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeDelete);
    }

    @IsTest
    private static void dispatch_afterInsert_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterInsertMock(null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterInsert);
    }

    @IsTest
    private static void dispatch_afterUpdate_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterUpdateMock(null, null, null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterUpdate);
    }

    @IsTest
    private static void dispatch_afterDelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterDeleteMock(null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterDelete);
    }

    @IsTest
    private static void dispatch_afterUndelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterUndeleteMock(null, null));
        SObjectTriggerSettingSelector selector = (SObjectTriggerSettingSelector)System.Test.createStub(SObjectTriggerSettingSelector.class, generateSelectorMock());

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, selector);
        System.Test.startTest();
        dispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlerMap.get('Account');
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterUndelete);
    }

    public class TriggerHandlerMock extends Triggerhandler {
        public Boolean beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete;
        public override void doBeforeInsert() {
            this.beforeInsert = true;
        }
        public override void doBeforeUpdate() {
            this.beforeUpdate = true;
        }
        public override void doBeforeDelete() {
            this.beforeDelete = true;
        }
        public override void doAfterInsert() {
            this.afterInsert = true;
        }
        public override void doAfterUpdate() {
            this.afterUpdate = true;
        }
        public override void doAfterDelete() {
            this.afterDelete = true;
        }
        public override void doAfterUndelete() {
            this.afterUndelete = true;
        }
    }

}
