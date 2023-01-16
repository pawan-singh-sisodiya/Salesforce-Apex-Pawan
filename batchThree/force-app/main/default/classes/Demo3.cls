public class Demo3 {
    
    public List<SelectOption> countryList{get;set;}
    public List<SelectOption> stateList{get;set;}
    public List<SelectOption> cityList{get;set;}
    public String stateName{get;set;}
    public String countryName{get;set;}
    public String cityName{get;set;}
    Map<String, Set<String>> nmap{get;set;}
    Map<String, Set<String>> cityMap{get;set;}
    public Demo3(){
        nmap = new  Map<String, Set<String>>();
        cityMap = new Map<String, Set<String>>();
        countryMethod();
    }
   
    public void countryMethod(){
    countryList = new List<SelectOption>();
        countryList.add(new SelectOption('', '--None--'));
        
        for(Country__c countryRecords : [Select Id, Name, State__c, City__c FROM Country__c])
        {
            Set<String> states = nmap.get(countryRecords.Name);
            Set<String> cities = cityMap.get(countryRecords.State__c);
            if(states == Null){
                states = new Set<String>();
            }
            if(cities == Null){
                cities = new Set<String>();
            }
            
            states.add(countryRecords.State__c);
            nmap.put(countryRecords.Name, states);
            
            cities.add(countryRecords.City__c);
            cityMap.put(countryRecords.State__c, cities); 
        }
        for(String key : nmap.keySet()){
            countryList.add(new SelectOption(key, key));
        }
        stateMethod();
    } 
    
    public void stateMethod(){
        stateList = new List<SelectOption>();
        stateList.add(new SelectOption('', '--None--'));
        if(nmap.containsKey(countryName)){
            for(String stateName : nmap.get(countryName)){
                stateList.add(new SelectOption(stateName, stateName));
            }
        }
    }
    
    public void cityMethod(){
        cityList = new List<SelectOption>();
        cityList.add(new SelectOption('', '--None--'));
        if(cityMap.containsKey(stateName)){
            for(String cityRec : cityMap.get(stateName)){
                cityList.add(new SelectOption(cityRec, cityRec));
            }
        }
    }
   
}