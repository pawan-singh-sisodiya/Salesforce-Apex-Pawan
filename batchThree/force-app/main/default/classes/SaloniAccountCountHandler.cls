public class SaloniAccountCountHandler {

    public static void accountMethod(List<Account> accRecords){
       
        Integer count= 0;
        Map<Id, Contact> nmap = new Map<Id, Contact>();
        
        for(Contact con: [SELECT Id, AccountId FROM Contact WHERE AccountId != null]){
                nmap.put(con.AccountId, con);
            
        }
        Integer f = 1;
        for(Account acc: accRecords){
            
            if(nmap.containsKey(acc.Id) != null){
                f++;
            }
             count = f;
            acc.ContactCount__c = count;
            System.debug('count'+ count);
        }
        
      
    }
    
    
    
}