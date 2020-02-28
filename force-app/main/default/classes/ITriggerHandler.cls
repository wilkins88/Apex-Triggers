/**
 * @File Name          : ITriggerHandler.cls
 * @Description        : Base interface for trigger business logic handlers
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 2/2/2020, 6:03:26 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/2/2020        Thomas wilkins           Initial Version
**/
public interface ITriggerHandler {
    void doBeforeInsert();
    void doBeforeUpdate();
    void doBeforeDelete();
    void doAfterInsert();
    void doAfterUpdate();
    void doAfterDelete();
    void doAfterUndelete();
    void setTriggerContext(TriggerContext ctx);
}
