public class OppoTriggerDispatcher {
    public static set<id> sortAccId(List<opportunity> oppList, Map<id,opportunity> oppOldMap, Boolean isupdate){
        set<id> AccIdset= new set<id>();
        for(opportunity opp : oppList){
            if(string.isNotBlank(opp.AccountId)){
                AccIdset.add(opp.AccountId);
            }
            if(isUpdate &&  opp.AccountId!=oppOldMap.get(opp.id).AccountId){
                if(string.isNotBlank(oppOldMap.get(opp.id).AccountId)){
                    AccIdSet.add(oppOldMap.get(opp.id).AccountId);
                }
                
            }
        }
        return AccIdset;
    }
    
}