public class DMLOpsController {
    // SOQL - Salesforce Object Query Language
    // Clauses = SELECT, FROM, WHERE, LIMIT
    
    // SELECT Id, Name, AccountNumber FROM Account
    // SELECT Id, Name, AccountNumber FROM Account WHERE Id = '0015j00000DAUYv'
    // SELECT Id, Name, AccountNumber FROM Account LIMIT 5
    
    // 29th Dec 2021
    public void fetchBulkAccount() {        
        List<Account> lstAccounts = [ SELECT Id, Name, AccountNumber FROM Account  ];        
        Integer lstSize = lstAccounts.size();
        
        for(Integer i=0; i<lstSize; i++) {
           
            System.debug('Acc : ' + lstAccounts[i].Name + ' ' + lstAccounts[i].Id);            
        }
        
        System.debug('\n-----------------------------------------------------\n');
        
        for(Account objAcc : lstAccounts) {
            System.debug('objAcc : ' + objAcc.Name  + ' ' + objAcc.Id);
        }        
    }
    
    public void fetchBulkAccountDiff() {
        // Fetching records - name contains word (Account)
        List<Account> lstAccounts = [ SELECT Id, Name FROM Account WHERE Name LIKE '%Account%' ];
        printAccount(lstAccounts);  
        
        // Fetching records - name starts with word (Account)
        List<Account> lstAccounts1 = [ SELECT Id, Name FROM Account WHERE Name LIKE 'Account%' ];
        printAccount(lstAccounts1);
        
        // Fetching records - name ends with word (Account)
        List<Account> lstAccounts2 = [ SELECT Id, Name FROM Account WHERE Name LIKE '%Account' ];
        printAccount(lstAccounts2);    
        
        // Fetching 10 records only
        List<Account> lstAccounts3 = [ SELECT Id, Name FROM Account LIMIT 10 ];
        printAccount(lstAccounts3);
        
        // Fetching 5 records only
        List<Account> lstAccounts4 = [ SELECT Id, Name FROM Account LIMIT 15 ];        
        printAccount(lstAccounts4);
    }
    
    public void printAccount(List<Account> lstAccounts) {
        for(Account objAcc : lstAccounts) {
            System.debug('objAcc : ' + objAcc.Name  + ' ' + objAcc.Id);
        }
    }
    
    public void updateBulkAccounts() {
        // Id field is important to update and delete the records
        // [SELECT Id, Name FROM Account WHERE Id =: strId]
        
        List<Account> lstAccounts = new List<Account>();
        
        for(Account acc : [ SELECT Id, Name FROM Account ]) {
            acc.Name = acc.Name + ' Updated';
            lstAccounts.add(acc);
        }
        
        update lstAccounts;
    }

   	// 30th Dec 2021 - Relationship SOQL  ---------------------------------------------
   	
    public void relStatdardSOQL() {
        
        List<Account> lstAccounts = [ SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account ];
        List<Contact> lstContacts = new List<Contact>();
        
        for(Account acc : lstAccounts) {
            acc.Total_Contacts__c = acc.Contacts.size();
            lstContacts.addAll(acc.Contacts);
        }
        
        update lstAccounts;
        System.debug('lstContacts Size : ' + lstContacts.size() );
        
    }
    
    public void customRollUpStandard() {
        Decimal count;
        List<Account> lstAccounts = new List<Account>();
        
        for(Account acc : [ SELECT Id, Name, (SELECT Id, Name, Amount__c FROM Contacts) FROM Account ]) {
            count = 0;
            for(Contact con : acc.Contacts) {
				count = count + con.Amount__c;  
            }
            acc.Sum__c = count;
            lstAccounts.add(acc);
        }        
        update lstAccounts;
    }
    
    // For assignment - 30th Dec 2021
    public void relCustomSOQL() {
        // put your logic here
    }
    
    // For assignment - 30th Dec 2021
    public void createOpportunityFromContact() {
        List<Opportunity> lstOpps = new List<Opportunity>();
        
        for(Account acc : [ SELECT Id, Name, (SELECT Id, Name, Amount__c FROM Contacts) FROM Account ]) {
            for(Contact con : acc.Contacts) {
                Opportunity objOppo = new Opportunity();
                objOppo.Name = con.Name + ' - Oppo';
                objOppo.CloseDate = Date.today();
                objOppo.StageName = 'Prospecting';
                objOppo.Amount = con.Amount__c;
                objOppo.AccountId = acc.Id;
                lstOpps.add(objOppo);
            }            
        }
        insert lstOpps; 
        
    }
    
    // 31st Dec 2021 
    public void demoCollections() {
        
        // set is unordered
        // we cannot access element through index from set
        Set<String> setNames = new Set<String>();
        setNames.add('Harshal');
        setNames.add('amit');
        setNames.add('harshal');
        
        System.debug('setNames : ' + setNames);
        
        // list is ordered
        // we can access element through index from list
        List<String> lstNames = new List<String>();
        lstNames.add('harshal');
        lstNames.add('amit');
        lstNames.add('harshal');
        
        System.debug('lstNames : ' + lstNames);
    }
    

}