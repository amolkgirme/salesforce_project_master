trigger TaskTrigger on Task (before delete) {
    if(Trigger.isbefore && Trigger.isdelete){
        //TaskTriggerHandler.systemAdminDelete(Trigger.old);
      }
}