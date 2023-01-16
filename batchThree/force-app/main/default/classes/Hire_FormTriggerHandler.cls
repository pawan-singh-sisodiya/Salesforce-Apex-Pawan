public class Hire_FormTriggerHandler {
    
    public static void hireMethod(List<Hire__c> newList){
        List<Contact> contactList = new List<Contact>();
        for(Hire__c hr : newList){
            hr.Status__c = 'In Progress';
            Contact con = new Contact();
            con.FirstName = hr.Name;
            con.LastName = hr.Last_Name__c;
            con.Email = hr.Email__c;
            con.Phone = hr.Phone__c;
            
            contactList.add(con);
        }
        
        if(contactList.size() > 0){
            INSERT contactList;
        }
        List<Case> caseList = new List<Case>(); 
        
        for(Contact con: contactList){
            for(Hire__c hr : newList){
                hr.Candidate__c = con.Id;
            }
            
            Case caseObj = new Case();
            caseObj.Status = 'New';
            caseObj.ContactId = con.Id;
            caseList.add(caseObj);
        }
        if(caseList.size() > 0){
            INSERT caseList;
        }
        
        /*for(Hire__c hr2 : newList){
if(hr2.Status__c == 'Completed'){

for(Case cas : caseList){
cas.Status = 'Closed';
}
}
}*/
    }
    
    public static void updateHireStatus(List<Hire__c> newList, Map<Id, Hire__c> oldMap){
        Map<Id, Hire__c> hrIdToHireMap = new Map<Id, Hire__c>();
        //List<Hire__c> hireStatus = new List<Hire__c>();
        List<Case> caseToBeUpdated = new List<Case>();
        for(Hire__c hr : newList){
            if(hr.Status__c == 'Completed' && hr.Status__c != oldMap.get(hr.Id).Status__c){
                hrIdToHireMap.put(hr.Candidate__c, hr);
            }
        }
        
        for(Case caseItem : [SELECT id, ContactId, Status FROM Case WHERE ContactId IN : hrIdToHireMap.keySet()]){
            caseItem.Status = 'Closed';
            caseToBeUpdated.add(caseItem);
        }
        System.debug('caseToBeUpdated : '+ caseToBeUpdated);
        if(caseToBeUpdated.size() > 0){
            UPDATE caseToBeUpdated;
        }
    }
    
    /*List<Case> list_case = new List<Case>();
List<Id> list_conId = new List<Id>();
for(Hire__c form : old){
if(form.Status__c == 'Completed'){
list_conId.add(form.Candidate__c);
}
}
system.debug('List of ContactId='+ list_conId);
if(list_conId.size() > 0){
for(Case caseItem:[SELECT id,ContactId,Status FROM Case WHERE ContactId in:list_conId]){
caseItem.Status = 'Closed';
system.debug('case status ='+ caseItem.Status);
list_case.add(caseItem);
}
if(list_case.size() > 0){
update list_case;
system.debug('List of Case =' + list_case);
}
}*/
    /*Map<Id, Hire__c> mapToBeUpdated = new Map<Id, Hire__c>();
For(Case cas : [SELECT Id, Status FROM Case WHERE Id In : mapToBeUpdated.keySet()]){
Hire__c hire = new Hire__c();

if(mapToBeUpdated.containsKey(hire.Id)){

}
}

for(Hire__c hr : newList)
{
if(oldMap != null && hr.Status__c == 'Completed'){

}
}
}
}*/
}