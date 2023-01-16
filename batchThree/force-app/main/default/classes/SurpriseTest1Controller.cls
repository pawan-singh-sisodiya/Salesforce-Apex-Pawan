public class SurpriseTest1Controller {
    
    public List<AccountWrapper> accountRecords{get;set;}
    public SurpriseTest1Controller(){
        countContactMethod();
    }
    
    public void countContactMethod(){
        Integer index = 1;
        Integer count = 0;
        accountRecords = new List<AccountWrapper>();
        Map<Id, Contact> nmap = new Map<Id, Contact>();
     /*   For(Contact con : [SELECT id, AccountId FROM Contact]){
            if(con.AccountId != null){
                nmap.put(con.AccountId, con);
                
            }
        }
        
        For(Account acc : [SELECT Id, Name FROM Account WHERE id IN : nmap.keySet()]){
            AccountWrapper wrapper = new AccountWrapper();
            wrapper.sNo = index;
            wrapper.accountName = acc.name;
            
            if(nmap.containsKey(acc.id) != null){
                count++;
            }    
            if(acc.Contacts. != null){
                count++;
            } 
            wrapper.countContact = count;
            accountRecords.add(wrapper);
            index++;
        } */
        
        For(Account acc : [SELECT Id, Name, (SELECT Id, Name, AccountId FROM Contacts) FROM Account]){
            
            AccountWrapper wrapper = new AccountWrapper();
            wrapper.sNo = index;
            wrapper.accountName = acc.name;
            
        //    wrapper.contactName = acc.Contacts[0].lastName;
         
            
            for(Contact con : acc.contacts){
                if(con.AccountId != null){
                    count++;
                }
            }
            
         //   wrapper.countContact = acc.contacts.size() > 0 ? acc.contacts.size() : 0;
            accountRecords.add(wrapper);
            index++;
        } 
        
    }
    public class AccountWrapper{
        public Integer sNo{get;set;}
        public String accountName{get;set;}
        public String contactName{get;set;}
        public Integer countContact{get;set;}
    }
}