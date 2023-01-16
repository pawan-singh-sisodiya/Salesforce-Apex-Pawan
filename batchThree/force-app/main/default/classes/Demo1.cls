public class Demo1 {
    public list<String> objname1 { get; set; }
    
    public list<sobject> mysobject { get; set; }
    public boolean kr  { get; set; }  
    public boolean kk  { get; set; }
    public String textvalue { get; set; }
    public String operatorname { get; set; }
    public String objfeild { get; set; }
    public String objname { get; set; }
    string queryStr;
    public list<selectoption> getobjnames() {
        list<selectoption> options = new list<selectoption>(); 
        options.add(new SelectOption('None','--none---'));
        options.add(new SelectOption('Account','Account'));
        options.add(new SelectOption('Contact','Contact'));
        return options;    
    }
    public list<selectoption> getobjfeilds() {
        list<selectoption> options = new list<selectoption>(); 
        try{
           // options.add(new SelectOption('None','--none---'));
            Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
            Schema.SObjectType sobjType = gd.get(objname); 
            Schema.DescribeSObjectResult describeResult = sobjType.getDescribe(); 
            Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap();
            for (Schema.SObjectField fieldName: fieldsMap.values()) {
                schema.describefieldresult dfield = fieldName.getDescribe();
                options.add(new SelectOption(dfield.getname(), dfield.getLabel()));  
            } 
        }
        catch(exception e){} 
        return options;    
    }
    public list<selectoption> getoperator() {
        list<selectoption> options = new list<selectoption>();
        options.add(new SelectOption('None','--none---'));
        options.add(new SelectOption('=','Equals'));
        options.add(new SelectOption('!=','Not Equals'));
        options.add(new SelectOption('>','Greater Than'));
        options.add(new SelectOption('<','Less Than'));
        return options;
    } 
    public void act1() {
        kk=true;
    } 
    public void act2() {
        kr=true; 
    } 
    
    public void searching(){
        Schema.SObjectType t  = Schema.getGlobalDescribe().get(objname);
       
        if(textvalue!=null){
            queryStr = 'select id ,name  from ' + t;       
            objname1 = New List<string>();
            objname1 .add('Id');
            objname1 .add('name');
            mysobject = database.query(queryStr);
      } 
    }
}