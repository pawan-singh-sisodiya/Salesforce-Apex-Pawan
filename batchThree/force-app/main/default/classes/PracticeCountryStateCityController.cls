public class PracticeCountryStateCityController {

    public String selectedCountry{get;set;}
    public String selectedState{get;set;}
    
    public List<SelectOption> countryList{get;set;}
    public List<SelectOption> stateList{get;set;}
    public List<SelectOption> cityList{get;set;}
    
    public Map<String, Set<String>> countryStateMap{get;set;}
    public Map<String, Set<String>> stateCityMap{get;set;}
    
    public PracticeCountryStateCityController(){
        countryStateMap = new Map<String, Set<String>>();
        stateCityMap = new Map<String, Set<String>>();
        
        for(Country__c obj : [SELECT Id, Name, State__c, City__c FROM Country__c]){
            
            if(countryStateMap.containsKey(obj.Name)){
                countryStateMap.get(obj.Name).add(obj.State__c);
            }
            else{
                    countryStateMap.put(obj.Name, new Set<String>{obj.State__c});
            }
            
            if(stateCityMap.containsKey(obj.State__c)){
                stateCityMap.get(obj.State__c).add(obj.City__c);
            }
            else{
                stateCityMap.put(obj.State__c, new Set<String>{obj.City__c});
            }
        }
        countryMethod();
    }
    
    public void countryMethod(){
        countryList = new  List<SelectOption>();
        countryList.add(new SelectOption('None','--None--'));
        
        for(String country: countryStateMap.keySet()){
            countryList.add(new SelectOption(country, country));
        }
    }
    
    public void stateMethod(){
       stateList = new  List<SelectOption>();
       stateList.add(new SelectOption('None', '--None--'));
        
        if(countryStateMap.containsKey(selectedCountry)){
            for(String state: countryStateMap.get(selectedCountry)){
                stateList.add(new SelectOption(state, state));
            }
        }
    }
    
    public void cityMethod(){
        cityList = new  List<SelectOption>();
        cityList.add(new SelectOption('None', '--None--'));
        
        if(stateCityMap.containsKey(selectedState)){
            for(String city : stateCityMap.get(selectedState)){
                cityList.add(new SelectOption(city, city));
            }
        }
    }
}