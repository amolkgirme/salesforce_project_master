public class OpportunityDispatcher {
    /*public static void sortupdateAccRating(List<Opportunity> oppList){
        set<id> accidset = new set<id>();
        for(Opportunity opp : oppList){
            accidset.add(opp.Accountid);
            
        }
        if(!accidset.isempty()){
            OpportunityTriggerHandler.updateAccRating(accidset); 
        }
        
    }*/
 
        public static Set<Id> getAccID(List<Opportunity> oppList, Map<ID, Opportunity> oppOldMap , Boolean isUpdate){
            Set<ID>  setAccountID = new set<Id>();
            for(Opportunity opp : oppList){
                
                if(isUpdate){
                    setAccountId.add(opp.AccountID);
                    setAccountId.add(oppOldMap.get(opp.Id).AccountID);
                    
                }else{
                    setAccountId.add(opp.AccountID);
                }
            }
            return setAccountID;
            
        }
    
}