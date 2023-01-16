public class OpportunityPicklistController {
    

    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getPickListValues() {
        
        schema.DescribeFieldResult fieldDefination = Opportunity.StageName.getDescribe();
        List<schema.PicklistEntry> PicklistEntry = fieldDefination.getPickListValues();
        List<Map<String, String>> picklistValues = new List<Map<String, String>>();
        for(schema.PicklistEntry entry : PicklistEntry) {
            Map<String, String> value = new Map<String, String>();
            value.put('label',  String.valueOf(entry.getLabel()));
            value.put('value', String.valueOf(entry.getLabel()));
                picklistValues.add(value);
        }
        System.debug('picklistValues ' + picklistValues); 
        return picklistValues;
    }

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> opportunityListMethod(){
      List<Opportunity> oppList = [SELECT Id, Name, StageName FROM Opportunity];
      return oppList;
    }
}