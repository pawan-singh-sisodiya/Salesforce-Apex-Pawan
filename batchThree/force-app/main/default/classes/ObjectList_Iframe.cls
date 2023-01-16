public class ObjectList_Iframe {
    
    public Boolean showObjectTable{get;set;}
    public String selectedObjectName{get;set;}
    public List<ObjectWrapper> objectWrapperRecords{get;set;}
    
    Set<String> objectRecords{get;set;}
    
    public ObjectList_Iframe(){
        showObjectTable = false;       
        
    }
    public List<SelectOption> getoptions(){
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
        if(selectedObjectName == 'Account'){
            
            for(Account accountRecords : [SELECT Id, Name, AccountNumber FROM Account]){
                
                ObjectWrapper wrapper = new ObjectWrapper();
                wrapper.sNo = index;
                wrapper.Name = accountRecords.Name;
                wrapper.accountNumber = accountRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            }
        }
        if(selectedObjectName == 'Contact'){
            for(Contact contactRecords : [SELECT Id, Name FROM Contact]){
                
                ObjectWrapper wrapper = new ObjectWrapper();
                wrapper.sNo = index;
                wrapper.Name = contactRecords.Name;
                // wrapper.accountNumber = contactRecords.AccountNumber;
                objectWrapperRecords.add(wrapper);
                index++;
            }
            if(selectedObjectName == 'Opportunity'){
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