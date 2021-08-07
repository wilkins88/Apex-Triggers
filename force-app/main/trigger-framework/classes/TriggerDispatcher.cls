/**
 * Primary dispatcher for routing trigger logic. 
 * Generally created from the TriggerDispatcherFactory.
 * The dispatch method should be invoked directly from the triggers.
**/
public inherited sharing class TriggerDispatcher {

    @TestVisible
    private static final String CANNOT_DISABLE_TRIGGERS = 'Can only disable triggers in a test context.';

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
    @TestVisible
    private Boolean executeHandlers {
        get {
            if (executeHandlers == null) {
                return true;
            }
            return executeHandlers;
        } set;
    }

    public TriggerDispatcher(TriggerContext ctx, List<ITriggerHandler> handlers) {
        this.ctx = ctx;
        this.handlers = handlers;
    }

    /**
    * Dispatches the trigger handlers for the provided sObjectType
    * @param sObjType The type of sObject e.g. Account to run triggers for
    * @return void 
    **/
    @SuppressWarnings('PMD.CognitiveComplexity')
    public void dispatch() {
        if (!executeHandlers) {
            return;
        }
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
    }

    /**
    * Used to disable triggers in tests. This is good for generating test data without having to deal with impacts 
    * of other triggers, which makes unit tests less brittle
    * @param shouldExecute Whether or not triggers should execute
    * @return void 
    **/
    public void shouldExecuteHandlers(Boolean shouldExecute) {
        if (!System.Test.isRunningTest()) throw new TriggerDispatcherException(CANNOT_DISABLE_TRIGGERS);
        this.executeHandlers = shouldExecute;
    }
}
