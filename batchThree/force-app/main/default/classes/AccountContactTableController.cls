public with sharing class AccountContactTableController {
   
    @AuraEnabled(cacheable = true)
    public static List<Account> accountMethod(){
     List<Account> accountList = [SELECT Id, Name, Industry, Type, AccountNumber FROM Account];
     return accountList;
    }
}