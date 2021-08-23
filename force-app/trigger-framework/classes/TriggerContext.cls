/**
 * Wrapper around System Trigger API. Useful for decoupling custom code from
 * System APIs, affording other practices such as mocking
**/
public inherited sharing class TriggerContext {

    /**
    * Returns the array of new/updated records
    * @return List<SObject> 
    **/
    public List<SObject> getTriggerNew() {
        return System.Trigger.new;
    }

    /**
    * Returns a map of new/updated records
    * @return List<SObject> 
    **/
    public Map<Id, SObject> getTriggerNewMap() {
        return System.Trigger.newMap;
    }

    /**
    * Returns the array of old records
    * @return List<SObject> 
    **/
    public List<SObject> getTriggerOld() {
        return System.Trigger.old;
    }
    
    /**
    * Returns the map of old records
    * @return List<SObject> 
    **/
    public Map<Id, SObject> getTriggerOldMap() {
        return System.Trigger.oldMap;
    }

    /**
    * Returns whether or not the current context is a before insert operation
    * @return Boolean 
    **/
    public Boolean isBeforeInsert() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_INSERT;
    }

    /**
    * Returns whether or not the current context is a before update operation
    * @return Boolean 
    **/
    public Boolean isBeforeUpdate() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_UPDATE;
    }

    /**
    * Returns whether or not the current context is a before delete operation
    * @return Boolean 
    **/
    public Boolean isBeforeDelete() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_DELETE;
    }

    /**
    * Returns whether or not the current context is an after insert operation
    * @return Boolean 
    **/
    public Boolean isAfterInsert() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_INSERT;
    }

    /**
    * Returns whether or not the current context is an after update operation
    * @return Boolean 
    **/
    public Boolean isAfterUpdate() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_UPDATE;
    }

    /**
    * Returns whether or not the current context is an after delete operation
    * @return Boolean 
    **/
    public Boolean isAfterDelete() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_DELETE;
    }

    /**
    * Returns whether or not the current context is an after undelete operation
    * @return Boolean 
    **/
    public Boolean isAfterUndelete() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_UNDELETE;
    }

    /**
     * Wrapper around the trigger record addError method
     * @param record SObject to add error to
     * @param errorMessage String error message to attach to the record
     * @return void
     */
    public void addError(SObject record, String errorMessage) {
        record.addError(errorMessage);
    }
}
