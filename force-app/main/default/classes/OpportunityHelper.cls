public class OpportunityHelper {
    public static set<string> errorShow(opportunity oppo){
        set<string> errorSet = new set<string>();
        for(opportunity__mdt opp :[select id, Stage__c, version__c, Amount__c FROM opportunity__mdt 
                                   WHERE Stage__c=:oppo.StageName AND version__C=:oppo.OppoStage__c]){
                                       if(oppo.Amount>=opp.Amount__c){
                                           errorset.add('This amount is not expected');
                                       }
             }
         system.debug('errorMessage = '+errorset);
        return errorset;
       
    }

}