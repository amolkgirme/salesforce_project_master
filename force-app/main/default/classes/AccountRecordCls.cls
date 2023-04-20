public with sharing class AccountRecordCls {
    public List<Account> accountList{get;set;}
    public AccountRecordCls(AccountSaveCls controller) {//custom controller
        /*
        If we are using standard Controller
        we can use  ApexPages StandardController
        */
        accountList = new List<Account>();
        accountList=[SELECT id,Name, type,rating,Customer__c from Account limit 10];
    }
}