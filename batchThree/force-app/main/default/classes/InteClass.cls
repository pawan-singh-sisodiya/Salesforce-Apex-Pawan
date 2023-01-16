@RestResource(urlMapping= '/getLeadInfo/*')
global class InteClass {

     @HttpGet
    global static Lead getLead(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String urlId = req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
        Lead ld = [SELECT Id, Name FROM Lead WHERE Id =: urlId];
        return ld;
    }
    
}