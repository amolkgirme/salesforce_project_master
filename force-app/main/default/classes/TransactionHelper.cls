public class TransactionHelper {
    
    public static accountdetails getAccountDetails(String accNumber){
       Map<String,TransactionHelper.accountdetails> accountdetailsmap = new Map<String, TransactionHelper.accountdetails>();
      TransactionHelper.accountdetails accdetailsobj;
       accountdetailsmap.put('101', new accountdetails('Suyog',3000,'Saving'));
        accountdetailsmap.put('102', new accountdetails('Suyog',5000,'current'));
        accountdetailsmap.put('103', new accountdetails('Suyog',7000,'Saving'));
        accountdetailsmap.put('104', new accountdetails('Suyog',9000,'Current'));
        if(accountdetailsmap.containskey(accNumber)){
             accdetailsobj = accountdetailsmap.get(accNumber);
          }
        return accdetailsobj;
     }
    public class accountdetails{
        public Decimal balance;
        public String accType;
        public string customerName;
        public accountdetails(){}
        public accountdetails(String customerName,Decimal balance, string accType ){
            this.balance = balance;
            this.accType= accType;
            this.customerName = customerName;
            
          }
    }

}