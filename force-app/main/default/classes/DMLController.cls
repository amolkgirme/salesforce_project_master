public class DMLController {
    public void insertOppo(){
        List<Account> accList = [SELECT name, id,(SELECT name, id, Amount__c FROM Contacts) FROM Account];
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            for(contact con : acc.Contacts){
               Opportunity opp = new Opportunity();
                opp.Name = con.Name+' Oppo';
                opp.CloseDate= date.today();
                opp.Amount=con.Amount__c;
                opp.StageName='Prospecting';
                opp.AccountId=acc.id;
                oppList.add(opp);
                system.debug(opp);
                
            }
          }
        insert oppList;
    }
    public void insertOppoArchieve(){
        List<Opportunity> oppList = [SELECT id, Name, CloseDate, Amount, StageName FROM Opportunity];
        List<Opportunity_Archieve__c> opparList = new List<Opportunity_Archieve__c>();
        
        for(Opportunity opp : oppList){
            Opportunity_Archieve__c oppar = new Opportunity_Archieve__c();
            oppar.Name=opp.Name;
            oppar.Opportunity_Lookup__c = Opp.id;
            oppar.Closed_Date__c= opp.CloseDate;
            oppar.Amount__c = opp.Amount;
            oppar.Stage__c = opp.StageName;
            opparList.add(oppar);
            
            
        }
        system.debug(opparList.size()+' -------- '+opparList);
       
    
    //insert opparList;
    //delete oppList;
    }
    public void restore(){
        List<Opportunity>  oppList =[SELECT id, Name, CloseDate, Amount, StageName FROM Opportunity WHERE isDeleted =  true ALL ROWS];
        database.undelete(oppList, false);
        system.debug(oppList.size()+'----'+oppList);
        }
 
   
    
}