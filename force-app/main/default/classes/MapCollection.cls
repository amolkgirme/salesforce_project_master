public class MapCollection {
    /*public void Deleted(){
        List<Country_count__c> ccList = [SELECT name, id, Record_count__c,Account_Lookup__c FROM Country_count__c LIMIT 150];
        delete ccList;
    }*/
    public void createCountryCount(){
        List<Country_count__c> ccList = new List<Country_count__c>() ;
        //system.debug(ccList.size()+'==='+ccList);
        Map<String,List<Contact>> conMap; //= new Map<String,List<Contact>>();
        //system.debug(conMap.size()+'==='+conMap);
        for(Account acc :[SELECT id,(SELECT id, Mailingcountry FROM Contacts WHERE MailingCountry !=Null) FROM Account  ]){
            conMap = new Map<String,List<Contact>>();
            system.debug(acc.id);
            //system.debug(conMap.size()+'==='+conMap);
            
            for(contact con : acc.contacts){
                if(conMap.containskey(con.MailingCountry)){
                    conMap.get(con.MailingCountry).add(con);
                }
                else{
                    conMap.put(con.MailingCountry,new List<Contact>{con});
                    
                }
              }
            
              
            
            if(!conMap.isempty()){
                for(string country:conMap.keyset()){
                Country_count__c cc = new country_count__c();
                cc.name = country;
                cc.Record_count__c=conMap.get(country).size();
                cc.Account_lookup__c=acc.Id;
                ccList.add(cc);
                 }
              
            }
            system.debug(conMap.size()+'==='+conMap);
         }
        if(!ccList.isempty()){
              system.debug(ccList.size()+'==='+ccList);
              //insert ccList;
        
        }
        
    }

}