/**
 * @File Name          : TriggerContextMock.cls
 * @Description        : Mock classes that can be used to mock a trigger context in tests
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 2/28/2020, 10:39:36 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public class TriggerContextMocks {

    public class BeforeInsertMock implements System.StubProvider {
        private List<SObject> triggerNew;
        public BeforeInsertMock(List<SObject> triggerNew) {
            this.triggerNew = triggerNew;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return this.triggerNew;
                } when 'getTriggerNewMap' {
                    return null;
                } when 'getTriggerOld' {
                    return null;
                } when 'getTriggerOldMap' {
                    return null;
                } when 'isBeforeInsert' {
                    return true;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class BeforeUpdateMock implements System.StubProvider {
        private List<SObject> triggerNew, triggerOld;
        private Map<Id, SObject> newMap, oldMap;
        public BeforeUpdateMock(
            List<SObject> triggerNew,
            Map<Id, SObject> newMap,
            List<SObject> triggerOld,
            Map<Id, SObject> oldMap
        ) {
            this.triggerNew = triggerNew;
            this.triggerOld = triggerOld;
            this.newMap = newMap;
            this.oldMap = oldMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return this.triggerNew;
                } when 'getTriggerNewMap' {
                    return this.newMap;
                } when 'getTriggerOld' {
                    return this.triggerOld;
                } when 'getTriggerOldMap' {
                    return this.oldMap;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return true;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class BeforeDeleteMock implements System.StubProvider {
        private List<SObject> triggerOld;
        private Map<Id, SObject> oldMap;
        public BeforeDeleteMock(List<SObject> triggerOld, Map<Id, SObject> oldMap) {
            this.triggerOld = triggerOld;
            this.oldMap = oldMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return null;
                } when 'getTriggerNewMap' {
                    return null;
                } when 'getTriggerOld' {
                    return this.triggerOld;
                } when 'getTriggerOldMap' {
                    return this.oldMap;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return true;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class AfterInsertMock implements System.StubProvider {
        private List<SObject> triggerNew;
        private Map<Id, SObject> newMap;
        public AfterInsertMock(List<SObject> triggerNew, Map<Id, SObject> newMap) {
            this.triggerNew = triggerNew;
            this.newMap = newMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return this.triggerNew;
                } when 'getTriggerNewMap' {
                    return this.newMap;
                } when 'getTriggerOld' {
                    return null;
                } when 'getTriggerOldMap' {
                    return null;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return true;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class AfterUpdateMock implements System.StubProvider {
        private List<SObject> triggerNew, triggerOld;
        private Map<Id, SObject> newMap, oldMap;
        public AfterUpdateMock(
            List<SObject> triggerNew,
            Map<Id, SObject> newMap,
            List<SObject> triggerOld,
            Map<Id, SObject> oldMap
        ) {
            this.triggerNew = triggerNew;
            this.triggerOld = triggerOld;
            this.newMap = newMap;
            this.oldMap = oldMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return this.triggerNew;
                } when 'getTriggerNewMap' {
                    return this.newMap;
                } when 'getTriggerOld' {
                    return this.triggerOld;
                } when 'getTriggerOldMap' {
                    return this.oldMap;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return true;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class AfterDeleteMock implements System.StubProvider {
        private List<SObject> triggerOld;
        private Map<Id, SObject> oldMap;
        public AfterDeleteMock(List<SObject> triggerOld, Map<Id, SObject> oldMap) {
            this.triggerOld = triggerOld;
            this.oldMap = oldMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return null;
                } when 'getTriggerNewMap' {
                    return null;
                } when 'getTriggerOld' {
                    return this.triggerOld;
                } when 'getTriggerOldMap' {
                    return this.oldMap;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return true; 
                } when 'isAfterUndelete' {
                    return false;
                } when else {
                    return null;
                }
            }
        }
    }

    public class AfterUndeleteMock implements System.StubProvider {
        private List<SObject> triggerNew;
        private Map<Id, SObject> newMap;
        public AfterUndeleteMock(List<SObject> triggerNew, Map<Id, SObject> newMap) {
            this.triggerNew = triggerNew;
            this.newMap = newMap;
        }

        public Object handleMethodCall(
            Object stubbedObject, 
            String stubbedMethodName,
            Type returnType, 
            List<Type> listOfParamTypes, 
            List<String> listOfParamNames,
            List<Object> listOfArgs
        ) {
            switch on stubbedMethodName {
                when 'getTriggerNew' {
                    return this.triggerNew;
                } when 'getTriggerNewMap' {
                    return this.newMap;
                } when 'getTriggerOld' {
                    return null;
                } when 'getTriggerOldMap' {
                    return null;
                } when 'isBeforeInsert' {
                    return false;
                } when 'isBeforeUpdate' {
                    return false;
                } when 'isBeforeDelete' {
                    return false;
                } when 'isAfterInsert' {
                    return false;
                } when 'isAfterUpdate' {
                    return false;
                } when 'isAfterDelete' {
                    return false; 
                } when 'isAfterUndelete' {
                    return true;
                } when else {
                    return null;
                }
            }
        }
    }
}
