trigger ContactTrigger on Contact (before insert, before update, after insert, after update, after delete, after undelete) {
    /*if(Trigger.isDelete) {
lstContacts = Trigger.old;
} else {
lstContacts = Trigger.new;
}*/
//     Trigger_Setting__c objConCustomSetting = Trigger_setting__c.getInstance('ContactTrigger');
//     if(objConCustomSetting!=Null && objConCustomSetting.is_Active__c){  // contactTrigger is OFF
//         List<Contact> conList = Trigger.isDelete ? Trigger.old : Trigger.new;
        
//         if(Trigger.isAfter) {
//             Set<Id> setAccountIds = ContactTriggerDispatcher.sortAccountIds(conList, Trigger.isUpdate, Trigger.oldMap);
            
//             if(!setAccountIds.isEmpty()) {            
//                 ContactTriggerHelper.countContactOnAcc(setAccountIds);
//                 ContactTriggerHelper.rollUpContactNamesOnAcc(setAccountIds);
//                 //ContactTriggerHelper.countMax(setAccountIds);
//                 //ContactTriggerHelper.countMin(setAccountIds);
//             }
//         }
//         if(Trigger.isbefore && (Trigger.isinsert|| Trigger.isupdate)){
//             //ContactTriggerHelper.sendEmailToContact(Trigger.new);
//             //system.debug(Trigger.new);
//         }
//         if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate)){
//             //contactTriggerHelper.uniquePhoneEmail(Trigger.new, Trigger.oldMap);
//         }
//         if(Trigger.isbefore && Trigger.isInsert){
// 		//ContactTriggerHelper.deleteDuplicateContact(Trigger.new);
// }	
        
        
//     }
    
}