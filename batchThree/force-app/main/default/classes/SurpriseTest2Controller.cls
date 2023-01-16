public class SurpriseTest2Controller {
    
    public List<OpportunityWrapper> accountRecords{get;set;}
    public SurpriseTest2Controller(){
        accountMethod();
    }
    
    public void accountMethod(){
        accountRecords = new List<OpportunityWrapper>();
        Integer index = 1;
        
        String[] oppNameStr = new String[]{};
            for(Account acc : [SELECT Id, Name, (SELECT Id, Name FROM Opportunities) FROM Account]){
                OpportunityWrapper wrapper = new OpportunityWrapper();
                wrapper.sNo = index;
                wrapper.oppName = '[';
                wrapper.accName = acc.Name;
                if(acc.Opportunities.size() > 0){
                    for(Opportunity opp : acc.Opportunities){
                     
                           // oppNameStr.add(opp.Name);
                            
                          //  for(String o : oppNameStr){
                                wrapper.oppName += opp.Name +',';
                          //  }
                        
                    } 
                }
             wrapper.oppName += ']'; 
                accountRecords.add(wrapper);
                index++;
            }
    }
    
    public class OpportunityWrapper{
        public Integer sNo{get;set;}
        public String accName{get;set;}
        public String oppName{get;set;}

    }
    
}