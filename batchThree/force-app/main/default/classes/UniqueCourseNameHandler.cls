public class UniqueCourseNameHandler {

     public static void uniqueName(List<Course__c> newList){
        Set<String> courseName = new Set<String>();
        for(Course__c crse: newList){
            courseName.add(crse.Name);
        }
        
        Set<String> courseList = new Set<String>();
        
        for(Course__c cn: [SELECT Id, Name FROM Course__c Where Name IN : courseName]){
            courseList.add(cn.Name.toLowerCase());
        }
        
        for(Course__c obj: newList){
            if(courseList.contains(obj.Name.toLowercase())){
                obj.Name.addError('Duplicate name not allowed');
            }
        }
    }
}