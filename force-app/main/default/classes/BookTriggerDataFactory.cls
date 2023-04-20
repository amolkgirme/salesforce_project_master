@isTest
public class BookTriggerDataFactory {
    Public static Book__c createBookData(String Name,Decimal Price, String Author,String Publication){
        BooK__c objBook = new Book__c();
        objBook.Name=Name;
        objBook.Price__c=Price;
        objBook.Author__c=Author;
        objBook.Publication__c=Publication;
        return objBook;
        
    }
    
    
    
    
}