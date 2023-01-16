global class UpdateOpportunityBatch implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id , Name, AccountId, Account.Industry FROM Opportunity]);
    }
     global void  execute(Database.BatchableContext bc, List<Opportunity> oppRecords){
         for(Opportunity oppRec : oppRecords){
             oppRec.Name = oppRec.Name +' ibirdsservices';
             if(oppRec.AccountId != null){
                 oppRec.Account.Industry = 'Apparel';
             }
         }
         update oppRecords;
    }
     global void finish(Database.BatchableContext bc){
        
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'psbikharniya@gmail.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Batch job is done');
        mail.setPlainTextBody('Hi Pawan, You have successfully created the batch for third time');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}