public class ClientRequirementController {
    
    Public Opportunity opp{get;set;}
    public String taskId {get;set;}
    
    public task gettask(){
        task task;
        for(Task ts: [SELECT Id, WhoId, WhatId, Subject, ActivityDate, type, Status, Owner.Name, Owner.Email, CreatedBy.Name, OwnerId  FROM Task WHERE Id =: taskId]){
            task = ts;
        }
        if(task!= null){
            opp = [SELECT ID , Owner.Name, Owner.Email, Account.Name,Name FROM Opportunity WHERE ID =: task.WhatId];
        }
        return task;
    }
}