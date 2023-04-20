public class ContactTriggerHelper {
    public static void countContactOnAcc(Set<Id> setAccIds) {
        List<Account> lstAcc = new List<Account>();
        
        for( Account acc : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : setAccIds] ) {
            // List<Contact> lstCon = acc.Contacts;
            acc.Total_Contacts__c = acc.Contacts.size();
            lstAcc.add(acc);
        }
        
        if(!lstAcc.isEmpty()) {
            update lstAcc;
        }
    }
    
    public static void rollUpContactNamesOnAcc(Set<Id> setAccIds) {
        List<Account> lstAcc = new List<Account>();
        
        // Getting the account related to the contacts being inserted / updated / deleted
        for( Account acc : [SELECT Id, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN : setAccIds] ) {
            List<String> lstNames = new List<String>();
            //String strNames = '';
            
            if(acc.Contacts.size() > 0) {
                // Here, we are iterating all the contacts related to the perticualr account one-by-one
                for(Contact con : acc.Contacts) {
                    // adding contact's name into list to roll-up names on account
                    lstNames.add(con.Name);
                    //strNames = strNames + ',' + con.Name;
                }
                // String.join() is standard method to which is used to join each elements from list with specified seperator (For Ex., ',' , ';' , '-')
                acc.All_Related_Contacts__c = String.join(lstNames, ',');
                //acc.All_Related_Contacts__c = strNames.removeEnd(',').removeStart(',');
            } else {
                acc.All_Related_Contacts__c = '';
            }
            lstAcc.add(acc);
        }
        
        if(!lstAcc.isEmpty()) {
            // Finally updating accounts
            update lstAcc;
        }
        
    }
    
    // Counting max amount of contact and updating it on related account
    public static void countMax(Set<Id> setAccIds) {
        
        List<Account> lstAcc = new List<Account>();
        
        // Getting the account related to the contacts being inserted / updated / deleted
        for( Account acc : [SELECT Id, (SELECT Id, Amount__c FROM Contacts) FROM Account WHERE Id IN : setAccIds] ) {
            // Proceedin if account has at least 1 contact related
            if(!acc.Contacts.isEmpty()) {
                // setting 1st element's value from 0th position
                Decimal maxValue = acc.Contacts[0].Amount__c;
                //Decimal minValue = acc.Contacts[0].Amount__c;
                
                // Iterating contacts if size is more than 1 element
                if(acc.Contacts.size() > 1) {
                    // iterating all the contacts related to a perticular account
                    for(Integer i = 1; i < acc.Contacts.size(); i++) {
                        if(acc.Contacts[i].Amount__c > maxValue) {
                            maxValue = acc.Contacts[i].Amount__c;
                        }
                        /*if(acc.Contacts[i].Amount__c < minValue) {
minValue = acc.Contacts[i].Amount__c;
}*/
                    }                
                }
                acc.Max_Amount__c = maxValue;
                //acc.Min_Amount__c = minValue;
                lstAcc.add(acc);
            }
        }
        
        // updating records
        if(!lstAcc.isEmpty()) {
            update lstAcc;
        }
    }
    
    // Counting min amount of contact and updating it on related account
    public static void countMin(Set<Id> setAccIds) {
        List<Account> lstAcc = new List<Account>();
        // Getting the account related to the contacts being inserted / updated / deleted
        for( Account acc : [SELECT Id, (SELECT Id, Amount__c FROM Contacts) FROM Account WHERE Id IN : setAccIds] ) {
            // Proceedin if account has at least 1 contact related
            if(!acc.Contacts.isEmpty()) {
                // setting 1st element's value from 0th position
                Decimal minValue = acc.Contacts[0].Amount__c!=Null ?acc.Contacts[0].Amount__c: 0;
                Decimal total = acc.Contacts[0].Amount__c!=Null ?acc.Contacts[0].Amount__c: 0;
                // Iterating contacts if size is more than 1 element
                if(acc.Contacts.size() > 1) {
                    // iterating all the contacts related to a particular account
                    for(Integer i = 1; i < acc.Contacts.size(); i++) {
                        if(acc.Contacts[i].Amount__c < minValue) {
                            minValue = acc.Contacts[i].Amount__c;
                        }
                        total = total + acc.Contacts[i].Amount__c;
                    }                
                }
                
                acc.Min_Amount__c = minValue;
                acc.Total_Amount__c = total;
                acc.Avg_Amount__c = (total/acc.Contacts.size());
                lstAcc.add(acc);
            }
        }
        
        // updating records
        if(!lstAcc.isEmpty()) {
            update lstAcc;
        }
    }
    public static void sendEmailToContact(List<Contact> conList){
        List<messaging.SingleEmailMessage> mails = new List<messaging.SingleEmailMessage>();
        for(contact con : conList){
            if(con.Email!= Null && con.FirstName!= null){
                system.debug(con.Email);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(con.Email);
                mail.setToAddresses(sendTo);
                mail.setSubject('Regarding your order');
                String body = 'Hi '+' '+con.FirstName+',<br> Your order has been proceed<br> Order detais are below <br> Product name = MiVi pendrive <br>Thanks <br>';
                mail.setHtmlBody(body);
                mail.setReplyTo('ms');
                mails.add(mail);
                system.debug(mails);
            }
            
        }
        messaging.sendEmail(mails);
        
    }
    public static void uniquePhoneEmail(List<Contact> conNewList, Map<ID, Contact> conOldMap){
        set<String> phoneSet = new set<string>( );
        for(contact con : [SELECT id, email, phone FROM contact]){
            
            if(con.Phone != Null){
                phoneSet.add(con.phone);
                system.debug(phoneset);
            }
            
        }
        for(contact con : conNewList){
            if(con.Phone!=conOldMap.get(con.id).Phone){
                if(phoneSet.contains(con.Phone)){
                    con.phone.addError('This Phone number is already present '); 
                }
            }   
        }
    }
    Public static Void deleteDuplicateContact(List<Contact> conList){
        List<Contact> DeleteConList = new List<Contact>();
        set<String> ConLNSet = new set<String>();
        for(Contact con : conList){
            ConLNSet.add(con.LastName);
        }
        for(contact con : [SELECT id, LastName FROM Contact Where LastName IN : ConLNSet]){
            DeleteConList.add(con);
        }
        if(!DeleteConList.isEmpty()){
            delete DeleteConList;
        }
        
        
    }     
        
}