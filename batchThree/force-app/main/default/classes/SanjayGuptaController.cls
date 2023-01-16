public class SanjayGuptaController {
    
    public List<accountWrapper> accountRecords{get;set;}
    Map<Id, Opportunity> nmap = new Map<Id, Opportunity>();
    List<Opportunity> oppList = new List<Opportunity>();
    
    public SanjayGuptaController(){
        accountRecords = new List<accountWrapper>();
        for(Account acc: [SELECT Id, Name, Phone, (SELECT Id, Name, CloseDate, 	StageName FROM Opportunities) FROM Account]){
            
            accountWrapper wrapper = new accountWrapper();
            wrapper.accId = acc.Id;
            wrapper.accName = acc.Name;
            wrapper.Phone = acc.Phone;
            if(acc.Opportunities != null){
                nmap.put(acc.Id, acc.Opportunities);
                oppList.add(acc.Opportunities);
                System.debug('opportunity values in list-->'+ oppList);
            }
            
            if(oppList.size() >0){
                for(Opportunity opp : oppList){
                    wrapper.oppId = opp.Id;
                    wrapper.oppName = opp.Name;
                    wrapper.closeDate = opp.CloseDate;
                    wrapper.stage = opp.StageName;
                }
            }
            
            accountRecords.add(wrapper);
            System.debug('Account related opportunity - '+ accountRecords);
        }
    }
    
    public class accountWrapper{
        public String accId{get;set;}
        public String accName{get;set;}
        public String Phone {get;set;}
        public String oppId{get;set;}
        public String oppName{get;set;}
        public Date closeDate{get;set;}        
        public String stage{get;set;}        
    }
}