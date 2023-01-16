public with sharing class ContactRecordsByName {
    
  @AuraEnabled(cacheable = true)
  public static List<Contact> conMethod(){
  List<Contact> contactList = [SELECT Id, Name, Email, Phone, City__c FROM Contact];
return contactList;
  }

    @AuraEnabled(cacheable = true)
    public static List<Map<String, String>> contactMethod(){

      Schema.DescribeFieldResult fieldDefination = Contact.City__c.getDescribe();
      List<Schema.PicklistEntry> picklistEntry = fieldDefination.getPicklistValues();
      List<Map<String, String>> cityMAp = new List<Map<String, String>>();
      for(Schema.PicklistEntry entry : picklistEntry){
       Map<String, String> nmap = new Map<String, String>();
       nmap.put('label', entry.getLabel());
       nmap.put('value', entry.getValue());
       cityMAp.add(nmap);
      }
      return cityMAp;
    } 
}