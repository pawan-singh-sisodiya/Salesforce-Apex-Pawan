@isTest
public class CopyToTest {
    
    @testSetup
    static void attachmentsMethod(){
        Account account = new Account(name = 'acc1');
        INSERT account;
        
        Contact contact = new Contact(lastName = 'Contact1', birthdate = system.today().addYears(-19));
        Insert contact;
        
        Opportunity opprtunity = new Opportunity(Name = 'opp3', AccountId = account.Id, StageName = 'Qualification', Amount = 2323, CloseDate = System.today(), Discount_Percent__c = 20);
        INSERT opprtunity;
        
        Attachment attach1 = new Attachment();
        attach1.Name = 'Account Attachment';
        attach1.ParentId = account.Id;
        attach1.Body = blob.valueOf('testRun');
        attach1.ContentType = 'Text/Plain';
        
        Attachment attach2 = new Attachment();
        attach2.Name = 'Contact Attachment';
        attach2.ParentId = contact.id;
        attach2.body = blob.valueOf('testRun');
        attach2.ContentType = 'Text/plain';
        
        Attachment attach3 = new Attachment();
        attach3.Name = 'Opportunity Attachment';
        attach3.ParentId = opprtunity.id;
        attach3.body = blob.valueOf('testRun');
        attach3.ContentType = 'Text/plain';
        
        INSERT attach1;
        INSERT attach2;
        INSERT attach3;
    }
    
    @isTest
    static void copyTestMethod(){
        ObjectListCopytoController copyObj = new ObjectListCopytoController();
        copyObj.getObjects();
        copyObj.selectedObjectName = 'Account';
        copyObj.fillAttachmentWrapper();
        copyObj.selectedObjectName = 'Contact';
        copyObj.fillAttachmentWrapper();
        copyObj.selectedObjectName = 'Opportunity';
        copyObj.fillAttachmentWrapper();
        copyObj.masterCheckBox = true;
        copyObj.masterCheck();
        copyObj.copyToButton = true;
        copyObj.masterUncheck();
        copyobj.redirectPopup();
        copyObj.showPopup();
        copyObj.closePopup();
        copyObj.getObjectOptions();
        
        copyObj.selectedObjectNamePopup = 'Account';
        copyObj.fillObject();
        copyObj.popupMasterCheckBox = true;
        copyObj.popupMasterCheckBox();
        copyObj.selectedObjectNamePopup = 'Contact';
        copyObj.fillObject();
        copyObj.selectedObjectNamePopup = 'Opportunity';
        copyObj.fillObject();
        
        copyObj.popupMasterCheckBox = true;
        copyObj.popupMasterCheckBox();
        copyObj.copyAssignButton = true;
        copyObj.popupMasterUnCheckBox();
        
        
        copyObj.copyAttachment();
        
    }
    
    @isTest
    public static void copyMethod2(){
        ObjectListCopytoController copyObj2 = new ObjectListCopytoController();
        
        copyObj2.fillAttachmentWrapper();
        copyObj2.masterCheckBox = false;
        copyObj2.masterCheck();
        copyObj2.masterUncheck();
        copyObj2.copyToButton = true;
        
        /*copyObj2.popupMasterCheckBox = false;
copyObj2.popupMasterCheckBox();
copyObj2.copyAssignButton = false;
copyObj2.popupMasterUnCheckBox();*/
    }
}