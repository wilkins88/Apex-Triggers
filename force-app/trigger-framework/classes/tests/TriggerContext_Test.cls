@IsTest
private inherited sharing class TriggerContext_Test {
    @IsTest
    private static void doCoverageForEmptyMethods() {
        TriggerContext context = new TriggerContext();
        System.Test.startTest();
        context.getTriggerNew();
        context.getTriggerOld();
        context.getTriggerNewMap();
        context.getTriggerOldMap();
        context.isBeforeInsert();
        context.isBeforeUpdate();
        context.isBeforeDelete();
        context.isAfterInsert();
        context.isAfterUpdate();
        context.isAfterDelete();
        context.isAfterUndelete();
        System.Test.stopTest();
    }
}
