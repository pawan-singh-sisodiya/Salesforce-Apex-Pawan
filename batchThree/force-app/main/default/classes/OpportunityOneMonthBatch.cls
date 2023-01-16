global class OpportunityOneMonthBatch implements Database.Batchable<sObject>, database.Stateful{
    //global List<Opportunity> opl = new List<Opportunity>();
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id, Name, StageName, Owner.Email From Opportunity Where CreatedDate <=: system.today()-30]);
    }
    
    global void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        for(Opportunity op : oppList){
            op.StageName = 'Closed Won';
            oppList.add(op);
        }
        update oppList;
        
        //  List<Opportunity> lst=[Select id,name, StageName from Opportunity where StageName ='Closed Lost'];
        for(Opportunity u:oppList){
            FeedItem post = new FeedItem();
            post.Body = 'Opportunity updated to '+u.StageName;
            insert post;
            //system.debug('Chatter message'+ post);
        }
        
      /*  List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for(Opportunity op : oppList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'psbikharniya@gmail.com'};
                mail.setToAddresses(toAddresses);
          //  mail.setToAddresses();
            system.debug('Email-'+ toAddresses);
            mail.setSubject('Closed Lost Opportunity');
            mail.setPlainTextBody('Your opportunity has closed');
            //   messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail}); 
            emails.add(mail);
        }
        messaging.sendEmail(emails);  */
    }
    
    global void finish(Database.BatchableContext bc){
        
        /*Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] toAddresses = new String[] {'psbikharniya@gmail.com'};
mail.setToAddresses(toAddresses);
mail.setSubject('Closed Lost Opportunity');
mail.setPlainTextBody('Your opportunity has closed');
messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail}); */
    } 
    
}