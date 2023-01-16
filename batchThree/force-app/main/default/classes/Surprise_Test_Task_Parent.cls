public class Surprise_Test_Task_Parent {
    
    public List<wrapperClass> wrapperList{get;set;}
    public List<Schema.SObjectType> parentRecords{get;set;}
    
    public Surprise_Test_Task_Parent(){
        parentRecords =new List<Schema.SObjectType>();
        wrapperList = new List<wrapperClass>();
        
        for(Task ts : [SELECT Subject, WhoId, WhatId, What.type FROM task]){
            wrapperClass wrapper = new wrapperClass();
            
            wrapper.whatId = ts.WhatId;
            wrapper.typeOf = ts.What.type;
            wrapperList.add(wrapper);
            System.debug('WrapperList'+ wrapperList);
        }
    }
    
    public class wrapperClass{
        public String whatId{get;set;}
        public String typeOf{get;set;}
    }
}