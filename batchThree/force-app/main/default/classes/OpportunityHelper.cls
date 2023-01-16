public class OpportunityHelper {
    
    public static void opportunityUpdate(List<Opportunity> newList){ 
        
        Set<Id> accountId = new Set<Id>();  
        for(Opportunity op: newList){
            if(accountId != null){
                 accountId.add(op.AccountId);
            }
        }
        
        Map<Id, Account> nmap = new Map<Id, Account>([SELECT Id, Account_Type__c FROM Account WHERE Id in : accountId]);
        
        for(Opportunity op : newList){
           
            if(nmap.get(op.AccountId).Account_Type__c == 'Null'){
                op.Stage_Type__c = '0';
            }
            else
                if(nmap.get(op.AccountId).Account_Type__c =='Reseller'){
                    op.Stage_Type__c = '10';
                }
            else if(nmap.get(op.AccountId).Account_Type__c == 'Buyer'){
                op.Stage_Type__c = '25';
            }
            else if(nmap.get(op.AccountId).Account_Type__c == 'Current Customer'){
                op.Stage_Type__c = '100';
            }
        }
    }
}