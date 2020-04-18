/**
 * @File Name          : ITriggerHandler.cls
 * @Description        : Base interface for trigger business logic handlers
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 5:43:51 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020        Thomas wilkins           Initial Version
**/
public interface ITriggerHandler {
    /**
    * @description execute before insert logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doBeforeInsert();
    /**
    * @description execute before update logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doBeforeUpdate();
    /**
    * @description execute before delete logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doBeforeDelete();
    /**
    * @description execute after insert logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doAfterInsert();
    /**
    * @description execute after update logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doAfterUpdate();
    /**
    * @description execute after delete logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doAfterDelete();
    /**
    * @description execute after undelete logic
    * @author Thomas Wilkins | 2/28/2020 
    * @return void 
    **/
    void doAfterUndelete();
    
    /**
    * @description Set the trigger context for use in the handler
    * @author Thomas Wilkins | 2/28/2020 
    * @param ctx trigger context to be set
    * @return void 
    **/
    void setTriggerContext(TriggerContext ctx);
}
