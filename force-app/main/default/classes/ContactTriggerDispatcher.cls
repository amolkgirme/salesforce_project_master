public class ContactTriggerDispatcher {
    // Getting account id into set
    public static Set<Id> sortAccountIds(List<Contact> conList, Boolean isUpdate, Map<Id, Contact> conOldMap) {
        Set<Id> setAccountIds = new Set<Id>();
        
        for(Contact con : conList) {
            if(isUpdate) {
                String oldAccId = conOldMap.get(con.Id).AccountId;
                // Here we are adding old AccountId and New AccountId in case of updation
                setAccountIds.add(oldAccId);
                setAccountIds.add(con.AccountId);
            } else {
                setAccountIds.add(con.AccountId);
            }                            	
        }
        return setAccountIds;
    }
        
}