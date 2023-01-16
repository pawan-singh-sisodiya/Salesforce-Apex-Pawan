public with sharing class PracticeAccountContactCount {
   
   @AuraEnabled(cacheable = true)
   public static List<AccountWrapper> accountMethod(){
    
    List<AccountWrapper> accountList = new List<AccountWrapper>();

    Integer index = 1;
    for(Account acc : [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account]){
        AccountWrapper wrapper = new AccountWrapper();
        wrapper.sNo = index;
        wrapper.accName = acc.Name;
        wrapper.contactCount= acc.Contacts.size();
        accountList.add(wrapper);

        index++;
    }

    return accountList;
   }

   public class AccountWrapper{
    @AuraEnabled
    public Integer sNo;
    @AuraEnabled
    public String accName;
    @AuraEnabled
    public Integer contactCount;

   }
}