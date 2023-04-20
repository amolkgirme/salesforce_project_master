public class EmployeeTriggerHandler {
    public static void selectCorrectAutonumber(List<Employee__c> EmployeeList){
      List<Employee__c>  eList1= [SELECT id FROM Employee__c where role__c='Admin'];
      List<Employee__c>   eList2= [SELECT id FROM Employee__c where role__c='Developer'];
        for(employee__c e:EmployeeList){
            if(e.role__c=='Admin'){
                e.Autonumber__c='SA-00'+(eList1.size()+1);
            }else{
                e.Autonumber__c='SD-00'+(eList2.size()+1);
            }
        
     }
   }    
}