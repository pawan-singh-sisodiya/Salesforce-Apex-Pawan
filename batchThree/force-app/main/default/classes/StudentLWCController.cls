public with sharing class StudentLWCController {
   
    @AuraEnabled(cacheable=true)
    public static List<Student_lwc__c> studentMethod(){
     List<Student_lwc__c> studentList = [SELECT Id, Name, LastName__c, Email__c, Image__c, City__c, Phone__c FROM Student_lwc__c];
     return studentList;
    }
}