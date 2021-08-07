/**
 * Simple Selector for pulling in sObject Trigger Settings
 * Ideally in an enterprise org this would sit within a larger, more robust data access framework
**/
public inherited sharing class SObjectTriggerSettingSelector {
    /**
    * Returns the appropriate sobject trigger setting and related trigger 
    * handler settings for the provided sObjectType String
    * @param sObjType String representation of the sobject type to get settings for
    * @return List<SObjectTriggerSetting__mdt> 
    **/
    public List<SObjectTriggerSetting__mdt> getSObjectTriggerSettings(String sObjType) {
        // Custom metadata, no security check necessary
        return [
            SELECT SObjectType__c, (SELECT ClassName__c FROM TriggerHandlerSettings__r WHERE IsActive__c = true)
            FROM SObjectTriggerSetting__mdt
            WHERE SObjectType__c = :sObjType
            AND IsActive__c = true
        ];
    }
}
