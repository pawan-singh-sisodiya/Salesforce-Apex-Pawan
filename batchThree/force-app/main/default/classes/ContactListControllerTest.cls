@isTest
public class ContactListControllerTest {
    
	@testSetup
    static void testData(){
        Contact contactRecord = new Contact();
        contactRecord.LastName = 'Hemant Jangir';
        contactRecord.Phone = '1234567899';
        contactRecord.Email = 'Mohit@gmail.com';
        INSERT contactRecord;
    }    
	
   @isTest
    public static void ContactMethod(){
        List<Contact> contactRecords = [SELECT Id FROM Contact];
        System.assertEquals(true, contactRecords.size() > 0);
        ContactListController contactListObj = new ContactListController();
    }
    
   /* @isTest
    public static void ContactMethod2(){
        DELETE [select id FROM Contact];
        List<Contact> contactRecords = new  List<Contact>();
        contactRecords = [SELECT Id FROM Contact];
        System.assertEquals(true, contactRecords.size() == 0);
        ContactListController contactListObj = new ContactListController();
    }*/
    
     
  /*  @isTest
    public static void searchRecord(){
        ContactListController contactListObj = new ContactListController();
        contactListObj.searchRecord();
    }*/
}