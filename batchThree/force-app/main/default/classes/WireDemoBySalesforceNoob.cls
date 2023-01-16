public class WireDemoBySalesforceNoob {
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> contactMethod(){
        List<Contact> conList = [SELECT Id, Name FROM Contact];
        return conList;
    }
    
    @AuraEnabled
    public static List<Contact> contMethod(){
        List<Contact> contList = [SELECT Id, Name FROM Contact];
        return contList;
    }

}