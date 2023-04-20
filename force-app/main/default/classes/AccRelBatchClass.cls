global Class AccRelBatchClass implements Database.Batchable<sObject>,Database.stateful{
    public set<string> successidset = new set<string>();
    Public set<string> errorMessageset= new set<string>();
    global Database.QueryLocator start(Database.BatchableContext context){
        string query='SELECT id, name,(SELECT id, Name, AccLookup__c FROM AccLookups__r) FROM Account';
        system.debug(query);
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext context, List<Account> accList){
        system.debug(accList);
        List<Account_Relation__c> arList = new List<Account_Relation__c>();
        for(Account acc: accList){
            if(acc.AccLookups__r.isempty()){
                Account_Relation__c arObj = new Account_Relation__c();
                arObj.Rel_name__c=acc.Name+' Relation';
                arObj.AccLookup__c=acc.id;
                arList.add(arObj);
                
            }
        }
        if(!arList.isEmpty()){
            system.debug(arList);
            List<Database.SaveResult> accRelList=Database.insert(arList, false);
            for(Database.saveResult result :accRelList ){
                if(result.isSuccess()){
                    successidset.add(result.getId()); 
                }else{
                    List<Database.error> emList=result.geterrors();
                    for(Database.error error:emlist){
                        errorMessageset.add(error.getFields()+':::--'+error.getMessage()); 
                    }
                    
                }
                
            }
        }
        
        
    }
    global void finish(Database.BatchableContext context){
        
        Messaging.SingleEmailMessage objSingleEmailMessage = new  Messaging.SingleEmailMessage();
        String[] arrToAddresses = new String[] { 'kalyanibbhakare@gmail.com' };
            
        // Setting email parameters
        objSingleEmailMessage.setToAddresses(arrToAddresses);
        objSingleEmailMessage.setReplyTo('kunalp2996@gmail.com');
        objSingleEmailMessage.setSenderDisplayName('CorpoVision Technologies PVT. LTD.');
        objSingleEmailMessage.setSubject('CorpoVision Technologies Batch Alert');
        objSingleEmailMessage.setBccSender(false);
        
        // Setting HTML format body of email
        String htmlBody = '<h2> BatchCreateAccRelationship Result </h2> <br/>';
        htmlBody += '<h3 style="color: green;"> Success Ids :  </h3>';
        htmlBody += '<p>' + String.join(new List<String>(successidset), ' , ')  +  '<p/><hr/>';
        htmlBody += '<h3 style="color: red;"> Failure Messages :  </h3>';
        htmlBody += '<p>' + String.join(new List<String>(errorMessageset), ' , ')  +  '<p/>';        
        objSingleEmailMessage.setHtmlBody(htmlBody);
        
        // Finally sending email
        Messaging.sendEmail( new Messaging.SingleEmailMessage[] {objSingleEmailMessage} );
        
    }
}