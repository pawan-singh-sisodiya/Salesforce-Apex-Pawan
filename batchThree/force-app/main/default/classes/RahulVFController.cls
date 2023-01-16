public class RahulVFController {

    public List<Task> taskRecords{get;set;}
    public RahulVFController(){
        taskRecords = new List<Task>();
        
        for(Task tsk : [SELECT Id, WhoId, WhatId, Subject, Status FROM Task]){
            taskRecords.add(tsk);
        }
        
    }
}