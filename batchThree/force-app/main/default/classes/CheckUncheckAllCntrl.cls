public class CheckUncheckAllCntrl {
    public Boolean mainBoxValue{get;set;}
    public List<checkBoxWrapper> wrapperAccList{get;set;}
    
    public CheckUncheckAllCntrl(){
        wrapperAccList = new List<checkBoxWrapper>();
        for(Account acc :[Select Id,Name,OwnerId from Account limit 10]){
            wrapperAccList.add(new CheckBoxWrapper(false,acc));
        }
    }
    
    public void checkUncheckAll(){
        for(CheckBoxWrapper wrapObj : wrapperAccList){
            wrapObj.flag = mainBoxValue;
        }
    }
    
    public class CheckBoxWrapper{
        public Boolean flag{get;set;}
        public Account accObj{get;set;}
        
        public CheckBoxWrapper(Boolean flagValue,Account accObj){
            this.flag = flagValue;
            this.accObj = accObj;
        }
    }
}