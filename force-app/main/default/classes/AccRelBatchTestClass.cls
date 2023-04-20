@isTest public class AccRelBatchTestClass {
    @isTest Static void testAccRelation(){
        List<Account> accList = new list<Account>();
        for(integer i=1; i<=20;i++){
            Account acc= new Account();
            acc.Name='Test '+i;
            accList.add(acc);
        }
        insert accList;
        
        
        Test.startTest();
        database.executeBatch(new AccRelBatchClass());
        Test.stopTest();
        
        
       List<Account_Relation__c> arList=[SELECT id FROM Account_Relation__c]; 
        System.assert(!arList.isEmpty());
        system.assertEquals(20, arList.size());
        system.assertNotEquals(30, arList.size());
      
        
        
    }
    
}