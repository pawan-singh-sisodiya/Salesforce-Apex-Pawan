public with sharing class GetAccountController {

    @AuraEnabled
    public static List<Account> parentAccountMethod(Id accId){
        System.debug('parentAccountMethod : '+accId );
      return [SELECT Id, Name, Type, Phone FROM Account WHERE Id =: accId];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> GetAccounts() {
       return [SELECT Id, Name, Type FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static List<Contact> getContactByAccID(Id accId){
        return [SELECT Id, FirstName, LastName, Phone FROM Contact WHERE AccountId =: accId];
    }

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccountByType(String type){
        return [Select Id, Name, Type FROM Account WHERE Type =: type];
    }

    @AuraEnabled(cacheable = true)
    public static List<Map<String, String>> getPicklistValues(){
        Schema.DescribeFieldResult fieldDefination = Account.Type.getDescribe();
        List<Schema.PicklistEntry> picklistEntry = fieldDefination.getPicklistValues();
       List<Map<String, String>> picklistValues = new List<Map<String, String>>();
     
        for(Schema.PicklistEntry entry : picklistEntry){
            Map<String, String> value = new Map<String, String>();
            value.put('label', entry.getLabel());
            value.put('value', entry.getValue());
            picklistValues.add(value);
        }
        return picklistValues;
    }
}