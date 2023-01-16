public class ContactCountOnAccountHelper {

    public static void countInsertMethod(List<Contact> contactList){
        Integer count = 0;
        List<Account> accountList = new List<Account>();
        
        for(Contact con : contactList){
            Account acc = new Account();
            if(con.AccountId != null){
                count++;
                acc.Id = con.AccountId;
                acc.ContactCount__c = count;
            }
             accountList.add(acc);
        }
        
        if(accountList.size()>0){
            INSERT accountList;
        }
    }
}