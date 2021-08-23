@IsTest
private inherited sharing class TriggerHandler_Test {
    @IsTest
    private static void doCoverageForEmptyMethods() {
        TriggerHandler handler = new TriggerHandler();
        System.Test.startTest();
        handler.doBeforeInsert();
        handler.doBeforeUpdate();
        handler.doBeforeDelete();
        handler.doAfterInsert();
        handler.doAfterUpdate();
        handler.doAfterDelete();
        handler.doAfterUndelete();
        System.Test.stopTest();
    }

    @IsTest
    private static void setTriggerContext_valueSet() {
        TriggerHandler handler = new TriggerHandler();
        TriggerContext ctx = new TriggerContext();
        System.Test.startTest();
        handler.setTriggerContext(ctx);
        System.Test.stopTest();

        System.assertNotEquals(null, handler.ctx);
    }
}
