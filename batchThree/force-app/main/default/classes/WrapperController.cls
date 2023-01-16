public class WrapperController {
    public List<contactWrapper> contactRecords{get;set;}
    
    public WrapperController(){
        contactRecords = new List<contactWrapper>();
        Integer index = 1;
        for(Contact contactRecord : [SELECT Id, FirstName, LastName FROM Contact LIMIT 10]){
            contactWrapper contactWrapperRecord = new contactWrapper();
            contactWrapperRecord.sNO = index;
            contactWrapperRecord.FirstName = contactRecord.FirstName;
            contactWrapperRecord.LastName = contactRecord.LastName;
            contactRecords.add(contactWrapperRecord);
            index ++;
        }
    }
    
    class contactWrapper{
        public Integer sNo{get;set;}
        public String FirstName{get;set;}
        public String LastName{get;set;}
    }
}