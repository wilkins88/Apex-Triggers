# Apex Triggers [![CircleCI](https://circleci.com/gh/wilkins88/Apex-Triggers.svg?style=svg)](https://circleci.com/gh/wilkins88/Apex-Triggers)

Framework for buildings scalable, modular, and testable trigger implementations. This includes mocks for testing various trigger contexts as well as mechanisms to support proper unit and integration testing.

## Configuring Handlers

### Configuring the SObject Trigger

Navigate to Setup -> Custom Metadata -> SObject Trigger Setting -> Manage SObject Trigger Settings

Create or update a record (example):
Label: Account Trigger Setting
Name: Account Trigger Setting
IsActive__c: True
SObjectType__c: Account

**Note** To deactivate all trigger handlers for a particular sObject, then the IsActive Flag on the SObject Trigger Setting can be marked as false.

### Configuring a Trigger Handler

Navigate to Setup -> Custom Metadata -> Trigger Handler Setting -> Manage Trigger Handler Settings

Create or update a record (example):
Label: Account Trigger Setting
Name: Account Trigger Setting
IsActive__c: True
ClassName__c: MyTriggerHandler (the name of the class that this config maps to, see more below)
SObjectTriggerSetting__c: Account Trigger Setting

**Note** Individual handlers should be activated/deactivated here

### Developing with the Framework

## Setting up a .trigger file

Create a new trigger file e.g. AccountTrigger.trigger and set it to fire for all trigger events

```java
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
  (new TriggerDispatcher(new TriggerContext(), new SObjectTriggerSettingSelector())).dispatch(Account.getSObjectType());
}

```

## Creating a new Trigger Handler

Trigger handlers should extend the base virtual class TriggerHandler, and only need to override methods necessary to support business logic.

```java
public class MyTriggerHandler extends TriggerHandler {
  public override void doBeforeInsert() {
    for (Account a : (List<Account>)this.ctx.triggerNew) {
      // do trigger logic
    }
  }
}
```

As mentioned before, each feature like this adds tech debt, so it may be worth capturing that as a part of your process. Deeply nested feature flags can become cumbersome and difficult to read, so having tech debt tickets to go back and clean up flags that are no longer needed may be good.

### Testing Features

There are several classes and methods that can be used to support testing efforts:

## Disabling Triggers

To disable triggers, which can be useful for generating test data without needing to run through all other triggers (making unit tests brittle, and hardly unit tests) the call the shouldExecuteHandlers method on the TriggerDispatcher object.

```java
TriggerDispatcher disp = new TriggerDispatcher(new TriggerContext(), new SObjectTriggerSettingSelector());
disp.shouldExecuteHandlers(false); // this will now ignore handlers
```

## Limiting Handlers

Another useful capability is the ability to test triggers in isolation. this can be done by mocking handlers. SObjectTriggerSettingSelectorMock accepts a mapping that allows control over what handlers can be executed.

```java
Map<String, Object> settingMap = new Map<String, Object>();
settingMap.put('SObjectType__c', 'Account');
Map<String, Object> handlers = new Map<String, Object>();
handlers.put('totalSize', 1);
handlers.put('done', true);
handlers.put('records', new List<Map<String, Object>> { new Map<String, Object> {
    'IsActive__c' => true,
    'ClassName__c' => 'TriggerDispatcher_Test.TriggerHandlerMock'
}});
SettingMap.put('TriggerHandlerSettings__r', handlers);
Map<String, List<SObjectTriggerSetting__mdt>> settings = new Map<String, List<SObjectTriggerSetting__mdt>> {
    'Account' => new List<SObjectTriggerSetting__mdt> {
        (SObjectTriggerSetting__mdt)JSON.deserialize(JSON.serialize(settingMap), SObjectTriggerSetting__mdt.class)
    }
};
return new SObjectTriggerSettingSelectorMock(settings);
```

## Mocking Trigger Context

There are a set of classes -- 1 parent class with several inner classes -- which can be used to mock various trigger states. To use them in a test, just inject them into the handler:

```java
List<Account> triggerNew = new List<Account> { new Account(Name='Test Account') };
TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeInsertMock(triggerNew));
ITriggerHandler handler = new MyTriggerHandler();
handler.setTriggerContext(ctx); // now you have access to the trigger context which will be passed in via the dispatchr
```

