global class OpportunityOneMonthSchedular implements Schedulable {

    global void execute(SchedulableContext sc){
        OpportunityOneMonthBatch o = new OpportunityOneMonthBatch();
        database.executeBatch(o);
    }
}