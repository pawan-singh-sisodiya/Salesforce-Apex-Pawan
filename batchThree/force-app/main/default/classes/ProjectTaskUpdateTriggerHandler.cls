public class ProjectTaskUpdateTriggerHandler {
    
  /*  public static void updateParentStatus(List<Project_Task__c> newList, Map<Id, Project_Task__c> oldMap){
        
        Map<String, Project_Task__c> taskIdToTaskMap = new Map<String, Project_Task__c>();
        List<Project_Trigger__c> projectListToBeUpdated = new List<Project_Trigger__c>();
        
        for(Project_Task__c tsk : newList){
            if(oldMap != null && tsk.Completed__c == true &&tsk.Completed__c != oldMap.get(tsk.id).Completed__c){
                taskIdToTaskMap.put(tsk.Project_Trigger__c, tsk);
            }
        }
        
        //  System.debug('taskIdToTaskMap : '+ taskIdToTaskMap);
        for(Project_Trigger__c pro: [SELECT Id, Name, Status__c FROM Project_Trigger__c WHERE Id IN : taskIdToTaskMap.keySet()]){
            Project_Trigger__c project = new Project_Trigger__c();
            
            if(taskIdToTaskMap.containsKey(pro.id) ){
                if(taskIdToTaskMap.get(pro.id).Type__c == 'New Task' && taskIdToTaskMap.get(pro.id).Completed__c == true){
                    project.Id = pro.Id;
                    project.Status__c = 'New';
                    projectListToBeUpdated.add(project);
                }
                else  if(taskIdToTaskMap.get(pro.id).Type__c == 'Planning Phase' && taskIdToTaskMap.get(pro.id).Completed__c == true){
                    project.Id = pro.Id;
                    project.Status__c = 'Planning';
                    projectListToBeUpdated.add(project);
                }
                else  if(taskIdToTaskMap.get(pro.id).Type__c == 'Construction Work' && taskIdToTaskMap.get(pro.id).Completed__c == true){
                    project.Id = pro.Id;
                    project.Status__c = 'Construction';
                    projectListToBeUpdated.add(project);
                }
                else  if(taskIdToTaskMap.get(pro.id).Type__c == 'Completion Step' && taskIdToTaskMap.get(pro.id).Completed__c == true){
                    project.Id = pro.Id;
                    project.Status__c = 'Deployment';
                    projectListToBeUpdated.add(project);
                }
                else  if(taskIdToTaskMap.get(pro.id).Type__c == 'Contract End' && taskIdToTaskMap.get(pro.id).Completed__c == true){
                    project.Id = pro.Id;
                    project.Status__c = 'Signoff';
                    projectListToBeUpdated.add(project);
                }
            }
        }
        
        if(!projectListToBeUpdated.isEmpty()){
            update projectListToBeUpdated;
        }
    }  */
    
  /* public static void updatePreiousCheckBox(List<Project_Task__c> newList, Map<Id, Project_Task__c> oldMap){
        
     Set<Id> preiousTaskSet = new Set<Id>();
       
       for(Project_Task__c pr : newList){
           if(pr.Completed__c == true && pr.Completion_Date__c == null){
               pr.Completion_Date__c.addError('Please enter completion date first');
           }
           preiousTaskSet.add(pr.Previous_Task__c);
       }
       
       Map<Id, Project_Task__c> nmap = new Map<Id, Project_Task__c>([SELECT Id, Completed__c FROM Project_Task__c WHERE Id IN :preiousTaskSet]);
       
       for(Project_Task__c pr : newList){
           if(pr.Completed__c == true && pr.Previous_Task__c != null && nmap.get(pr.Previous_Task__c).Completed__c != true){
               pr.Completed__c.addError('Please check previous checkbox');
           }
       }
       
   }   */
    
    
  /*  public static void updateParentStatus(List<Project_Task__c> tasksRecords, Map<Id, Project_Task__c> projectTaskOldMap){
   
        List<Project_Trigger__c> projectRecords = new List<Project_Trigger__c>();
        Project_Trigger__c parent;
        for(Project_Task__c task : tasksRecords){
            if(task.Completed__c == true){
                if(task.Completed__c != projectTaskOldMap.get(task.id).Completed__c){
                    parent = new Project_Trigger__c(id = task.Project_Trigger__c, Status__c == 'New');
                }
            }
        }
    }  */
    
}