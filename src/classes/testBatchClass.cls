public without Sharing class testBatchClass implements Database.Batchable<sObject>, Database.Stateful{

public testBatchClass(){

}

public Database.QueryLocator start(Database.BatchableContext bc){
    String query;
    query = 'Select Id, Name From Obj_CheckIn__c';
    return Database.getQueryLocator(query);
}

public void execute(Database.BatchableContext BC, List<sObject> scope){

}

public void finish(Database.BatchableContext BC){

}

}