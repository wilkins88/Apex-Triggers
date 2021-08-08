/**
 * Mock for selectors to prevent coupling to existing metadata records
**/
@IsTest
public class SObjectTriggerSettingSelectorMock implements System.StubProvider {
    public Object handleMethodCall(
        Object stubbedObject, 
        String stubbedMethodName,
        Type returnType, 
        List<Type> listOfParamTypes, 
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        switch on stubbedMethodName {
            when 'getSObjectTriggerSettings' {
                String sObjType = (String)listOfArgs[0];
                Map<String, Object> settingMap = new Map<String, Object>();
                settingMap.put('SObjectType__c', sObjType);
                Map<String, Object> handlers = new Map<String, Object>();
                handlers.put('totalSize', 1);
                handlers.put('done', true);
                handlers.put('records', new List<Map<String, Object>> { new Map<String, Object> {
                    'IsActive__c' => true,
                    'ClassName__c' => 'TriggerHandlerMock'
                }});
                settingMap.put('TriggerHandlerSettings__r', handlers);
                return new List<SObjectTriggerSetting__mdt> {
                    (SObjectTriggerSetting__mdt)JSON.deserialize(JSON.serialize(settingMap), SObjectTriggerSetting__mdt.class)
                };
            }
        }
        return null;
    }
}