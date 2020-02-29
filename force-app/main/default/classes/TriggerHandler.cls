/**
 * @File Name          : TriggerHandler.cls
 * @Description        : Virtual class that all trigger handlers should extend
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 2/28/2020, 8:56:47 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/28/2020         Thomas Wilkins          Initial Version
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
