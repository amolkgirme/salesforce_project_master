public class BookTriggerHandler {
    public static void createArchievedBooks(List<Book__c> lstBooks) {
        
        Map<String, String> mapBookMDT = new Map<String, String>();
        List<Archived_Book__c> lstBookArchieveds = new List<Archived_Book__c>();
        
        // Mapping Book object's fields with Book-Archieved object's fields
        for(Book_Setting__mdt record : Book_Setting__mdt.getAll().values()) {
            mapBookMDT.put(record.Source_Field__c, record.Target_Field__c);
        }
        
        for(Book__c objBook : lstBooks) {
            // Creating Target Object
            Archived_Book__c objBookArchieved = new Archived_Book__c();
            
            // Mapping source field values to target field values
            for(String sourceFieldApi : mapBookMDT.keySet()) { // Author_Name__c
                String targetFieldApi = mapBookMDT.get(sourceFieldApi); // Author__c
                objBookArchieved.put(targetFieldApi.trim(), objBook.get(sourceFieldApi)); // ('Author__c', 'C. bahgat')
            }
            lstBookArchieveds.add(objBookArchieved);
            system.debug(objBookArchieved);
        }
        
        if(!lstBookArchieveds.isEmpty()) {
            insert lstBookArchieveds;
        }
    }

}