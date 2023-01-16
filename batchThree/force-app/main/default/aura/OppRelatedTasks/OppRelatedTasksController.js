({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Subject', fieldName: 'Subject', type: 'Picklist'},
            {label: 'DueDate', fieldName: 'ActivityDate', type: 'Date'},
            {label: 'Status', fieldName: 'Status', type: 'Picklist'}
            
            
        ]);
        var action = cmp.get("c.getOppRelatedTask");
        action.setParams({ recordId : cmp.get("v.recordId") });
        console.log(cmp.get("v.recordId"));
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                console.log('Task Records : ',storeResponse );
                cmp.set("v.data", storeResponse);
            }
        });
        $A.enqueueAction(action);
        
        var getStatusPicklist = cmp.get("c.getStatusFieldValue");
        getStatusPicklist.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var filterMap = [];
                for(var key in result){
                    filterMap.push({key: key, value: result[key]});
                }
                cmp.set("v.statusMap", filterMap);
            }
        });
        $A.enqueueAction(getStatusPicklist);
    },
    
     rowAddition: function(cmp, event, helper) {
        var newTaskRecordList = new Array();
        var newTaskRecordList = cmp.get("v.data");  
           newTaskRecordList.push({
            'Id' : null,
            'Subject': '',
            'ActivityDate': '',
            'CallDisposition' : '',
            'CallObject':''
            
        });
        var temp = JSON.parse(JSON.stringify(newTaskRecordList));
        cmp.set("v.data", temp);
        
    },
    
     save: function(cmp, event, helper) {      
        
            
            console.log('enter the insertion');
            console.log('All Records',cmp.get("c.saveTaskRecord"));
            var action = cmp.get("c.saveTaskRecord");
            action.setParams({
                "recordId" : cmp.get("v.recordId"),
                "taskList": cmp.get("v.data")
            });
            action.setCallback(this, function(response) {
               
                var state = response.getState();
                console.log('call back function entered', state);
                if (state === "SUCCESS") {
                   
                    alert('Tasks saved successfully');
                }
            }); 
            $A.enqueueAction(action);
        
    },
    
     deleteRecord: function(cmp, event, helper) {
        
        var taskRecords = cmp.get("v.data");
        var selectedItem = event.currentTarget;
        var index = selectedItem.dataset.record;
        taskRecords.splice(index, 1);
        var tempArray = JSON.parse(JSON.stringify(taskRecords));
        cmp.set("v.data", tempArray);
     }
})