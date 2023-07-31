public class AccountTriggerHandler{
    public static void countAccountForUser(Boolean isUpdate,List<Account> accList,Map<Id,Account> newAccMap, Map<Id,Account> oldAccMap){
        Map<Id,Id> accIdUserIdMap = new Map<id,Id>();
        Map<id,List<Account>> ownerIdvsaccMap = new Map<id,List<Account>>();
        Map<Id,user> userMap = new Map<Id,User>();
        
        for(Account acc: accList){
            if(isUpdate && acc.ownerId != oldAccMap.get(acc.Id).ownerId){
                accIdUserIdMap.put(acc.Id, acc.ownerId);
            }
            else{
                accIdUserIdMap.put(acc.Id, acc.ownerId);
            }
        }
        for(Account acc: [SELECT id,ownerId FRoM Account where ownerid IN: accIdUserIdMap.values()]){
            if(ownerIdvsaccMap.containskey(acc.ownerId)){
                ownerIdvsaccMap.get(acc.ownerId).add(acc);
            }
            else{
                ownerIdvsaccMap.put(acc.ownerId,new List<Account>{acc});
            }
        }
        for(User user: [SELECT id,Account_count__c FROM User Where id IN : ownerIdvsaccMap.keyset()]){
            user.Account_count__c=ownerIdvsaccMap.get(user.id).size();
            userMap.put(user.Id,user);
        }
        if(!userMap.isEmpty()){
            update userMap.values();
        }
    }
    /* Map deleted account into account archieves*/

    public static void mapAccountToAccountArchieves(Map<Id,Account> accMap){
        Map<Id,Account_Achieve__c> accountAchieveToBeCreated = new  Map<Id,Account_Achieve__c>();
        Map<Id,Account_Achieve__c> accountAchieveToBeDeleted = new  Map<Id,Account_Achieve__c>();
        StaticResource fieldMappingResource = [SELECT Id, body
                                  FROM StaticResource 
                                  WHERE Name = 'Account_Field_Mapping'
                                  LIMIT 1];

        string Jsonbody= fieldMappingResource.body.tostring();
        Map<string,string> accFieldVsArchieveField = new Map<string,string>();
        accFieldVsArchieveField = (Map<string,string>)JSON.deserialize(Jsonbody, Map<string,string>.class);
        List<Account_Achieve__c> accArchievedList =[SELECT id,Deleted_Account_Name__c FROM Account_Achieve__c];
        for(Account acc:accMap.values()){
            for(Account_Achieve__c aa:accArchievedList){
                    if(acc.Name.equalsIgnoreCase(aa.Deleted_Account_Name__c)){
                        accountAchieveToBeDeleted.put(aa.Id,aa);
                }
            }
            if(!accountAchieveToBeDeleted.isEmpty()){
                break;
            }
            Account_Achieve__c accountArchieved = new Account_Achieve__c();
            for(String field: accFieldVsArchieveField.keySet()){
                
                if(acc.get(field)!=null){
                    system.debug(field+'##'+acc.get(field));
                    accountArchieved.put(accFieldVsArchieveField.get(field).trim(),acc.get(field));
                }
                accountAchieveToBeCreated.put(accountArchieved.Id,accountArchieved);
            }
        }
        if(!accountAchieveToBeCreated.isempty()){
            insert accountAchieveToBeCreated.values();
        }
        if(!accountAchieveToBeDeleted.isEmpty()){
            delete accountAchieveToBeDeleted.values();
        }
    }
}