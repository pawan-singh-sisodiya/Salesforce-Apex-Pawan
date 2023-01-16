public class CopyAttachmentDemo {
    /* demo */
    public Boolean showObjectTable{get;set;}
    public String selectObjectName{get;set;}
   
    public List<ObjectWrapper> objectwrapperList{get;set;}
    public CopyAttachmentDemo(){
        showObjectTable = false;
    }

    public List<SelectOption> getOptions(){
        List<SelectOption> attachmentObject = new List<SelectOption>();
        attachmentObject.add(new SelectOption('', '--None--'));
        attachmentObject.add(new SelectOption('Account', 'Account'));
        attachmentObject.add(new SelectOption('Contact', 'Contact'));
        attachmentObject.add(new SelectOption('Opportunity', 'Opportunity'));
            
            return attachmentObject;
    }
    
    public void fillAttachment(){
        showObjectTable=true;
        objectwrapperList = new List<ObjectWrapper>();
       Set<Id> parentId = new Set<Id>();
        if(selectObjectName == 'Account'){
            for(Account accountRecords : [SELECT Id FROM ACCOUNT]){
                parentId.add(accountRecords.Id);
            }
        }
         if(selectObjectName == 'Contact'){
            for(Contact contactRecords : [SELECT Id FROM Contact]){
                 parentId.add(contactRecords.Id);
             }
        }
         if(selectObjectName == 'Opportunity'){
             for(Opportunity opportunityRecords : [SELECT Id FROM Opportunity]){
                 parentId.add(opportunityRecords.Id);
             }
        }
        
        if(parentId.size() > 0){
            Integer index = 1;
            for(Attachment attachmentRecord : [SELECT Id, Name, ContentType FROM Attachment WHERE ParentId IN : parentId]){
                ObjectWrapper attachmentWrapperObj = new ObjectWrapper();
                attachmentWrapperObj.sNo = index;
                attachmentWrapperObj.name = attachmentRecord.Name;
                attachmentWrapperObj.contentType = attachmentRecord.ContentType;
                attachmentWrapperObj.attachmentUrl = '/servlet/servlet.FileDownload?file='+attachmentRecord.Id;
                objectwrapperList.add(attachmentWrapperObj);
                index++;
            }
        }
    }
    
    public class ObjectWrapper{
        public Integer sNo{get;set;}
        public String name{get;set;}
        public String contentType{get;set;}
        public String attachmentUrl{get;set;}
    }
}