public class RahulTaskTriggerHelper {
    
    //----------------- Trigger For Insert ------------------
    public static void taskInsertMethod(List<Task> taskRecrods){
        Set<Id> ids = new Set<id>();
        
        For(Task ts: taskRecrods){
            if(ts.WhatId != NULL){
                ids.add(ts.WhatId);
            }
        }
        
        Map<Id, Opportunity> nmap = new Map<Id, Opportunity>([SELECT Id, OwnerId, Owner.Email, Owner.Name FROM Opportunity WHERE Id In : ids]);
        
        EmailTemplate emailTemplate = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body FROM EmailTemplate WHERE DeveloperName = 'ClientRequirementDemo'];
        
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        
        for(Task ts : taskRecrods){
            if(nmap.containsKey(ts.WhatId)){
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                
                msg.setTargetObjectId(ts.OwnerId);  //Receiver
                
                msg.setSenderDisplayName('KumetRider');
                msg.setReplyTo('sarojbikhanriya@gmail.com');
                msg.setUseSignature(false);
                msg.setBccSender(false);
                msg.setSaveAsActivity(false);
                
                
                msg.setTemplateID(emailTemplate.Id);
                msg.setWhatId(ts.Id); //This is important for the merge  fields in template to work
                
                //msg.toAddresses = new String[] {ts.Owner.Email};
                messages.add(msg);
            }
            System.debug(' messages : '+ messages);
            Messaging.SendEmailResult[] results =
                Messaging.sendEmail(messages);
            System.debug(' results : '+ results);
        }
    }
    
    //---------------------------------------------------- After Update ----------------------------------------------------------------------------//
    
    public static void taskUpdateMethod(List<Task> taskRecords, Map<Id, Task> oldTask){
        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
        
        EmailTemplate email2 = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body FROM EmailTemplate WHERE DeveloperName = 'RoleChangedET'];
        
        
        for(Task tsk: taskRecords){
            
            if(oldTask.size() >0){
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                msg.setTargetObjectId(oldTask.get(tsk.Id).OwnerId);  //Receiver
                msg.setSenderDisplayName('KumetRider');
                msg.setReplyTo('sarojbikhanriya@gmail.com');
                msg.setUseSignature(false);
                msg.setBccSender(false);
                // msg.ccaddresses('psbikharniya@gmail.com');
                msg.setSaveAsActivity(false);
                msg.setTemplateID(email2.Id);
                msg.setWhatId(tsk.Id); //This is important for the merge  fields in template to work
                messages.add(msg);
            }
            
            
            
            System.debug(' messages : '+ messages);
            Messaging.SendEmailResult[] results =
                Messaging.sendEmail(messages);
            System.debug(' results : '+ results);
            
            List<Messaging.SingleEmailMessage> message = new List<Messaging.SingleEmailMessage>();
            
            if(tsk.OwnerId != oldTask.get(tsk.Id).OwnerId){
                
                Messaging.SingleEmailMessage msg1 = new Messaging.SingleEmailMessage();
                EmailTemplate emailTemplate = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body FROM EmailTemplate WHERE DeveloperName = 'ClientRequirementDemo'];
                msg1.setTargetObjectId(oldTask.get(tsk.Id).OwnerId);  //Receiver
                
                msg1.setSenderDisplayName('KumetRider');
                msg1.setReplyTo('sarojbikhanriya@gmail.com');
                msg1.setUseSignature(false);
                msg1.setBccSender(false);
                
                msg1.setSaveAsActivity(false);
                msg1.setTemplateID(emailTemplate.Id);
                msg1.setWhatId(tsk.Id); 
                
                
                message.add(msg1);
            }
            System.debug(' messages : '+ message);
            Messaging.SendEmailResult[] result =
                Messaging.sendEmail(message);
            System.debug(' results : '+ result);
        }
        
    }
}