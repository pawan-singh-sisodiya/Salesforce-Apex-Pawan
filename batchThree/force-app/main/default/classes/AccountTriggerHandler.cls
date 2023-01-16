public class AccountTriggerHandler {

    public static void updateRating(List<Account> newList){
        for(Account acc : newList){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    
    public static void createRelatedOpp(List<Account> newList){
       List<Opportunity> oppTobeInserted = new List<Opportunity>();
        
        for(Account acc : newList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opp.Discount_Percent__c = 20;
            oppTobeInserted.add(opp);
        }
        
        if(!oppTobeInserted.isEmpty()){
            insert oppTobeInserted;
        }
    }
    
    public static void updatePhoneDescription(List<Account> newList, Map<Id, Account> oldMap){
        for(Account acc : newList){
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){
                acc.Description = 'Phone is Modified on Account';
            }
        }
    }
    public static void updateRelatedOppPhone(List<Account> newList, Map<Id, Account> oldMap){
        Map<Id, Account> accIdToAccountMap = new Map<Id, Account>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        for(Account acc : newList){
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){
                accIdToAccountMap.put(acc.Id, acc);
            }
        }
        for(Opportunity opp : [SELECT Id, Phone__c, AccountId FROM Opportunity WHERE AccountId IN : accIdToAccountMap.keySet()]){
            Opportunity oppr = new Opportunity();
            
            if(accIdToAccountMap.containsKey(oppr.AccountId)){
                oppr.Id = opp.Id;
                oppr.Phone__c = accIdToAccountMap.get(oppr.AccountId).Phone;
                oppToBeUpdated.add(oppr);
            }
        }
        if(!oppToBeUpdated.isEmpty()){
            UPDATE oppToBeUpdated;
        }
    }
}