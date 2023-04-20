trigger EmployeeTrigger on Employee__c (before insert) {
    if(Trigger.isbefore && Trigger.isinsert){
        EmployeeTriggerHandler.selectCorrectAutonumber(Trigger.new);
    }

}