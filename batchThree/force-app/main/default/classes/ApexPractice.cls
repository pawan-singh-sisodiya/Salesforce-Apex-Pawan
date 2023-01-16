public class ApexPractice {
    
    public static void ApexPracticeMethod(){
        
        List<Account> accList = [Select Id, Name, Phone FROM Account WHERE CreatedDate = THIS_WEEK AND Phone != null];
        Map<Id, Account> nmap = new Map<Id, Account>(accList);
        
        List<Contact> contactList = [Select Id, Name, AccountId, Phone FROM Contact WHERE AccountId IN: nmap.keySet()];
        
        List<Contact> conList = new List<Contact>();
        
        for(Contact con : contactList){
            if(nmap.containsKey(con.AccountId)){
                Contact c = new Contact();
                c.Id = con.Id;
                c.Phone = nmap.get(con.AccountId).Phone;
                
                conList.add(c);
            }
        }
        
        if(conList.size()>0){
            UPSERT conList;
        }
        
    }
}