@IsTest
public inherited sharing class TriggerHandlerMock extends TriggerHandler {
    public Boolean beforeInsert, beforeUpdate, beforeDelete, afterInsert, afterUpdate, afterDelete, afterUndelete;
    public override void doBeforeInsert() {
        this.beforeInsert = true;
    }
    public override void doBeforeUpdate() {
        this.beforeUpdate = true;
    }
    public override void doBeforeDelete() {
        this.beforeDelete = true;
    }
    public override void doAfterInsert() {
        this.afterInsert = true;
    }
    public override void doAfterUpdate() {
        this.afterUpdate = true;
    }
    public override void doAfterDelete() {
        this.afterDelete = true;
    }
    public override void doAfterUndelete() {
        this.afterUndelete = true;
    }
}
