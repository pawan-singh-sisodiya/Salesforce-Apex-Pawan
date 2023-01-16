public class SurpriseTest2UsingMap {
    public List<opportunityWrapper> accountRecords{get;set;}
    
    public SurpriseTest2UsingMap(){
        opportunityMethod();
    }
    
    public void opportunityMethod(){
        accountRecords = new List<opportunityWrapper>();
        Integer index = 1;
       // Map<id, Account> opportunityMap = new Map<id, Account>();
        Map<Id,List<String>> oppNameMap = new map<Id,List<String>>();
       
    List<String> strList = new List<String>();
        
        for(Opportunity opp : [SELECT Id, AccountId, Name FROM Opportunity WHERE AccountId != null]){
           /* opportunityWrapper wrapper = new opportunityWrapper();
                wrapper.sNo = index;
                wrapper.oppName = '[';
               wrapper.accName = opportunityMap.get(opp.AccountId).Name;
          
            if(opp.AccountId != null){
                 wrapper.oppName += opp.Name; 
            }
            
         wrapper.oppName += ']';
            accountRecords.add(wrapper);
            index++;
*/
            if(oppNameMap.containsKey(opp.AccountId)){
                oppNameMap.get(opp.AccountId).add(opp.NAme);
            }else{
                oppNameMap.put(opp.AccountId , new List<String>{opp.Name});
            }
        }
         for(Account acc : [SELECT Id, Name FROM Account]){
             opportunityWrapper wrapper = new opportunityWrapper();
            wrapper.sNo = index;
                wrapper.oppName = oppNameMap.containsKey(acc.Id) ? oppNameMap.get(acc.Id).toString() : '';
               wrapper.accName = acc.Name;
             accountRecords.add(wrapper);
        }
            
    }
    
    public class opportunityWrapper{
        public Integer sNo{get;set;}
        public String accName{get;set;}
        public String oppName{get;set;}
    }
}