trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update) {
    //Trigger_setting__c  objTriggerSetting = Trigger_setting__c.getInstance('AccountTrigger');
    if(Trigger_setting__c.getInstance('AccountTrigger')!=Null && Trigger_setting__c.getInstance('AccountTrigger').is_Active__c==True){
        if(Trigger.isafter && Trigger.isInsert){
            //AccountTriggerHandler.updateContactName(Trigger.new);
            
        }
        if(Trigger.isbefore && Trigger.isdelete){
            //AccountTriggerHandler.preventDelete(Trigger.old);
        }
        if(Trigger.isafter && Trigger.isupdate){
            //AccountTriggerHandler.updateContactPhone(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isbefore &&(Trigger.isinsert || Trigger.isupdate)){
            //AccountTriggerHandler.populateBillingAddress(Trigger.new);
        }
        if(Trigger.isafter && Trigger.isupdate){
            //AccountTriggerHandler.populateAccountStageToOpportunity(Trigger.new);
            //AccountTriggerHandler.deleteContact(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate)){
            //AccountTriggerHandler.preventDuplicationOfAccount(Trigger.new);
            
        }
        if(Trigger.isafter && Trigger.isinsert || Trigger.isupdate){
            //AccountTriggerHandler.updateOpportunity(Trigger.new, Trigger.oldMap);
        }        
    }
    
}