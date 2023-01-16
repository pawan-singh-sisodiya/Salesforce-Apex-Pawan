public class saloniCountHelper {

    public static void countMethod(List<Contact> conList){
        
        Integer count =0;
        
        List<Account> accList = new List<Account>();
        
        for(Contact con : conList){
            
            Account acc = new Account();
            
            if(con.AccountId != Null){
                count++;
                 acc.ContactCount__c = count;
            accList.add(acc);
            }
           
        }
        if(accList.size()>0){
              Insert accList;
        }
      
    }
}