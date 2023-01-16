global class AccountInsertionScheduler2 implements system.Schedulable {

    global void execute(SchedulableContext sc){
        AccountRecordsBatch accRecBatch = new AccountRecordsBatch();
        database.executeBatch(accRecBatch, 5);
    }
}