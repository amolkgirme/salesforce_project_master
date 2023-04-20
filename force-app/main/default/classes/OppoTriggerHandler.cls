public class OppoTriggerHandler {
    public static void countOpportunity(set<id> AccIdset){
        List<Account> accList= new List<Account>();
        
        for(Account acc: [SELECT id, (SELECT id,Amount FROM opportunities) FROM Account WHERE id IN : AccIdset]){
            List<Decimal> oppAmt = new List<Decimal>();
            for(opportunity opp: acc.opportunities){
               oppAmt.add(opp.Amount); 
            }
            system.debug(oppAmt);
            integer n= oppAmt.size();
            oppAmt.sort();
            acc.Max_Amount__c=oppAmt[n-1];
            accList.add(acc);
        }
    update accList;
}

}