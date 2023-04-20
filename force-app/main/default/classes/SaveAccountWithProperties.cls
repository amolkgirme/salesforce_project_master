public with sharing class SaveAccountWithProperties {
    public String AccountName{get; set;}
    public String AccountType{get; set;}
    
    public pagereference saveAccount(){

        Account actObj = new  Account();
        actObj.Name = accountName;
        actObj.Type = accountType;
        insert actObj;
        return new pagereference('/'+actObj.Id);
    }
}