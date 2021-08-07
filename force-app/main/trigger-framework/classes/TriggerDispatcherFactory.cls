/**
 * Factory class responsible for generating the trigger dispatcher for a provided sobject type
 */
public inherited sharing class TriggerDispatcherFactory {
    
    @TestVisible
    private static Map<String, List<ITriggerHandler>> loadedHandlers {
        get {
            if (loadedHandlers == null) {
                loadedHandlers = new Map<String, List<ITriggerHandler>>();
            }
            return loadedHandlers;
        }
        set;
    }

    @TestVisible
    private static SObjectTriggerSettingSelector selector {
        get {
            if (selector == null) {
                selector = new SObjectTriggerSettingSelector();
            }
            return selector;
        }
        set;
    }

    /**
     * Creates and returns a TriggerDispatcher for the provided SObjectType
     * @param sObjType Schema.SObjectType type of object to return dispatcher for
     * @param shouldThrowError whether or not the error should be added to the record, or if the error should
     * be bubbled up as a hard error. This has impacts details such as cleaner error messages, hiding stack trace details, etc.
     * @return TriggerDispatcher
     */
    public static TriggerDispatcher create(Schema.SObjectType sObjType, Boolean shouldThrowError) {
        String sObjTypeStr = String.valueOf(sObjType);
        List<ITriggerHandler> handlers;
        if (loadedHandlers.containsKey(sObjTypeStr)) {
            handlers = loadedHandlers.get(sObjTypeStr);
        } else {
            handlers = new List<ITriggerHandler>();
            List<SObjectTriggerSetting__mdt> settings = selector.getSObjectTriggerSettings(sObjTypeStr);
            // support multiple settings per sObject here in case you have multiple
            // settings split across multiple packages that get 
            for (SObjectTriggerSetting__mdt sObjectSetting : settings) {
                for (TriggerHandlerSetting__mdt handlerSetting : sObjectSetting.TriggerHandlerSettings__r) {
                    ITriggerHandler handler = (ITriggerHandler)Type.forName(handlerSetting.ClassName__c).newInstance();
                    handlers.add(handler);
                }
            }
            // place in a static var for reuse in the event of some amount of recursive dives
            // can potentially replace with a caching framework and hot swap static caches like this with
            // platform caches or other elements
            loadedHandlers.put(sObjTypeStr, handlers);
        }
        TriggerContext ctx = new TriggerContext();
        return new TriggerDispatcher(ctx, handlers, shouldThrowError);
    }
}
