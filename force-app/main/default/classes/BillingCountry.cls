public class BillingCountry {
       public void sortAccByCountry() {
        // imp methods : get(key) , put(key, value), containsKey(key), keySet(), values()
        // containsKey(key) : used to check whether the key is present in map or not (true / false)
        
        Map<String, List<Account>> mapAccByCountry = new Map<String, List<Account>>();        
        List<Account> lstAccounts = [ SELECT Id, Name, BillingCountry, (SELECT Id, Name, MailingCountry FROM Contacts) FROM Account ];
        
        for(Account objAcc : lstAccounts) {
            Boolean isPresent = mapAccByCountry.containsKey(objAcc.BillingCountry); // India
            if(isPresent) { // isPresent = true
                List<Account> lstAcc = mapAccByCountry.get(objAcc.BillingCountry);
                lstAcc.add(objAcc);
                mapAccByCountry.put(objAcc.BillingCountry, lstAcc);
                
                // OR---------------------
                // Optimized way
                //mapAccByCountry.get(objAcc.BillingCountry).add(objAcc);
                
            } else { // isPresent = false
               	/*List<Account> lstAcc = new List<Account>();
                lstAcc.add(objAcc);
                mapAccByCountry.put(objAcc.BillingCountry, lstAcc);*/
                
                // OR---------------------
                // Optimized way
                mapAccByCountry.put(objAcc.BillingCountry, new List<Account>{objAcc});
            }
        }
        
        // Getting all the keys from map
        Set<String> setCountries = mapAccByCountry.keySet();
        
        /*for(String country : mapAccByCountry.keySet()) {
            
        }*/
        
        // OR ----------------
        
        // setCountries = ( India, USA, France, Australia, Canada )
        for(String country : setCountries) { // Here country variable is a 'key'
            List<Account> lstAcc = mapAccByCountry.get(country);
            Integer count = lstAcc.size();
            System.debug( country + ' : ' + count );           	
            // OR -----------------------        	
            //System.debug( country + ' : ' + mapAccByCountry.get(country).size() );           
        }        
    }
}