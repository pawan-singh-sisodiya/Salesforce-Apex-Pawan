public class CountryStateCity {

    public List<countryWrapper> countryRecords{get;set;}
    public List<countryWrapper> stateRecords{get;set;}
    public List<countryWrapper> cityRecords{get;set;}
    
    public CountryStateCity(){
        countryRecords = new List<countryWrapper>();
        stateRecords = new List<countryWrapper>();
        cityRecords = new List<countryWrapper>();
    }
    public class countryWrapper{
        public String countryName{get;set;}
        public String StateName{get;set;}
        public String cityName{get;set;}
    }
}