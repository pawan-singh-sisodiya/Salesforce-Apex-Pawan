public with sharing class ContactLwcClass {
    @AuraEnabled(cacheable = true)
    public static List<contact> contactMethod(){
        List<Contact> contactRecords = [SELECT Id, Name, Phone, Email FROM Contact];
        return contactRecords;
    }
}