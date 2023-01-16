public with sharing class TestAccountContactController {
   
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> contactMethod(){
        List<Contact> accountRecords = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, Subject, Status FROM Tasks ) From Contact WHERE AccountId != NULL];
       return accountRecords;
    }

    @AuraEnabled(cacheable = true)
    public static List<Opportunity> oppMethod(){
       List<Opportunity> oppList = [SELECT Id, StageName FROM Opportunity];
       return oppList;
    }
}