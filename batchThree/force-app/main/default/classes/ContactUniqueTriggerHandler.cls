public class ContactUniqueTriggerHandler {
    
    public static void uniqueContactFields(List<contact> newList){
        Set<String> emailSet = new Set<String>();
        Set<String> phoneSet = new Set<String>();
        for(Contact con : newList){
            if(emailSet.contains(con.Email)){
                 con.Email.addError('Duplicate bulk Email value');
            }
             if(emailSet.contains(con.Phone)){
                 con.Phone.addError('Duplicate bulk Phone value');
            }
           emailSet.add(con.email);
            phoneSet.add(con.Phone);
        }
        Set<String> contactList = new Set<String>();
        Set<String> PhoneList = new Set<String>();
        for(Contact con : [SELECT Id, Email, Phone FROM Contact Where Email IN :emailSet OR Phone In :phoneSet]){
            contactList.add(con.Email.toLowerCase());
            PhoneList.add(con.Phone);
        }
        
        for(Contact c : newList){
            if(String.isNotBlank(c.Email) && contactList.contains(c.Email) ){
                c.Email.addError('Duplicate Email value');
            }
            if(String.isNotBlank(c.Phone) && PhoneList.contains(c.Phone)){
                c.Phone.addError('Duplicate Phone Number');
            }
            
        }
    }
}