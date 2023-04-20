public class TestDataFactory {
    Public static Account_Relation__c createAccReldata(string Acclookup, id Accountid){
        Account_Relation__c accRelObj = new Account_Relation__c();
        accRelObj.AccLookup__c=Accountid;
        accRelObj.Rel_name__c=Acclookup;
        system.debug('AccRelobj : : '+AccRelObj);
        return AccRelObj;
    }
}