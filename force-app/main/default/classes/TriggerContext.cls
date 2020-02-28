/**
 * @File Name          : TriggerContext.cls
 * @Description        : Wrapper around System Trigger API
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 2/28/2020, 3:54:31 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020   Thomas Wilkins     Initial Version
**/
public class TriggerContext {

    /**
    * @description Returns the array of new/updated records
    * @author Thomas Wilkins | 2/28/2020 
    * @return List<SObject> 
    **/
    public List<SObject> getTriggerNew() {
        return System.Trigger.new;
    }

    /**
    * @description Returns a map of new/updated records
    * @author Thomas Wilkins | 2/28/2020 
    * @return List<SObject> 
    **/
    public Map<Id, SObject> getTriggerNewMap() {
        return System.Trigger.newMap;
    }

    /**
    * @description Returns the array of old records
    * @author Thomas Wilkins | 2/28/2020 
    * @return List<SObject> 
    **/
    public List<SObject> getTriggerOld() {
        return System.Trigger.old;
    }
    
    /**
    * @description returns the map of old records
    * @author Thomas Wilkins | 2/28/2020 
    * @return List<SObject> 
    **/
    public Map<Id, SObject> getTriggerOldMap() {
        return System.Trigger.oldMap;
    }

    /**
    * @description Returns whether or not the current context is a before insert operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isBeforeInsert() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_INSERT;
    }

    /**
    * @description Returns whether or not the current context is a before update operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean IsBeforeUpdate() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_UPDATE;
    }

    /**
    * @description Returns whether or not the current context is a before delete operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isBeforeDelete() {
        return System.Trigger.operationType == System.TriggerOperation.BEFORE_DELETE;
    }

    /**
    * @description Returns whether or not the current context is an after insert operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isAfterInsert() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_INSERT;
    }

    /**
    * @description Returns whether or not the current context is an after update operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isAfterUpdate() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_UPDATE;
    }

    /**
    * @description Returns whether or not the current context is an after delete operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isAfterDelete() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_DELETE;
    }

    /**
    * @description Returns whether or not the current context is an after undelete operation
    * @author Thomas Wilkins | 2/28/2020 
    * @return Boolean 
    **/
    public Boolean isAfterUndelete() {
        return System.Trigger.operationType == System.TriggerOperation.AFTER_UNDELETE;
    }
}
