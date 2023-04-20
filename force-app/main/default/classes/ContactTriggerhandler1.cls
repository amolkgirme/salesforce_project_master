public class ContactTriggerhandler1{
    /*public static void mapPicklist(set<id> AccountId){
        List<Account> accList = new List<Account>();
        
        for(Account acc : [SELECT name, id, (SELECT id, Lastname, AccountId, States__c FROM contacts) FROM Account where id IN : AccountId]){
            set<String> stateset = new set<string>();
            for(contact con : acc.contacts){
                if(con.States__c!=null){
                    stateset.addAll(con.States__c.split(';'));
                }
                
            }
            acc.Contact_States__c=string.join(new List<string>(stateset),';');
         	accList.add(acc);
         }
        system.debug(accList);
        update accList;
      }*/
}