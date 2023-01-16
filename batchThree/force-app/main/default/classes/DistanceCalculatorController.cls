@RestResource(urlMapping='/getRouteData/*')
global class DistanceCalculatorController {
    @HttpGet
     global static Decimal distanceCal(){
        
        
        String origin = RestContext.request.params.get('origin');
        String destination = RestContext.request.params.get('destination');
         System.debug('origin'+ origin);
         System.debug('destination'+ destination);
         
         
        Decimal distance=0;
        if(origin.toLowerCase() == destination.toLowerCase()){
            return distance;
        }
        Map<Id,Route__c> nextstation = new Map<Id,Route__c>();
        Map<String, Route__c> originDestMap = new Map<String,Route__c>();
        Route__c tempRoute;
        Set<String> startingRoute = new Set<String>(); 
        boolean destFound = false;
        Map<Id,Route__c> routeRecords = new Map<Id,Route__c>([SELECT Id, Name, Previous_Station__c, Previous_Station__r.Name, Distance__c FROM Route__c]);
        for(Route__c route : routeRecords.values()){
            if(route.Name.equalsIgnoreCase(origin)){
                originDestMap.put('origin' , route);
                system.debug('originDestMap _ origin ==> '+originDestMap);
            }
            if(route.Name.equalsIgnoreCase(destination)){
                destFound = true;
                originDestMap.put('destination' , route);
                system.debug('originDestMap _ destination ==> '+originDestMap);
            }
            if(route.Previous_Station__c != null){
                nextstation.put(route.Previous_Station__c , route);
                system.debug('nextstation _ Previous_Station__c ==> '+nextstation);
            }
            else{
                startingRoute.add(route.Id);
                system.debug('startingRoute ==> '+startingRoute);
            } 
        }
        System.debug(' startingRoute : '+startingRoute);
        for(string str : startingRoute){
            Route__c route = routeRecords.get(str);
            List<String> routeList = new List<String>{route.Name.toLowerCase()};
                while(nextstation.containsKey(route.Id)){
                    routeList.add(nextstation.get(route.Id).Name.toLowerCase());
                    route = nextstation.get(route.Id);
                }
            System.debug('routeList : '+routeList);
            if(routeList.contains(origin.toLowerCase()) && routeList.contains(destination.toLowerCase())){
                System.debug(routeList.indexOf(origin.toLowerCase()) + ' : ' + routeList.indexOf(destination.toLowerCase()));
                if(routeList.indexOf(origin.toLowerCase()) > routeList.indexOf(destination.toLowerCase())){
                    string temp = origin;
                    origin = destination;
                    destination = temp;
                    tempRoute = originDestMap.get('destination');
                }else{
                    tempRoute = originDestMap.get('origin');
                }
                System.debug(origin +' : '+destination);
                break;
            }
        }
        
        if(tempRoute != null && destFound){
             System.debug('distance  : ' + distance);
            while(!tempRoute.Name.equalsIgnoreCase(destination)){
                if(nextstation.containsKey(tempRoute.Id)){
                    distance += nextstation.get(tempRoute.Id).Distance__c;
                    tempRoute = nextstation.get(tempRoute.Id);
                }
            }
        }
        
        System.debug('distance  : ' + distance);
        return distance;
    }
}