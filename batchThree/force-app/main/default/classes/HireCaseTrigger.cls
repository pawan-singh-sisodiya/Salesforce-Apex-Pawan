public class HireCaseTrigger {
    public static void updateStatus(List<Case> newList, Map<Id, Case> oldMap){
        Map<Id, case> mapToBeUpdated = new Map<Id, case>();
        for(Case c : newList){
            if(c.Status == 'Closed' && oldMap.get(c.id).Status != c.Status){
                if(c.ContactId != null){
                    mapToBeUpdated.put(c.ContactId, c);
                }
                system.debug('mapToBeUpdated value :- '+ mapToBeUpdated);
            }
        }
        for(Hire__c form:[select id, Status__c, Candidate__c from Hire__c where Candidate__c in:mapToBeUpdated.keySet()]){
            if(form.Status__c != 'Completed' && mapToBeUpdated.containsKey(form.Candidate__c)){
                Case cas = mapToBeUpdated.get(form.Candidate__c);
                cas.addError('Change Hire Status Completed');
            }
        }
    }
    
}