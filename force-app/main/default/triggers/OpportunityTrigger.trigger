trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, after undelete) {
    
    if(Trigger.isafter && Trigger.isinsert || Trigger.isUpdate){
        //OpportunityTriggerHandler.populateOppStageToAccStage(Trigger.new);
    }
    List<Opportunity> oppList = Trigger.isdelete ? Trigger.old : Trigger.new;
    if(Trigger.isafter){
        set<Id> setAccountID = OpportunityDispatcher.getAccID(oppList,Trigger.oldMap, Trigger.isUpdate );
        if(!setAccountID.isempty()){
            //OpportunityTriggerHandler.getOppNamesOnAccount(setAccountID);
            //OpportunityTriggerHandler.countOppo(setAccountID);
       }
    }
}