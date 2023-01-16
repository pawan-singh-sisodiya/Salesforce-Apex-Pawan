public with sharing class LwcomponentController {
   
  // For Parent to child Assignment
    @AuraEnabled(cacheable = true)
    public static List<Lwcomponent__c> countryMethod(){
      List<Lwcomponent__c> countryRecords = [SELECT Id, Name, Population__c, President__c, Capital__c, CountrySideImage__c  FROM Lwcomponent__c];
      return countryRecords;
    }

    // For Child to parent Assignment
    @AuraEnabled(cacheable = true)
    public static List<Lwcomponent__c> countryCountMethod(){
      List<Lwcomponent__c> countryRecordsData = [SELECT Id, Name, Population__c, President__c, Capital__c, CountrySideImage__c FROM Lwcomponent__c];
      return countryRecordsData;
    }
}