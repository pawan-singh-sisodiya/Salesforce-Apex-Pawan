trigger TaskDeleteSystemAdministrator on Task (before delete) {

    if (Trigger.isbefore && Trigger.isdelete) {
        TaskDeleteSystemAdminTrigger.taskMethod(Trigger.old);
    }

}