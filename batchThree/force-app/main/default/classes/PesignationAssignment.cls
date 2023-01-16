public class PesignationAssignment {
    
    public String searchString{get;set;}
    public String selectedType{get;set;}
    private String sortDirection = 'ASC';
    private String sortExp = 'name';
    
    public Integer selectedPageSize{get;set;}
    public List<PesignationWrapper> contactRecords{get;set;}
    private List<PesignationWrapper> tempContactRecords;
    
    public Boolean tostMassageShow{get;set;}
    
    public String sortExpression{
        get{
            return sortExp;
        }
        set{
            //if the column is clicked on then switch between Ascending and Descending modes
            if (value == sortExp)
                sortDirection = (sortDirection == 'ASC') ? 'DESC' : 'ASC';
            else
                sortDirection = 'ASC';
            sortExp = value;
        }
    }
    
    public String getSortDirection(){
        //if not column is selected 
        if (sortExpression == null || sortExpression == '')
            return 'ASC';
        else
            return sortDirection;
    }
    
    public void setSortDirection(String value){  
        sortDirection = value;
    }
    
    public PesignationAssignment(){
        tostMassageShow = false;
        selectedPageSize = 5;
        searchString = '';
        fillContactRecords();
    }
    
    public void ViewData() {
        String sortFullExp = sortExpression + ' ' + sortDirection;
        Set<String> recordIds = new Set<String>();
        for(PesignationWrapper wrapperRecord : contactRecords){
            recordIds.add(wrapperRecord.con.Id);
        }
        Integer index = 1;
        contactRecords = new List<PesignationWrapper>();
        String  queryString = 'SELECT id, Name, Email, Account.Name, Phone,Type__c FROM Contact WHERE id IN : recordIds order by ' + sortFullExp + ' limit 1000';
        for(Contact con : database.query(queryString)){
            PesignationWrapper wrapper = new PesignationWrapper();   
            wrapper.serialNo = index;
            wrapper.con = con;
            wrapper.singleCheckBox = false;
            contactRecords.add(wrapper);
            index++;
        }
    }
    
    public void fillContactRecords(){
        Integer index = 1;
        tempContactRecords = new List<PesignationWrapper>();
        String queryString = 'SELECT id, Name, Email, Account.Name, Phone,Type__c FROM Contact Where Name Like \'%' + searchString+ '%\'';
        for(Contact con : database.query(queryString)){
            PesignationWrapper wrapper = new PesignationWrapper();   
            wrapper.serialNo = index;
            wrapper.con = con;
            wrapper.singleCheckBox = false;
            tempContactRecords.add(wrapper);
            index++;
        }
        refreshPageSize1();
    }
    
    public void refreshPageSize1(){
        contactRecords = new List<PesignationWrapper>();
        for(PesignationWrapper p : tempContactRecords){
            if(contactRecords.size() < selectedPageSize){
                contactRecords.add(p);
            } else 
                break;
        }
    }
    
    public void refreshPageSize(){
            Integer firstSerailNo = 1; //contactRecords.get(0).serialNo;
        system.debug(firstSerailNo);
        contactRecords = new List<PesignationWrapper>();
        Integer index = 1;
        for(PesignationWrapper wrapper : tempContactRecords){
            if((wrapper.serialNo >= firstSerailNo && firstSerailNo != 0) && index <= selectedPageSize){
                contactRecords.add(wrapper);
                index++;
            }
        }
    }
    
    public void firstPage(){
        contactRecords = new List<PesignationWrapper>();
        for(PesignationWrapper wrapper : tempContactRecords){
            if(contactRecords.size() < selectedPageSize){
                contactRecords.add(wrapper);
            }
        }
    }
    
    public void lastPage(){
        Integer startIndex = tempContactRecords.size() - selectedPageSize;
        contactRecords = new List<PesignationWrapper>();
        Integer index = 0;
        for(PesignationWrapper wrapper : tempContactRecords){
            if(index >= startIndex){
                contactRecords.add(wrapper);
            }
            index++;
        }
    }
    
    public void next(){
        //  Integer lastIndex = contactRecords.size() - 1;
        Integer lastSerailNo = contactRecords.get(selectedPageSize - 1).serialNo;
        contactRecords = new List<PesignationWrapper>();
        Integer index = 1 ;
        
        for(PesignationWrapper wrapper : tempContactRecords){
            if(lastSerailNo < wrapper.serialNo && index <= selectedPageSize){
                contactRecords.add(wrapper);
                index++;
            }
        }
        
    }
    
    public void prev(){
        Integer firstSerailNo = contactRecords.get(0).serialNo;
        Integer startIndex = firstSerailNo - selectedPageSize;
        if(firstSerailNo > 1){
            contactRecords = new List<PesignationWrapper>();
            for(PesignationWrapper wrapper : tempContactRecords){
                if((wrapper.serialNo >= startIndex) && wrapper.serialNo < firstSerailNo){
                    contactRecords.add(wrapper);
                }
            }
        }
    }
    
    public void copyStatusMethod(){
        List<Contact> copyStatus = new List<Contact>();
        for(PesignationWrapper wrapper : tempContactRecords){
            if(wrapper.singleCheckBox == true){
                wrapper.con.type__c = selectedType;
                copyStatus.add(wrapper.con);
                wrapper.singleCheckBox = false;
            }  
        } 
        if(copyStatus.size() > 0){
            update copyStatus;
            tostMassageShow = true;
        }
    }
    
    public List<SelectOption> getAccountTypeValue(){
        List<SelectOption> accountTypeValue = new List<SelectOption>();
        accountTypeValue.add(new SelectOption('', '--Select--'));
        accountTypeValue.add(new SelectOption('Accepted', 'Accepted'));
        accountTypeValue.add(new SelectOption('Rejected','Rejected'));
        return accountTypeValue;
    }
    
    public List<SelectOption> getPageSizeMethod(){
        List<SelectOption> pageSize = new List<SelectOption>();
        pageSize.add(new SelectOption('5','5'));
        pageSize.add(new SelectOption('10','10'));
        pageSize.add(new SelectOption('25','25'));
        pageSize.add(new SelectOption('50','50'));
        return pageSize;
    }
    
    public class PesignationWrapper{
        public Integer serialNo{get;set;}
        public contact con{get;set;}
        public String attachRecord{get;set;}
        public Boolean singleCheckBox{get;set;}
    }
}