public class TaskTriggerHandler {
    public static void systemAdminDelete(List<Task> taskList){
        id ProfileId = userinfo.getProfileId();
        profile profileName = [SELECT name, id FROM profile WHERE id =:profileID];
        for(Task t: taskList){
            if(profileName.Name!='System Administrator'){
                t.addError('Only system admin can delete this task');
            }
        }
    }

}