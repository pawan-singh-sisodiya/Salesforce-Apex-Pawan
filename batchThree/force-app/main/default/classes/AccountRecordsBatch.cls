global class AccountRecordsBatch  implements Database.Batchable<sObject>, Database.Stateful{
    public Integer count = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT id, Name FROM Account]);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> newList){
        List<Account> accRecords = new List<Account>();
        for(Integer i = 1; i<=5; i++){
            Account ac = new Account();
            ac.Name = 'Ateet Sewkani '+(i);        
            accRecords.add(ac);
        }
       
        
        try{
            
            database.saveresult[] ds =  Database.insert(accRecords,false);
            for(database.SaveResult d : ds){
                if(d.issuccess()){
                    count++;
                }
                
            }
        }
        catch(exception e){
            system.debug('insert failed');
        }
        
      
    }
    
    global void finish(Database.BatchableContext bc){
        
        system.debug(count);
        // List<Account> countRecords = new List<Account>();
        //  list <account> lacc = [SELECT id FROM account ORDER BY createdDate DESC limit 1];
        //  Select email from user where profile.name = 'System Administrator'
        //  Integer count = lacc.size();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'psbikharniya@gmail.com'};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Account Creation');
        mail.setPlainTextBody('Total' +'  '+ count +'  '+ 'Records inserted sucessfully');
        messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail}); 
    }
}