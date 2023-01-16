public class ContactAssignment4 {
    
    public LIST<Contact> con{get;set;}  //List contactRecord  // contactRecords
    
    public ContactAssignment4(){
        
        con = new List<Contact>();
        Set<String> ids = new Set<String>();
        for(Account accRec : [SELECT id FROM Account]){
            ids.add(accRec.id);
        }
        con = [SELECT firstName, email, lastName, AccountId, Birthdate 
               FROM Contact WHERE accountid != null limit 5];
    }
    
    public void rowAdd() {
        con.add(new Contact());
    }
    
    public void rowDelete() {
        con.remove(con.size()-1);
    }
    
    public void save(){
        UPSERT con;
    }
}