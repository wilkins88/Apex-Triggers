/**
 * @File Name          : TriggerHandler.cls
 * @Description        : Virtual class htat trigger handles should all extend
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 2/2/2020, 6:06:52 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/2/2020         Thomas Wilkins          Initial Version
**/
public virtual class TriggerHandler implements ITriggerHandler {

    @TestVisible
    protected TriggerContext ctx;

    public void doBeforeInsert() {}
    public void doBeforeUpdate() {}
    public void doBeforeDelete() {}
    public void doAfterInsert() {}
    public void doAfterUpdate() {}
    public void doAfterDelete() {}
    public void doAfterUndelete() {}
    public void setTriggerContext(TriggerContext ctx) {
        this.ctx = ctx;
    }
}
