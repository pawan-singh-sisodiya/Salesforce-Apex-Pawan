public with sharing class AccountPicklistController {
    
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> accountPicklist(){
        Schema.DescribeFieldResult FieldRec = Account.Type.getDescribe();
        List<Schema.PicklistEntry> Picval = FieldRec.getPicklistValues();
        List<Map<String, String>> picklistVal = new List<Map<String, String>>();
        for(Schema.PicklistEntry entry :  Picval){
            Map<String, String> nmap = new Map<String, String>();
           nmap.put('label', entry.getLabel());
           nmap.put('value', entry.getValue());
           picklistVal.add(nmap);
        }
        return picklistVal;
    }
}