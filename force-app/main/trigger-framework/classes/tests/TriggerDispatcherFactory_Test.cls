@IsTest
private inherited sharing class TriggerDispatcherFactory_Test {
    @IsTest
    private static void create_mockHandlers_returnOne() {
        TriggerDispatcherFactory.selector = (SObjectTriggerSettingSelector)System.Test.createStub(
            SObjectTriggerSettingSelector.class, 
            new SObjectTriggerSettingSelectorMock()
        );
        System.Test.startTest();
        TriggerDispatcher disp = TriggerDispatcherFactory.create(Account.getSObjectType());
        System.Test.stopTest();
        System.assertNotEquals(null, disp.ctx);
        System.assertEquals(1, disp.handlers.size());
    }
}
