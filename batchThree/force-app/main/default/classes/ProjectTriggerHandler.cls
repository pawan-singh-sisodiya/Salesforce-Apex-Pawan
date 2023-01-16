public class ProjectTriggerHandler {
    
  /*  public static void createRecords(List<Project_Trigger__c> newList){
        List<Project_Task__c> taskRecords = new List<Project_Task__c>();
        for(Project_Trigger__c proj: newList){
            for(integer i=1; i<=5; i++){
                Project_Task__c taskObject = new Project_Task__c();
                taskObject.Project_Trigger__c  = proj.id;
                
                switch on i {
                    when 1 {
                        taskObject.Type__c = 'New Task';
                    }
                    when 2 {	
                        taskObject.Type__c = 'Planning Phase';
                    }
                    when 3 {
                        taskObject.Type__c = 'Construction Work';
                    }
                    when 4 {
                        taskObject.Type__c = 'Completion Step';
                    }
                    when 5 {
                        taskObject.Type__c = 'Contract End';
                    }
                } 
                taskRecords.add(taskObject);
            }
            if(taskRecords.size()>0){
                insert taskRecords;
            }
            
            if(taskRecords.size() > 0){
                for(integer i=0; i<4; i++){
                    taskRecords[i+1].Previous_Task__c = taskRecords[i].id;
                }
                update taskRecords;
            }
        }
    }  */
    
    // ---------------------------- SECOND WAY ------------------------------------------
    
    public static void createRecords(List<Project_Trigger__c> prejectRecords){
     List<Project_Task__c> taskRecords = new List<Project_Task__c>();
        
        for(Project_Trigger__c project : prejectRecords){
            taskRecords.add(new Project_Task__c(Project_Trigger__c = project.Id ,Type__c = 'New Task'));
            taskRecords.add(new Project_Task__c(Project_Trigger__c = project.Id ,Type__c = 'Planning Phase'));
            taskRecords.add(new Project_Task__c(Project_Trigger__c = project.Id ,Type__c = 'Construction Work'));
            taskRecords.add(new Project_Task__c(Project_Trigger__c = project.Id ,Type__c = 'Completion Step'));
            taskRecords.add(new Project_Task__c(Project_Trigger__c = project.Id ,Type__c = 'Contract End'));
        }
        
        if(taskRecords.size() > 0){
            INSERT taskRecords;
        }
        
        for(integer i=0; i<4; i++){
            taskRecords[i+1].Previous_Task__c = taskRecords[i].id;
        }
        
        if(taskRecords.size() > 0){
             UPDATE taskRecords;
        }
    }
}