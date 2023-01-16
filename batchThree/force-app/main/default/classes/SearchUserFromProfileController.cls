public with sharing class SearchUserFromProfileController {
   
    @AuraEnabled(cacheable = true)
    public static List<User> profileMethod(){
     List<User> profileList = [SELECT Id, Name, ProfileId, FullPhotoUrl FROM User];
     return profileList;
    }
}