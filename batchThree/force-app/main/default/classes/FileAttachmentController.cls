public class FileAttachmentController {
    public String recordDeleteId{get;set;}
    public List<wrapperAttachment> contactList{get;set;}    
    public FileAttachmentController(){
        contactList = new List<wrapperAttachment>();
        attachMethod();
    }
    public void attachMethod(){
        Integer index = 1;
        For(Contact con : [SELECT Id, Name, Phone, LeadSource, Email,(Select id from Attachments) From Contact]){
            wrapperAttachment wrapper = new wrapperAttachment();
            wrapper.Id = con.Id;
            wrapper.sNo = index;
            wrapper.Name = con.Name;
            wrapper.Phone = con.Phone;
            wrapper.LeadSource = con.LeadSource;
            wrapper.Email = con.Email;
            if(con.Attachments != Null && con.Attachments.size() > 0){
                wrapper.attId= con.Attachments[0].id;
                wrapper.attachmentURL = '/servlet/servlet.FileDownload?file='+con.Attachments[0].id;
            }else{
                wrapper.attachmentURL = '/resource/1664172080000/UserLogo';
            }
            index++;       
            contactList.add(wrapper);
        }
    }
    public PageReference deleteimage(){
        if(String.isNotBlank(recordDeleteId)){
           // System.debug('record Id '+recordDeleteId);
            DELETE[SELECT Id FROM Attachment WHERE id =: recordDeleteId]; 
        }
        PageReference pg = new PageReference('/apex/file_attachment');
        pg.setRedirect(true);
        return pg;
    }
    public class wrapperAttachment{
        public String Id{get;set;}
        public Integer sNo{get;set;}
        public String Name{get;set;}
        public String Phone{get;set;}
        public String LeadSource{get;set;}
        public String Email{get;set;}
        public Blob imageFile{get;set;}   
        public String attId{get;set;} 
        public String attachmentURL{get;set;}
    }
}