public class Transactioncontroller implements BankingInterface {  //implements BankingInterface interface
  	// globally declared
    TransactionHelper.accountdetails accdetailsobj;
    public Transactioncontroller(){}
    public Transactioncontroller(String accNumber){
       accdetailsobj = TransactionHelper.getAccountDetails(accNumber);
     }
    public void accountDetails(){
        if(accdetailsobj!= Null){
            system.debug(accdetailsobj.customerName +' your '+accdetailsobj.accType+' account contains '
                         + accdetailsobj.balance+ '  Rs');
       }
        
    }
    
    public void checkBalance(){
        if(accdetailsobj!=Null){
            system.debug('Your balance is '+accdetailsobj.balance);
        }
        
        
    }
    public void deposit(Decimal deposit){
        if(accdetailsobj!=Null){
           accdetailsobj.balance=accdetailsobj.balance+deposit; 
            system.debug('Now your balance '+accdetailsobj.balance);
        } 
        
    }
    public void withdraw(Decimal withdraw){
        if(accdetailsobj!=Null){
            if(withdraw<=accdetailsobj.balance){
                accdetailsobj.balance=accdetailsobj.balance-withdraw;
                system.debug('Now your balance '+accdetailsobj.balance);
            }
            else{
                system.debug('Maintain sufficient balance, your balace is '+accdetailsobj.balance);
            }
        }
        
    }
    

}