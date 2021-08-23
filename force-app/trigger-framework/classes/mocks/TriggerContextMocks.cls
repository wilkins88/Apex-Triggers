/**
 * Mock classes that can be used to mock a trigger context in tests
**/
@IsTest
public class TriggerContextMocks {

    public class BeforeInsertMock implements System.StubProvider {
        private List<SObject> triggerNew;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                } 
            }
            return null;
        }
    }

    public class BeforeUpdateMock implements System.StubProvider {
        private List<SObject> triggerNew, triggerOld;
        private Map<Id, SObject> newMap, oldMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                }
            }
            return null;
        }
    }

    public class BeforeDeleteMock implements System.StubProvider {
        private List<SObject> triggerOld;
        private Map<Id, SObject> oldMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                }
            }
            return null;
        }
    }

    public class AfterInsertMock implements System.StubProvider {
        private List<SObject> triggerNew;
        private Map<Id, SObject> newMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                } 
            }
            return null;
        }
    }

    public class AfterUpdateMock implements System.StubProvider {
        private List<SObject> triggerNew, triggerOld;
        private Map<Id, SObject> newMap, oldMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                }
            }
            return null;
        }
    }

    public class AfterDeleteMock implements System.StubProvider {
        private List<SObject> triggerOld;
        private Map<Id, SObject> oldMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                } 
            }
            return null;
        }
    }

    public class AfterUndeleteMock implements System.StubProvider {
        private List<SObject> triggerNew;
        private Map<Id, SObject> newMap;
        private Boolean addErrorCalled;
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
                } when 'addError' {
                    this.addErrorCalled = true;
                } 
            }
            return null;
        }
    }
}
