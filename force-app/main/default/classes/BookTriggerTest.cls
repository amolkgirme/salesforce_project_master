@isTest
public class BookTriggerTest {
    @isTest Static void createBookArchieved(){
        List<Book__c> BookList = new List<Book__c>();
        integer noOfRecord=20;
        for(integer i=0;i<noOfRecord;i++){
            Book__c objBook = new Book__c();
            objBook=BookTriggerDataFactory.createBookData('MahaBarata',400, 'Chetan Bhagat','Book Ganga');
            bookList.add(objBook);
        }
        system.debug(bookList);
        insert bookList;
       	Integer NoOfBook=bookList.size();
        delete bookList;
        
        //now create book_Archieved__c
        List<Archived_Book__c> archievedList = [SELECT id, Name, Archived_Author__c, Archived_Price__c, Archived_Publication__c
                                                FROM Archived_Book__c];
        system.assert(!archievedList.isEmpty());
        system.assertEquals(NoOfBook, archievedList.size());
        system.assertNotEquals(Null, archievedList);
    }
    
}