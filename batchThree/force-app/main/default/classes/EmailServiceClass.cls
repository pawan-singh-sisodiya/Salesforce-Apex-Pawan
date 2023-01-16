global class EmailServiceClass implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope){        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult(); 
        //Messaging.InboundEmail.TextAttachment[] tAttachments = email.textAttachments;
        Messaging.InboundEmail.BinaryAttachment[] bAttachments = email.BinaryAttachments; 
        System.debug('email : '+ email);
        Map<Integer,String> fieldIndexMap = new Map<Integer,String>();
        String csvbody='';
        String[] csvFileLines = new List<String>();
        List<Sobject> listToInsert= New List<sobject>();        
        system.debug('bAttachments****'+ bAttachments);
        if(bAttachments !=null){
            Messaging.InboundEmail.BinaryAttachment btt =bAttachments[0];
            System.debug('btt : ' + btt);
            if(btt.filename.endsWith('.csv')){
                String objectName = btt.filename.substringBeforeLast('.');
                csvbody = btt.body.toString();  
                system.debug('csvbody****'+ csvbody);               
                //Now sepatate every row of the Csv                    
                csvFileLines = csvbody.split('\n');
                system.debug('csvFileLines****'+ csvFileLines);
                if(csvFileLines.size() >= 2){
                    //System.debug('csvFileLines.get(0) : '+csvFileLines.get(0).split(','));
                    System.debug('csvFileLines.get(0) : '+csvFileLines.get(0));
                    getfieldsByIndex( csvFileLines.get(0).trim().split(','),objectName,fieldIndexMap);
                    Map<String,String> fieldType = getFieldsDataType(fieldIndexMap.values(),objectName);
                    system.debug('csvFileLines****'+ csvFileLines);
                    Sobject obj;
                    for(Integer i=1; i < csvFileLines.size(); i++){   
                        String[] csvRecordData = csvFileLines[i].trim().split(',');
                        
                        if(objectName.containsIgnoreCase('Account')){
                            obj = new Account();
                        }else if(objectName.containsIgnoreCase('Contact')){
                            obj = new Contact();
                        }
                        system.debug('fieldType****'+ fieldType);
                        system.debug('fieldIndexMap****'+ fieldIndexMap);
                        if(obj != null){
                            system.debug('csvRecordData****'+ csvRecordData);
                            for(Integer j=0; j < csvRecordData.size(); j++){
                                if(fieldIndexMap.containsKey(j) &&( csvRecordData.get(j) != null || String.isNotBlank( String.valueOf(csvRecordData.get(j))))){
                                    switch on fieldType.get(fieldIndexMap.get(j)){
                                        when 'BOOLEAN'{
                                            obj.put(fieldIndexMap.get(j), boolean.valueOf(csvRecordData.get(j)));
                                        }
                                        when 'DOUBLE' , 'CURRENCY'{
                                            obj.put(fieldIndexMap.get(j), Double.valueOf(csvRecordData.get(j)));
                                        }
                                        when 'INTEGER'{
                                            obj.put(fieldIndexMap.get(j), Integer.valueOf(csvRecordData.get(j)));
                                        }
                                        when 'DATE'{
                                            obj.put(fieldIndexMap.get(j), Date.valueOf(String.valueOf(csvRecordData.get(j))));                                       
                                        }
                                        when 'DATETIME'{
                                            obj.put(fieldIndexMap.get(j), DateTime.valueOf(String.valueOf(csvRecordData.get(j))));
                                        }
                                        when else {
                                            obj.put(fieldIndexMap.get(j), String.valueOf(csvRecordData.get(j)));
                                        }
                                    }
                                }
                            }               
                            listToInsert.add(obj);    
                        }
                    }     
                }
            }
            
            if(listToInsert.size() > 0)                
                insert listToInsert;
            system.debug('accountlist@@@'+ listToInsert);
        }        
        result.success = true;
        return result;        
    }  
   static void getfieldsByIndex(List<String> fieldList , String objName, Map<Integer , String> fieldIndexMap){
        for(FieldMapping__mdt field: [SELECT Id, Object_Type__c, Label, Field_Api_Name__c FROM FieldMapping__mdt WHERE Object_Type__c =: objName AND Label IN: fieldList]){
            System.debug('field : ' + field);
            fieldIndexMap.put(fieldList.indexOf(field.Label), field.Field_Api_Name__c.tolowercase());
        }
    }
    public static Map<String,String> getFieldsDataType(List<String> fields, String sObjName){
        Map<String,String> fieldsDataType = new Map<String,String>();
        Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(sObjName).getDescribe().fields.getMap();
        for(String fieldName: fieldMap.keySet()) {
            if(fields.contains(fieldName)){
                fieldsDataType.put(fieldName,String.valueOf(fieldMap.get(fieldName).getDescribe().getType()));
            }    
        }
        return fieldsDataType;
    }
    
}