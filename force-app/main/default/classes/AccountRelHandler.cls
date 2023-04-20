public class AccountRelHandler {
    public static List<Account_Relation__C> createAccRelation(List<Account> accList){
        List<Account_Relation__c> AccRelList = new List<Account_relation__c>();
        Map<id,Account> accMap = new Map<id,Account>(accList); 
        for(Account acc: accList){
            if(acc.AccLookups__r.isempty()){
                string Name=accMap.get(acc.id).Name+' Relation';
                system.debug('Name : '+name+' , '+' acc.id '+acc.id);
               accRelList.add(TestDataFactory.createAccReldata(Name ,acc.id));
            }
        }
        return AccRelList;
        
    }

}