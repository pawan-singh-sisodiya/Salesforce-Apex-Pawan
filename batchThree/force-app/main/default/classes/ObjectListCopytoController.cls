public class ObjectListCopytoController {
    
    public String selectedObjectName{get;set;}
    Set<Id> parentId{get;set;}
    
    public Boolean copyToButton{get;set;}
    public Boolean showAttachmentTable{get;set;}
    public Boolean masterCheckBox{get;set;}
    public Boolean showObjectTable{get;set;}
    public String selectedObjectNamePopup{get;set;}  
    public Boolean displayPopup {get;set;}
    public Boolean popupMasterCheckBox{get;set;}
    public Boolean copyAssignButton{get;set;}
   
    
    public List<AttachmentWrapper> attachmentRecords{get;set;}     
    public List<ObjectWrapper> objectWrapperRecords{get;set;}     //List for Popup
    public List<AttachmentWrapper> attachmentForCopyRecords{get;set;}
    Set<String> objectRecords{get;set;}
     
    public list<Attachment> allAttchments{get;set;}
    //Final List to insert attchment into new destination object
    public list<ObjectWrapper> copyList{get;set;}
    public List<AttachmentWrapper> newList1{get;set;}
    
    public ObjectListCopytoController(){
        showAttachmentTable = false;
        masterCheckBox = false;
        copyToButton = false;
        showObjectTable = false;                    //For pop's Picklist
        copyAssignButton = false;
        
        allAttchments = new List<Attachment>();
        
        parentId = new Set<Id>();
        
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.warning,'Please select object');
        ApexPages.addMessage(myMsg);
        
    }
    
    public List<SelectOption> getObjects(){
        List<SelectOption> objectNameOptions = new List<SelectOption>();
        objectNameOptions.add(new SelectOption('', '--None--'));
        objectNameOptions.add(new SelectOption('Account', 'Account'));
        objectNameOptions.add(new SelectOption('Contact', 'Contact'));
        objectNameOptions.add(new SelectOption('Opportunity', 'Opportunity'));
        return objectNameOptions;
    }
    
    public void fillAttachmentWrapper(){
        
        attachmentRecords = new List<AttachmentWrapper>();
        parentId = new Set<Id>();
        if(selectedObjectName == 'Account'){
            for(Account accountRecord : [SELECT Id FROM Account]){
                parentId.add(accountRecord.id);
            }
        }
        else if(selectedObjectName == 'Contact'){
            for(Contact contactRecord : [SELECT Id FROM Contact]){
                parentId.add(contactRecord.id);
            }
        }
        else if(selectedObjectName == 'Opportunity'){
            for(Opportunity opportunityRecord : [SELECT Id FROM Opportunity]){
                parentId.add(opportunityRecord.id);
            }
        }
        
        if(parentId.size() > 0){
            Integer index = 1;
            for(Attachment attachmentRecord : [SELECT Id, Name, ContentType, Body FROM Attachment WHERE ParentId IN : parentId]){
                AttachmentWrapper attachmentWrapperObj = new AttachmentWrapper();
                attachmentWrapperObj.sNo = index;
                attachmentWrapperObj.name = attachmentRecord.Name;
                attachmentWrapperObj.body = attachmentRecord.Body;
                attachmentWrapperObj.contentType = attachmentRecord.ContentType;
                attachmentWrapperObj.attachmentUrl = '/servlet/servlet.FileDownload?file='+attachmentRecord.Id;
                attachmentRecords.add(attachmentWrapperObj);
                index++;
            }
        }
        if(attachmentRecords.size() > 0){
            showAttachmentTable = true;
        }else{
            showAttachmentTable = false;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.error,
                                                            'Attachment not available in "'+selectedObjectName+'" object...!');
            ApexPages.addMessage(myMsg);
        }
    }
    
    public void masterCheck(){
        for(AttachmentWrapper wrapper : attachmentRecords){
            if(masterCheckBox ==  true){
                copyToButton = true;
                wrapper.singleCheck = true;
            }
            else {
                wrapper.singleCheck = false;
                copyToButton = false;
            }
        }
    }
    public void masterUncheck(){
        Integer count = 0;
        for(AttachmentWrapper wrapper : attachmentRecords){
            if(wrapper.singleCheck == true){
               // copyToButton = true;
                count++;
            }
            
            if(count > 0){
                copyToButton = true;
            }
            else{
                copyToButton = false;
            }
            
            if(attachmentRecords.size() == count){
                masterCheckBox = true;
            }
            else if(attachmentRecords.size() != count){
                masterCheckBox = false;
            }
        }
    }
    
    /*---------------------------------  for popup -------------------------------------------------------*/
    
    public void popupMasterCheckBox(){
        for(ObjectWrapper wrapper : objectWrapperRecords){
            if(popupMasterCheckBox == true){
                wrapper.popupSingleCheck = true;
                copyAssignButton = true;
            }
            else{
                wrapper.popupSingleCheck = false;
                copyAssignButton = false;
            }
        }
    }
    
    public void popupMasterUnCheckBox(){
        integer count = 0;
        for(ObjectWrapper wrapper : objectWrapperRecords){
            if(wrapper.popupSingleCheck == true){
                copyAssignButton = true;
                count++;
            }
            
            if(count > 0){
                 copyAssignButton = true;
            }
            else{
                 copyAssignButton = false;
            }
           /* else{
                popupMasterCheckBox = false;
            }*/
            
            if(objectWrapperRecords.size() == count){
                popupMasterCheckBox = true;
            }
            else{
                popupMasterCheckBox = false;
            }
        }
    }
    
    public void showPopup()
    {       
        displayPopup = true;  
        
       /* for(ObjectWrapper newWrapper : objectWrapperRecords){
            if(newWrapper.popupSingleCheck == true){
                copyList.add(newWrapper);
            }
        }*/
    }
    
    public void closePopup() {
        displayPopup = false;    
    } 
    
    public PageReference redirectPopup()
    {
        displayPopup = false;
        //Please uncomment below 3 statements and replace YourObjectId
        // PageReference p=new Pagereference('/'+YourObjectId);
        //  p.setRedirect(true);
        //  return p;      
        return null;
    }
    
    public List<SelectOption> getObjectOptions(){
        List<SelectOption> objectList = new List<SelectOption>();
        objectList.add(new SelectOption('', '--None--'));
        objectList.add(new SelectOption('Account', 'Account'));
        objectList.add(new SelectOption('Contact', 'Contact'));
        objectList.add(new SelectOption('Opportunity', 'Opportunity'));
        return objectList;
    }
    public void fillObject(){
        showObjectTable = true;
        objectRecords  = new Set<String>();
        Integer index = 1;
        objectWrapperRecords = new List<ObjectWrapper>();
        if(selectedObjectNamePopup == 'Account'){
            for(Account accountRecords : [SELECT Id, Name, AccountNumber FROM Account]){
                ObjectWrapper wrapper = new ObjectWrapper();
                wrapper.sNo = index;
                wrapper.id = accountRecords.Id;
                wrapper.Name = accountRecords.Name;
                wrapper.accountNumber = accountRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            }
        } else if(selectedObjectNamePopup == 'Contact'){
            for(Contact contactRecords : [SELECT Id, Name FROM Contact]){
                
                ObjectWrapper wrapper = new ObjectWrapper();
                wrapper.sNo = index;
                wrapper.Name = contactRecords.Name;
                wrapper.id = contactRecords.Id;
                // wrapper.accountNumber = contactRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            } 
        }else if(selectedObjectNamePopup == 'Opportunity'){
                for(Opportunity opportunityRecords : [SELECT Id, Name FROM Opportunity]){
                    //System.debug('opportunityRecords'+[SELECT Id, Name FROM Opportunity]);
                    
                    ObjectWrapper wrapper = new ObjectWrapper();
                    wrapper.sNo = index;
                    wrapper.id = opportunityRecords.Id;
                    wrapper.Name = opportunityRecords.Name;
                    // wrapper.accountNumber = contactRecords.AccountNumber;
                    objectWrapperRecords.add(wrapper);
                    index++;
                }
            }
        
    }
    
    
    public void copyAttachment(){
        allAttchments = new List<Attachment>();
        copyList = new List<ObjectWrapper>();
        for(ObjectWrapper newWrapper : objectWrapperRecords){
            if(newWrapper.popupSingleCheck == true){
                copyList.add(newWrapper);
            }
        }
        for(AttachmentWrapper wrapper : attachmentRecords){
            if(wrapper.singleCheck == true){
                for(ObjectWrapper cpy: copyList){
                Attachment attObj = new Attachment();
                attObj.body = wrapper.Body;
                attObj.name = Wrapper.Name;
                attObj.contentType = wrapper.ContentType;
                    attObj.ParentId = cpy.id;
                allAttchments.add(attObj);
                }
            }
        }
        
     if(allAttchments.size() > 0){
            insert allAttchments;
        }
    }
    
    
    /* Wrapper for Attachments Records */
    public class AttachmentWrapper{
        public Integer sNo{get;set;}
        public String name{get;set;}
        public String contentType{get;set;}
        public String attachmentUrl{get;set;}
        public Boolean singleCheck{get;set;}
        public Blob body;
    }
    
    /* Wrapper for Pop up Records */
    public class ObjectWrapper{
        public Integer sNo{get;set;}
        public String id{get;set;}
        public String Name{get;set;}
        public String accountNumber{get;set;}
        public Boolean popupSingleCheck{get;set;}
       
        
    }
}