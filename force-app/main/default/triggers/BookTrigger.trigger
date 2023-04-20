trigger BookTrigger on Book__c (after delete, after undelete) {
    if(Trigger.isAfter && Trigger.isDelete) {
        BookTriggerHandler.createArchievedBooks(Trigger.old);
    }
}