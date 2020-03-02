/**
 * @File Name          : SObjectTriggerSettingSelector.cls
 * @Description        : Simple Selector for pulling in sObject Trigger Settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 3:09:38 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
public class SObjectTriggerSettingSelector {
    /**
    * @description Returns the appropriate sobject trigger setting and related trigger 
    * handler settings for the provided sObjectType String
    * @author Thomas Wilkins | 2/28/2020 
    * @param sObjType String representation of the sobject type to get settings for
    * @return List<SObjectTriggerSetting__mdt> 
    **/
    public List<SObjectTriggerSetting__mdt> getSObjectTriggerSettings(String sObjType) {
        return [
            SELECT SObjectType__c, (SELECT ClassName__c FROM TriggerHandlerSettings__r WHERE IsActive__c = true)
            FROM SObjectTriggerSetting__mdt
            WHERE SObjectType__c = :sObjType
            AND IsActive__c = true
        ];
    }
}
