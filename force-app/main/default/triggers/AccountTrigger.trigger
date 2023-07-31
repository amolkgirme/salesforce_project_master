Trigger AccountTrigger on Account (after insert, after update, after delete, after undelete){
    /*
    1)  Trigger.isInsert    => Trigger.NewMap   || null
    2)  Trigger.isUpdate    => Trigger.NewMap   || Trigger.oldMap
    3)  Trigger.isDelete    =>  NULL || Trigger.oldMap
    3)  Trigger.isUndelete  =>  Trigger.newMap  || NULL
    
    */

    // List<Account> accList = Trigger.isDelete ? Trigger.Old : Trigger.new;
    // if(Trigger.isAfter){
    //      AccountTriggerHandler.countAccountForUser(Trigger.isUpdate,accList,Trigger.newMap,Trigger.oldMap);
    //}
    if(Trigger.isAfter && Trigger.isDelete){
         AccountTriggerHandler.mapAccountToAccountArchieves(Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUndelete){
         AccountTriggerHandler.mapAccountToAccountArchieves(Trigger.NewMap);
    }
    }
