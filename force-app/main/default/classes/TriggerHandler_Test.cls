/**
 * @File Name          : TriggerHandler_Test.cls
 * @Description        : Unit tests for the TriggerHandler base class
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 2/2/2020, 6:35:22 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/2/2020         Thomas Wilkins          Initial Version
**/
@IsTest
private class TriggerHandler_Test {
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

        System.Test.startTest();
    }
}
