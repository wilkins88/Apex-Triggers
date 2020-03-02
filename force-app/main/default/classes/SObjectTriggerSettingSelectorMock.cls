/**
 * @File Name          : SObjectTriggerSettingSelectorMock.cls
 * @Description        : Mock for selectors to prevent coupling to existing metadata records
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 3:24:02 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/2/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public class SObjectTriggerSettingSelectorMock implements System.StubProvider {
    private Map<String, List<SObjectTriggerSetting__mdt>> settings;
    public SObjectTriggerSettingSelectorMock(Map<String, List<SObjectTriggerSetting__mdt>> settings) {
        this.settings = settings;
    }

    public Object handleMethodCall(
        Object stubbedObject, 
        String stubbedMethodName,
        Type returnType, 
        List<Type> listOfParamTypes, 
        List<String> listOfParamNames,
        List<Object> listOfArgs
    ) {
        if (stubbedMethodName == 'getSObjectTriggerSettings') {
            String sObjType = (String)listOfArgs[0];
            if (settings.containsKey(sObjType)) return settings.get(sObjType);
            else return new List<SObjectTriggerSetting__mdt>();
        } else {
            return null;
        }
    }
}