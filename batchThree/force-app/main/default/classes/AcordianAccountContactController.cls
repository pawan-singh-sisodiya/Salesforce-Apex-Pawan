public with sharing class AcordianAccountContactController {
 
    @AuraEnabled(cacheable = true)
    public static List<Account> accountMethod(){
     List<Account> accountList = [SELECT Id, Name,(SELECT Id, Name FROM Contacts) FROM Account];
     return accountList;
    }
}