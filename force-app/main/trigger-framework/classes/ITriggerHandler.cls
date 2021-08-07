/**
 * Base interface for trigger business logic handler
 * Required to mitigate casting and behavioral concerns when use the child
 * TriggerHandler virtual class for default behavior 
**/
public interface ITriggerHandler {
    /**
    * Execute before insert logic
    * @return void 
    **/
    void doBeforeInsert();
    /**
    * Execute before update logic
    * @return void 
    **/
    void doBeforeUpdate();
    /**
    * Execute before delete logic
    * @return void 
    **/
    void doBeforeDelete();
    /**
    * Execute after insert logic
    * @return void 
    **/
    void doAfterInsert();
    /**
    * Execute after update logic
    * @return void 
    **/
    void doAfterUpdate();
    /**
    * Execute after delete logic
    * @return void 
    **/
    void doAfterDelete();
    /**
    * Execute after undelete logic
    * @return void 
    **/
    void doAfterUndelete();
    
    /**
    * Set the trigger context for use in the handler
    * @param ctx trigger context to be set
    * @return void 
    **/
    void setTriggerContext(TriggerContext ctx);
}
