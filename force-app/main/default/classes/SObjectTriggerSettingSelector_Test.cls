/**
 * @File Name          : SObjectTriggerSettingSelector_Test.cls
 * @Description        : Tests for the SObjectTriggerSettingSelector
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 2/28/2020, 10:05:45 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class SObjectTriggerSettingSelector_Test {
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
