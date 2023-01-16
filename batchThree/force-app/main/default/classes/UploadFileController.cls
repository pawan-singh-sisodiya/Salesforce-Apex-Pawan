public with sharing class UploadFileController {   
    public Id recordId{get;set;}
    public Attachment attachment{get;set;}
    
    public UploadFileController(){
        recordId = ApexPages.currentPage().getParameters().get('recordId');
        attachment = new Attachment();
        attachment.ParentId = recordId;  
    }
    public PageReference upload(){
        insert attachment;       
        PageReference pg = new PageReference('/Apex/file_attachment');
        pg.setRedirect(true);
        return pg;
    }
}