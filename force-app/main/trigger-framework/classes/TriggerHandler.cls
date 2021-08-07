/**
 * @File Name          : TriggerHandler.cls
 * @Description        : Virtual class that all trigger handlers should extend
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/2/2020, 5:39:19 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020         Thomas Wilkins          Initial Version
**/
public inherited sharing virtual class TriggerHandler implements ITriggerHandler {

    @TestVisible
    protected TriggerContext ctx;

    public virtual void doBeforeInsert() {}
    public virtual void doBeforeUpdate() {}
    public virtual void doBeforeDelete() {}
    public virtual void doAfterInsert() {}
    public virtual void doAfterUpdate() {}
    public virtual void doAfterDelete() {}
    public virtual void doAfterUndelete() {}
    public void setTriggerContext(TriggerContext ctx) {
        this.ctx = ctx;
    }
}
