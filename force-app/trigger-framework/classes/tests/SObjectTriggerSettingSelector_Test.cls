@IsTest
private inherited sharing class SObjectTriggerSettingSelector_Test {
    @IsTest
    private static void SObjectTriggerSettingSelector_dummySObject_noValues() {
        SObjectTriggerSettingSelector selector = new SObjectTriggerSettingSelector();
        List<SObjectTriggerSetting__mdt> results;
        System.Test.startTest();
        results = selector.getSObjectTriggerSettings('DUMMY-SOBJECT');
        System.Test.stopTest();
        // don't want to create a testing dependency on having 
        // an actual custom metadata record in place
        System.assertEquals(0, results.size());
    }
}
