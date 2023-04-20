public with sharing class WrapperExample {
    public List<AccountWrapper> accountWrapperList{get; set;}
    public List<AccountWrapper> selectedWrapperList{get; set;}
    public WrapperExample(){
        accountWrapperList = new List<AccountWrapper>();
        AccountWrapper wrapObj1 = new AccountWrapper();
        wrapObj1.accountname ='Test Corp';
        wrapObj1.accountType ='Test Corp';
        wrapObj1.isChecked =false;
        accountWrapperList.add(wrapObj1);
        AccountWrapper wrapObj2 = new AccountWrapper();
        wrapObj2.accountName ='POC12 Corp';
        wrapObj2.accountType ='Prospect';
        wrapObj2.isChecked =false;
        accountWrapperList.add(wrapObj2);
        for(Account acc :[SELECT id, name,type FROM Account LIMIT 5]){
            AccountWrapper wrapperObj = new AccountWrapper();
            wrapperObj.accountName=acc.name;
            wrapperObj.accountType=acc.Type;
            wrapperObj.isChecked=false;
            accountWrapperList.add(wrapperObj);
        }

    }
    public void displaySelectedRecord(){
        selectedWrapperList = new List<AccountWrapper>();
        for(AccountWrapper obj:accountWrapperList){
            if(obj.isChecked == true){
                selectedWrapperList.add(obj);
            }
        }

    }
    public class AccountWrapper{
        public boolean isChecked{get;set;}
        public String accountName{get;set;}
        public String accountType{get;set;}
    }
}