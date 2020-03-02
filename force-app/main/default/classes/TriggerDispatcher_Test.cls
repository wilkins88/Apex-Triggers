/**
 * @File Name          : TriggerDispatcher_Test.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 10:41:43 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/2/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class TriggerDispatcher_Test {

    private static void setMocks(System.StubProvider ctxMock, System.StubProvider selectorMock) {
        System.Test.createStub(TriggerContext.class, ctxMock);
        System.Test.createStub(SObjectTriggerSettingSelector.class, selectorMock);
    }

    private static SObjectTriggerSettingSelectorMock generateSelectorMock() {
        Map<String, List<SObjectTriggerSetting__mdt>> settings = new Map<String, List<SObjectTriggerSetting__mdt>> {
            'Account' => new List<SObjectTriggerSetting__mdt>()
        };
        return new SObjectTriggerSettingSelectorMock(settings);
    }

    @IsTest
    private static void dispatch_beforeInsert_finishExecution() {
        setMocks(new TriggerContextMocks.BeforeInsertMock(null), generateSelectorMock());
        TriggerHandlerMock handler = new TriggerHandlerMock();
        TriggerDispatcher.setSpecificHandlers('Account', new List<ITriggerhandler> { handler });

        System.Test.startTest();
        TriggerDispatcher.dispatch(Account.getSObjectType());
        System.Test.stopTest();

        System.assertEquals(true, handler.beforeInsert);
    }

    private class TriggerHandlerMock extends Triggerhandler {
        public Boolean beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete;
        public override void doBeforeInsert() {
            beforeInsert = true;
        }
        public override void doBeforeUpdate() {
            beforeUpdate = true;
        }
        public override void doBeforeDelete() {
            beforeDelete = true;
        }
        public override void doAfterInsert() {
            afterInsert = true;
        }
        public override void doAfterUpdate() {
            afterUpdate = true;
        }
        public override void doAfterDelete() {
            afterDelete = true;
        }
        public override void doAfterUndelete() {
            afterUndelete = true;
        }
    }

}
