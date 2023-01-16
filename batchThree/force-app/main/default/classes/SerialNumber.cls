public class SerialNumber {
    public List<AccountWrapper> accountList{get;set;}   // Create List of Wrapper Class
    public SerialNumber(){
        accountList = new List<AccountWrapper>();      // Allocate Memory
        fetchRecords();
    }
    Public void fetchRecords(){
        Map<Id,Integer> newMap = New Map<Id,Integer>();     
        Integer conCount = 0 ;
        for(Contact con : [SELECT ID, AccountId FROM contact]){
            conCount = newMap.get(con.AccountId);
            if(conCount == null){
                conCount=0;
            }
            conCount++;
            newMap.put(con.AccountId,conCount);
        }
        Integer index = 1;
        for(Account acc : [SELECT Name  FROM Account]){
            AccountWrapper wrapper = New  AccountWrapper();     // Create Object
            wrapper.sNo = index;
            wrapper.Name = acc.Name;
            wrapper.contactCount =newMap.get(acc.Id);
            index++;
            accountList.add(wrapper);
        }
    }
    public class AccountWrapper{
        public Integer sNo{get;set;}
        public String Name{get;set;}
        public Integer contactCount{get;set;}
    }
}