public with sharing class AssociatedContactsCountController {
   
  
    @AuraEnabled(cacheable = true)
    public static List<accountWrapper> contactMethod(){
      List<accountWrapper>  accList = new List<accountWrapper>();
     Integer index =1;
      for(Account con : [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account]){
        accountWrapper wrapper = new accountWrapper();
        wrapper.sNo = index;
       // wrapper.accRec = con;
        wrapper.accountName = con.Name;
        wrapper.contactCount = con.Contacts.size();
        accList.add(wrapper);
        index++;
      }
      return accList;
    }

    
    public class accountWrapper{
      @AuraEnabled
      public Integer sNo;
      @AuraEnabled
      public Account accRec;
      @AuraEnabled
      public String accountName;
      @AuraEnabled
      public Integer contactCount;

    }
}