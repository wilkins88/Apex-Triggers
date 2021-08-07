/**
 * Virtual class that all trigger handlers should extend
 * Provides default behavior in the event that a child handler does override the method
**/
public inherited sharing virtual class TriggerHandler implements ITriggerHandler {

    @TestVisible
    protected TriggerContext ctx;

    public virtual void doBeforeInsert() { return; }
    public virtual void doBeforeUpdate() { return; }
    public virtual void doBeforeDelete() { return;}
    public virtual void doAfterInsert() { return; }
    public virtual void doAfterUpdate() { return; }
    public virtual void doAfterDelete() { return; }
    public virtual void doAfterUndelete() { return; }
    public void setTriggerContext(TriggerContext ctx) {
        this.ctx = ctx;
    }
}
