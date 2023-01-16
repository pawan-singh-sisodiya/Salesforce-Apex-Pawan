public class SelectList {
    public String country{get;set;}
    public String state{get;set;}
    public String city{get;set;} 
     
    Map<String, Set<String>> nmap{get;set;}
    Map<String, Set<String>> cityMap{get;set;}
     
    public List<SelectOption> countryList{get;set;}
    public List<SelectOption> stateList{get;set;}
    public List<SelectOption> cityList{get;set;}
     
    public SelectList(){
        nmap = new Map<String, Set<String>>();
        cityMap = new Map<String, Set<String>>();
        countrymethod();
    }    
    public void countrymethod(){
        countryList = new List<SelectOption>();
        countryList.add(new SelectOption('None', '--None--'));
        for(Country__C con : [SELECT Name, State__c, City__C FROM Country__c]){
            Set<String> states = nmap.get(con.Name);
            Set<String> Cities = cityMap.get(con.State__c);
            if(states==null){
                states= new Set<String>();
            }
            if(cities == null){
                cities = new Set<String>();
            }       
            states.add(con.State__c);
            cities.add(con.City__c);
            
            nmap.put(con.Name, states);
            cityMap.put(con.State__c, cities);
            system.debug('city map '+cityMap );
        }
        for(String Key : nmap.keySet()){
            countryList.add(new SelectOption(Key, Key));
        }
        stateMethod();  
        cityMethod();
    }
    public void stateMethod(){
        //cityList.clear();
        stateList = new List<selectOption>();
        stateList.add(new SelectOption('None','None'));
        If(nmap.containsKey(country)){       
            for(String state : nmap.get(country)){
                stateList.add(new SelectOption(state , state));
            }
        } 
       cityMethod();
    }
    public void cityMethod(){
        cityList = new List<selectOption>();
        cityList.add(new SelectOption('None','None'));
        If(cityMap.containsKey(state)) {
            for(String cityrec : cityMap.get(state)) {
                cityList.add(new SelectOption(cityrec , cityrec));
            }
        }    
    }
}