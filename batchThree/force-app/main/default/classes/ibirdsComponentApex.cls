public with sharing class ibirdsComponentApex {
    
    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getApexData(){
        
        return [SELECT Id, Name, AccountId, Account.Name FROM Opportunity WHERE AccountId != null];
    }
}