public class InboundEmailHandler implements Messaging.InboundEmailHandler {
    
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try{
            String fromAdd = email.fromAddress;
            Contact con = [SELECT Id FROM Contact WHERE email=: fromAdd];
            Case c = new Case();
            c.Status = 'New';
            c.Priority = 'Normal';
            c.Origin = 'Email';
            c.Subject = email.subject;
            c.Description = email.plainTextBody;
            c.ContactId = con.Id;
            insert c;            
            result.success = true;
        }
        catch(exception e){
            result.success = false;
        }
        
        return result;
    }

}