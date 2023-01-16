public class TaskDeleteSystemAdminTrigger {
    
    public static void taskMethod(List<Task> newList){
        Id pid = Userinfo.getProfileId();
        Profile pname=[select Name from Profile where id=:pid];
        
        for(Task obj: newList){
            if(pname.Name!='System Administrator'){
                obj.addError('You have no Access To Delete');
            }
        }
    }
}