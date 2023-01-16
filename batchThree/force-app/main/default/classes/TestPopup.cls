public with sharing class TestPopup {
    public Boolean displayPopup {get;set;}           //done
       public Boolean showObjectTable{get;set;}     //done
 
      public String selectedObjectNamePopup{get;set;}      //done
    public List<ObjectWrapper> objectWrapperRecords{get;set;}
    Set<String> objectRecords{get;set;}                       //done
    
    public TestPopup(){
        showObjectTable = false;         //done
    }
    
    public void showPopup()
    {       
    displayPopup = true;  
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
                wrapper.Name = accountRecords.Name;
                wrapper.accountNumber = accountRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            }
        }
        if(selectedObjectNamePopup == 'Contact'){
            for(Contact contactRecords : [SELECT Id, Name FROM Contact]){
                
                ObjectWrapper wrapper = new ObjectWrapper();
                wrapper.sNo = index;
                wrapper.Name = contactRecords.Name;
                // wrapper.accountNumber = contactRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            }
            if(selectedObjectNamePopup == 'Opportunity'){
                for(Opportunity opportunityRecords : [SELECT Id, Name FROM Opportunity]){
                    
                    ObjectWrapper wrapper = new ObjectWrapper();
                    wrapper.sNo = index;
                    wrapper.Name = opportunityRecords.Name;
                    // wrapper.accountNumber = contactRecords.AccountNumber;
                    objectWrapperRecords.add(wrapper);
                    index++;
                }
            }
        }
    }
    public class ObjectWrapper{
        public Integer sNo{get;set;}
        public String id{get;set;}
        public String Name{get;set;}
        public String accountNumber{get;set;}
        
    }
    
}