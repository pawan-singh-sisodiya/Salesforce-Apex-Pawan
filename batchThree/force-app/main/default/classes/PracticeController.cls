public with sharing class PracticeController {
   
    @AuraEnabled(cacheable = true)
    public static List<Lwcomponent__c> countryMethod(){
        List<Lwcomponent__c> countryList = [SELECT Id, Name, Capital__c, CountrySideImage__c, Population__c, President__c FROM Lwcomponent__c];
        return countryList;
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> contactMethod(){
       List<contact> contactList = [SELECT Id, FirstName, LastName, Email, Phone, City__c FROM Contact WHERE City__c != Null];
       return contactList;
    }


    @AuraEnabled(cacheable = true)
    public static List<Contact> contactTaskMethod(){
       List<Contact> contactList = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, WhatId, Subject, ActivityDate, Status, OwnerId FROM Tasks) FROM Contact WHERE AccountId != null];
       return contactList;
    }

    @AuraEnabled(cacheable = true)
    public static List<Student_lwc__c> studentMethod(){
        List<Student_lwc__c> studentList = [SELECT Id, Name, LastName__c, Email__c, Image__c, City__c, Phone__c FROM Student_lwc__c];
        return studentList;
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> accountContactTask(){
       List<Contact> contactList = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, Subject, ActivityDate, Status, OwnerId FROM Tasks) FROM Contact WHERE AccountId != null];
       return contactList;
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> ravindraMethod(){
       List<Contact> contactList = [SELECT Id, Name, AccountId, Account.Name, (SELECT Id, WhoId, Subject, ActivityDate, Status, OwnerId FROM Tasks) FROM Contact WHERE AccountId != null];
       return contactList;
    }
    

}