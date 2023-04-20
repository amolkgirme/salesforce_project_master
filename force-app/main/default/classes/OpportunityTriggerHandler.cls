public class OpportunityTriggerHandler {
    
    /* Take picklist with value 'New' and 'Old' on Account and Opportunity.
* If All oportunity OppoStage__c became 'New' make Account Stage__c ='New' 
And If All oportunity OppoStage__c became 'Old' make Account Stage__c ='Old'
otherwise keep it blank */
    
    public static void populateOppStageToAccStage(List<Opportunity> oppNewList){
        List<Account> accList = new List<Account>();
        set<Id> Accsetid = new set<ID>( );
        for(Opportunity opp : oppNewList){
            Accsetid.add(opp.AccountID);
        }
        
        for(Account acc : [SELECT ID, Stage__c, (SELECT ID, OppoStage__c FROM opportunities) 
                           FROM Account WHERE ID IN : Accsetid]){
                               integer i=0;
                               list<opportunity> oppList = acc.opportunities;
                               Boolean AreAllSame = True;
                               for(i=0; (i<oppList.size()-1); i++){
                                   if(oppList[i].OppoStage__c!=oppList[i+1].OppoStage__c){
                                       AreAllSame=false;
                                   }
                               }
                               if(AreAllSame){
                                   acc.Stage__c=oppList[i].OppoStage__c;
                               }else{
                                   acc.Stage__c='';
                               }
                               
                           }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void countOppo(Set<Id> setAccId){
        system.debug(setAccID);
        List<Account> accList = new List<Account>();
        for(Account acc: [SELECT ID ,opp_Count__c,(SELECT ID FROM opportunities) FROM Account where ID IN : setAccID ]){
            acc.opp_Count__c=acc.opportunities.size();
            system.debug('Size ::'+acc.opportunities.size());
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }	
        
    }
    
    //RollUpSummary : : namesofOpportunity on Account
    
    Public static void getOppNamesOnAccount(set<Id> setAccID){
        List<Account> accList = new List<Account>( );
        List<String> oppName = new List<String>();
        for(Account acc : [SELECT Id ,(SELECT ID, Name FROM opportunities) From Account Where ID IN : setAccID ]){
            if(acc.opportunities.size()>0){
                for(Opportunity opp: acc.opportunities){
                    oppName.add(opp.Name);
                }
                acc.NameOfOpportunity__c = String.join(oppName, ',');
            }
            else{
                acc.NameOfOpportunity__c='';
            }
            accList.add(acc);
            
        }
        if(!accList.isempty()){
            system.debug('accList::'+accList);
            update accList;
        }
    }
}