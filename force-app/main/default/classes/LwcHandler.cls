public class LwcHandler {
    @AuraEnabled(cacheable = true)
    public static List<contact> getContacts(){
        return [SELECT id, Name, phone FROM Contact];
    }
    @AuraEnabled
    public static List<contact> fetchContacts(){
        return [SELECT id, Name, phone FROM Contact WHERE phone!=Null];
    }
  
     @AuraEnabled
    public static List<Account> searchAccounts(String searchKey){
        try {
            searchKey='%' + searchKey + '%';
            return [SELECT id, Name, Phone, Fax from Account WHERE Name LIKE: searchKey];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}