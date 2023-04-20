public class AccountTriggerHandler {
    public static boolean isFirstRun =True;
    // Description: create contact with name smriti sharan after creating a account with more than 50000 Annual revenue
    // Date : 26th Jan 2022
    // Created by : Amol Girme
    // issue No. : ASD0D201
    public static void updateContactName(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList){
            if(acc.AnnualRevenue>50000){
                //contact con = new Contact();
                //con.FirstName ='Smriti';
                //con.LastName ='Sharan';
                //con.AccountId=acc.Id;
                conList.add(new contact(FirstName='Smriti', LastName='Sharan',AccountId=acc.Id));
            }
        }
        if(!conList.isempty()){
            insert conList;
        }
        
    }
    /* Prevent deletion of account if it is associated with 2 or more contacts */
    public static void preventDelete(List<Account> accList){
        Set<id> accIdSet = new Set<id>();  
        for(Account acc : accList)  
        {  
            accIdSet.add(acc.id);  
        }  
        
        Map<Id, Account> accMap = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accIdSet]);
        
        for(Account acc : accList)
        {
            if(accMap.get(acc.id).contacts.size()>=2)
            {
                acc.adderror('Account cannot be deleted');
            }
        }                                       
    }
    /* Description : Whenever Account phone is modified then update contact record with phone field 
( phone with old value and homephone with new value) associated with account records */
    // Date : 30th Jan 2022
    // Created by : Amol Girme
    // issue No. : ASD0D202
    public static void updateContactPhone(List<Account> accList, Map<id, Account> accMap){
        set<id> AccIdSet = new set<id>();
        for(Account acc:accList){
            AccIdSet.add(acc.id);
        }
        List<Contact> conList = new List<Contact>();
        for(Account acc : [SELECT id, phone, (SELECT ID FROM contacts) FROM Account WHERE id IN : AccIdSet ]){
            for(Contact con : acc.contacts){
                if(acc.phone!=accMap.get(acc.id).phone){
                    con.Phone=acc.phone;
                    con.HomePhone=accMap.get(acc.id).phone;
                    conList.add(con);
                    system.debug('new phone == '+con.phone+' && old Phone == '+con.HomePhone);
                }
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    /* Description : when billing address is inserted ,populate shipping address with billing address */
    // Date : 6th Feb 2022
    // Created by : Amol Girme
    // issue No. : ASD0D203
    public static void populateBillingAddress(List<Account> accList){
        for(Account acc : accList){
            acc.ShippingStreet=acc.BillingStreet;
            acc.ShippingCity=acc.BillingCity;
            acc.ShippingState=acc.BillingState;
            acc.ShippingPostalCode=acc.BillingPostalCode;
            acc.ShippingCountry=acc.BillingCountry;
            
        }
    }
    public void evaluateAccount() {
        List<Account> accList = [SELECT Name, id FROM Account];
        set<id> AccIDSet = new set<id>();
        for(Account acc : accList){
            AccIdSet.add(acc.id);
        }
        for(Account_Relation__c rel :[SELECT name, id FROM Account_Relation__c WHERE AccLookup__c IN : AccIDSet]){
            
        }
    }
    public static void populateAccountStageToOpportunity(List<Account> accList){
        List<opportunity> oppList = new List<opportunity>();
        set<ID> accIdset = new set<ID>();
        for(Account acc :accList){
            accIDset.add(acc.id);
        }
        for(Account acc: [SELECT id , Stage__c,  (SELECT id, OppoStage__c FROM opportunities) FROM Account WHERE id IN : accIDset]){
            if(acc.Stage__c!=Null){
                for(Opportunity opp: acc.opportunities){
                    opp.OppoStage__c=acc.Stage__c;
                    opplist.add(opp);
                }
            }
        }
        if(!oppList.isempty()){
            update oppList;
        }
    }
    public static void preventDuplicationOfAccount(List<Account> newAccList){
        set<string> accNameSet = new set<String>();
        for(Account acc :[Select Name, id From Account]){
            if(acc.Name!=Null){
                accNameSet.add(acc.Name);
            }
        }
        for(Account acc: newAccList){
            if(accNameSet.contains(acc.name))
            {
                acc.Name.adderror('Account with this name already present');
                
            }	
        }
        
    }
    Public static void updateOpportunity(List<Account> accList, Map<id, Account> accOldMap){
        List<opportunity> oppList = new List<opportunity>();
        set<id> AccidSet = new set<id>();
        for(Account acc : accList){
            if(string.isnotblank(acc.id) ){
                AccidSet.add(acc.id);
            }
            else if(acc.retailOwner__c!=accOldMAp.get(acc.id).retailOwner__c){
                AccidSet.addAll(accOldMAp.keyset());
            }
            
        }
        for(Account acc :[SELECT id, retailOwner__c, (SELECT id, retailOwner__c, Accountid FROM opportunities)FROM Account 	WHERE id IN : AccidSet]){
            for(opportunity opp : acc.opportunities){
               
                    opp.retailOwner__c = acc.retailOwner__c;
                	opp.AccountId=acc.id;
                    oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
        
    }
    public static void deleteContact(List<Account> accList, Map<Id, Account> accMap){
        set<id> AccountIdset= new  set<id>();
        List<Contact> conList= new List<Contact>();
        
        for(Account acc:accList){
            if(acc.status__c!=accMap.get(acc.id).status__c){
                AccountIdset.add(acc.id);
            }
        }
        for(Account acc:[SELECT id, Status__C,(SELECT id, AccountID FROM contacts) FROM Account WHERE id IN:AccountIDset]){
            conList.addAll(acc.contacts);
        }
        delete conList;
      }
}