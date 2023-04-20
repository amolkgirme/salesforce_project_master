trigger ContactTrigger1 on Contact (after insert,after update,after delete,after undelete) {
    List<Contact> conList = Trigger.isdelete? Trigger.old : Trigger.new;
    if(Trigger.isafter){
        //set<id> accountidset=ContactTriggerDispatcher1.sortAccountid(Trigger.new, Trigger.oldMap, Trigger.isupdate);
        //ContactTriggerHandler1.mapPicklist(AccountIdset);
    }
    
    
}