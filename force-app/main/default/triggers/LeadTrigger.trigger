trigger LeadTrigger on Lead (before insert, before update, after insert) {
            if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate)){
            //LeadTriggerHandler.updateRating(trigger.new);
            //LeadTriggerHandler.uniqueEmail(Trigger.new); 
        }
    if(Trigger.isbefore && Trigger.isinsert && LeadTriggerHandler.isFirstRun){
        LeadTriggerHandler.isFirstRun=False;
        
	//LeadTriggerHandler.createDuplicateLead(Trigger.new); 
	}
}