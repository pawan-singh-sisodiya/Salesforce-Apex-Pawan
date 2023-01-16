public with sharing class AccountContactTaskcontroller {
   
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> accountMethod(){
        List<Contact> accountRecords = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, Subject, ActivityDate, Status, CreatedById FROM Tasks ) From Contact WHERE AccountId != NULL];
        return accountRecords;
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> contactMethod(){
      List<Contact> contactList = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, Subject, ActivityDate, Status, CreatedById FROM Tasks) FROM Contact WHERE AccountId != NULL];
    return contactList;
    }
}