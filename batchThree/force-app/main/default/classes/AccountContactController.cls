public with sharing class AccountContactController {
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> accountMethod(){
        List<Contact> contactList = [SELECT Id, Name, Phone, Email, City__c, AccountId, Account.Name FROM Contact WHERE AccountId != null];
        return contactList;
    }
}