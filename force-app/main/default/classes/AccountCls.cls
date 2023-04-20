public with sharing class AccountCls {
    public Account actObj{get;set;}
    public AccountCls() {
        actObj = new Account();
    }
    public pagereference saveAccount(){
        insert actObj;
        return new pagereference('/'+actObj.Id);
    }
}