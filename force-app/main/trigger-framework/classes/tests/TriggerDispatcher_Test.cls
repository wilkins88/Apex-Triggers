@IsTest
private inherited sharing class TriggerDispatcher_Test {
    @IsTest
    private static void dispatch_beforeInsert_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeInsertMock(null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeInsert);
    }

    @IsTest
    private static void dispatch_beforeUpdate_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeUpdateMock(null, null, null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeUpdate);
    }

    @IsTest
    private static void dispatch_beforeDelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeDeleteMock(null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.beforeDelete);
    }

    @IsTest
    private static void dispatch_afterInsert_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterInsertMock(null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterInsert);
    }

    @IsTest
    private static void dispatch_afterUpdate_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterUpdateMock(null, null, null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterUpdate);
    }

    @IsTest
    private static void dispatch_afterDelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterDeleteMock(null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterDelete);
    }

    @IsTest
    private static void dispatch_afterUndelete_finishExecution() {
        TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.AfterUndeleteMock(null, null));

        TriggerDispatcher dispatcher = new TriggerDispatcher(ctx, new List<ITriggerHandler> { new TriggerHandlerMock() });
        System.Test.startTest();
        dispatcher.dispatch();
        System.Test.stopTest();

        List<ITriggerHandler> handlers = dispatcher.handlers;
        TriggerHandlerMock handler = (TriggerHandlerMock)handlers[0];
        System.assertEquals(true, handler.afterUndelete);
    }
}
