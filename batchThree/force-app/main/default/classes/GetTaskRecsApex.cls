public class GetTaskRecsApex {

    @AuraEnabled
    public static List<Task> getOppRelatedTask(String recordId){
       List<Task> tasklist = new List<Task>(); 
       taskList = [Select Id, Subject, Status, ActivityDate, WhatId, What.name
        From Task
        Where whatid =: recordId 
       ];
       return taskList; 
       
    }
    
    
   @AuraEnabled
    public static void saveTaskRecord(List<Task> taskList,String recordId) {  
        System.debug('task list records =>'+ taskList);
        System.debug('task size() =>'+ taskList.size());
        for(Task taskRecord : taskList){
            taskRecord.WhatId = recordId;
        }
        if(taskList.size()>0){
            Upsert taskList;
        }
        
    }
     @AuraEnabled 
    public static Map<String, String> getStatusFieldValue(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Task.Status.getDescribe();
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {
            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
    
}