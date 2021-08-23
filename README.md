# Apex Triggers [![CircleCI](https://circleci.com/gh/wilkins88/Apex-Triggers.svg?style=svg)](https://circleci.com/gh/wilkins88/Apex-Triggers)

Framework for buildings scalable, modular, and testable trigger implementations. This includes mocks for testing various trigger contexts as well as mechanisms to support proper unit and integration testing.

# Installing Source

## Installing unlocked package

If there is little need to customize the framework, an unlocked package may be the best path. This code can be installed as an unlocked package [here](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000Jj9UAAS)

For more information on unlocked packages are the right solution, refer to the [unlocked package documentation](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_unlocked_pkg_intro.htm)

## Download source

If you anticipate making changes to the framework to tailor it to your own needs, then the best path may be to download the source as a zip, extract the files, and move them into your project.

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
  TriggerDispatcherFactory.create(Account.getSObjectType()).dispatch();
}

```

## Creating a new Trigger Handler

Trigger handlers should extend the base virtual class TriggerHandler, and only need to override methods necessary to support business logic.

```java
public class MyTriggerHandler extends TriggerHandler {
  public override void doBeforeInsert() {
    for (Account a : (List<Account>)this.ctx.getTriggerNew()) {
      // do trigger logic
    }
  }
}
```

## Disabling Triggers

There may be several cases for which you want to intelligently disable triggers from code:

- Disable triggers for test data generation
- Disable triggers for ongoing migration or sync jobs
- Disable triggers for specific processes

While these use-cases may be few, and all risks and implications should be heavily considered, disabling triggers is easily done
by invoking the shouldExecuteHandlers static method

```java
TriggerDispatcher.shouldExecuteHandlers(false);// code beyond this will ignore handlers
// ... do some stuff
TriggerDispatcher.shouldExecuteHandlers(true); // code respects trigger logic again
```

### Testing Features

There are several classes and methods that can be used to support testing efforts:

## Limiting Handlers

While mocking dependencies is typically the preferred approach, there may be times when you need to test with a DML operation. In those cases,
it may be useful to test triggers in isolation. this can be done explicitly setting the handlers. SObjectTriggerSettingSelectorMock accepts a mapping that allows control over what handlers can be executed.

```java
SObjectTriggerSettingSelectorMock selectorMock = new SObjectTriggerSettingSelectorMock(new Set<String> { 'MyHandlerName' });
TriggerDispatcherFactory.selector = (SObjectTriggerSettingSelector) System.Test.createStub(SObjectTriggerSettingSelector.class, selectorMock);
```

## Mocking Trigger Context

Often times, we will want to mock trigger contexts to execute true unit tests. Tests that rely on DML are inherently integration tests, because they test
all automation (workflows, validation rules, process builders, etc.) that live on an object. 

There are a set of classes -- 1 parent class with several inner classes -- which can be used to mock various trigger states. To use them in a test, just inject them into the handler:

```java
List<Account> triggerNew = new List<Account> { new Account(Name='Test Account') };
TriggerContext ctx = (TriggerContext)System.Test.createStub(TriggerContext.class, new TriggerContextMocks.BeforeInsertMock(triggerNew));
ITriggerHandler handler = new MyTriggerHandler();
handler.setTriggerContext(ctx); // now you have access to the trigger context which will be passed in via the dispatchr
```

