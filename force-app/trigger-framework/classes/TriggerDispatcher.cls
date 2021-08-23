/**
 * Primary dispatcher for routing trigger logic. 
 * Generally created from the TriggerDispatcherFactory.
 * The dispatch method should be invoked directly from the triggers.
**/
public inherited sharing class TriggerDispatcher {
    @TestVisible
    private static Boolean executeHandlers {
        get {
            if (executeHandlers == null) {
                executeHandlers = true;
            }
            return executeHandlers;
        } set;
    }

    @TestVisible
    private TriggerContext ctx;
    @TestVisible
    private List<ITriggerHandler> handlers {
        get {
            if (this.handlers == null) {
                this.handlers = new List<ITriggerHandler>();
            }
            return this.handlers;
        }
        set;
    }

    public TriggerDispatcher(TriggerContext ctx, List<ITriggerHandler> handlers) {
        this.ctx = ctx;
        this.handlers = handlers;
    }

    /**
    * Dispatches the trigger handlers for the provided sObjectType
    * @return void 
    **/
    public void dispatch() {
        if (!executeHandlers) {
            return;
        }
        try {
            for (ITriggerHandler handler : this.handlers) {
                handler.setTriggerContext(this.ctx);
                if (this.ctx.isBeforeInsert()) {
                    handler.doBeforeInsert();
                }
                else if (this.ctx.isBeforeUpdate()) {
                    handler.doBeforeUpdate();
                }
                else if (this.ctx.isBeforeDelete()) { 
                    handler.doBeforeDelete();
                }
                else if (this.ctx.isAfterInsert()) {
                    handler.doAfterInsert();
                }
                else if (this.ctx.isAfterUpdate()) {
                    handler.doAfterUpdate();
                }
                else if (this.ctx.isAfterDelete()) {
                    handler.doAfterDelete();
                }
                else if (this.ctx.isAfterUndelete()) {
                    handler.doAfterUndelete();
                }
            }
        } catch (Exception e) {
            this.addErrors(e.getMessage());
        }
    }

    /**
    * Used to disable triggers in tests. This is good for generating test data without having to deal with impacts 
    * of other triggers, which makes unit tests less brittle
    * @param shouldExecute Whether or not triggers should execute
    * @return void 
    **/
    public void shouldExecuteHandlers(Boolean shouldExecute) {
        if (!System.Test.isRunningTest()) {
            throw new TriggerDispatcherException(CANNOT_DISABLE_TRIGGERS);
        }
        this.executeHandlers = shouldExecute;
    }
    

    /**
     * Helper for adding errors to all records 
     * @param errMsg the error message to all records
     * @return void
     */
    private void addErrors(String errMsg) {
        // delete triggers only have access to old, everything else can access new
        if (this.ctx.isBeforeDelete() || this.ctx.isAfterDelete()) {
            for (SObject record : this.ctx.getTriggerOld()) {
                this.ctx.addError(record, errMsg);
            }
        } else {
            for (SObject record : this.ctx.getTriggerNew()) {
                this.ctx.addError(record, errMsg);
            }
        }
    }
}
