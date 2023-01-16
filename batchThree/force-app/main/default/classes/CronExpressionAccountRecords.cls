global class CronExpressionAccountRecords implements System.Schedulable {

 
    global void execute(System.SchedulableContext sc){
       
        /*
        AccountRecordsBatch a = new AccountRecordsBatch();
        String sch = '00 10 23 1 11 ? 2022';
         system.schedule('AccountBatchApex_using_CronExp', sch, new CronExpressionAccountRecords());
*/
        
        Id jobId = Database.executeBatch(new AccountRecordsBatch());
    }
}