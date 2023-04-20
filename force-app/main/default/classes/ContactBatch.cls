Global class ContactBatch implements Database.Batchable<sObject>{
    Global Integer Total_size=0;
    Global Integer Success_size=0;
    Global Integer Fail_size=0;
    Global Database.QueryLocator start (Database.BatchableContext bc){
        List<AsyncApexJob> apexJobs = [SELECT id, ApexClassId, Apexclass.Name, NumberOfErrors,
                                       JobItemsProcessed, TotalJobItems, Status,
                                       JobType
                                      From AsyncApexJob WHERE Id =:bc.getJobId()];
        system.debug('Start : :  '+apexJobs );
       return Database.getQueryLocator('SELECT ID, Name , Fax, Email,MobilePhone, Description , Account.Name, Account.Rating, Account.Phone, Account.Fax, Account.Industry FROM contact');
        
    }
    Global void execute(Database.BatchableContext bc, List<Contact> conList){
        Integer size = conList.size();
        Total_size+=size;
        for(integer i=0; i<size; i++){
          contact con = conList.get(i);
            if(con.Fax==null || con.Fax==''){
                con.Fax=con.Account.Fax;
            }
            if(con.MobilePhone==null || con.MobilePhone==''){
                con.MobilePhone=con.Account.Phone;
            }
            con.Email='amolkgirme87@gmail.com';
            con.Description=con.Account.Name+' '+con.Account.Rating+' '+con.Account.Industry+' '+con.Email;
        }
        //update conList;
        List<Database.SaveResult> result= database.update(conList, False);
        Integer size_result = result.size();
        for(Integer i=0; i<size_result;i++){
            database.SaveResult sr = result.get(i);
            if(sr.isSuccess()){
                success_size+=1;
            }
            else{
                fail_size+=1;
            }
            
        }
     }
    Global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Status of ContactBatch');
        mail.setSenderDisplayName('Amol Girme Developer');
        mail.setHtmlBody('Dear User,<br/> Batch Processed'+
                         '<br/>Total Records : '+Total_size+
                         '<br/> Success Count '+Success_size+
                         '<br/> Fail Count '+fail_size);
        List<String> sendTo = new List<String>();
        sendTo.add('amolkgirme87@gmail.com');
        mail.setToAddresses(sendTo);
        List<Messaging.SingleEmailMessage> emailList= new List<Messaging.SingleEmailMessage>();
        emailList.add(mail);
        messaging.sendEmail(emailList, false);
        
    }
}