trigger OpportunityTriggerLatest on Opportunity (after insert, after update, after delete, after undelete) {
    List<opportunity> oppList = Trigger.isDelete ? Trigger.old : Trigger.new;
    if(Trigger.isafter){
        set<id> AccIdset=OppoTriggerDispatcher.sortAccId(Trigger.new, Trigger.oldMap, Trigger.isupdate);
        if(!AccIdset.isEmpty()){
            OppoTriggerHandler.countOpportunity(AccIdSet);
        }
    }

}