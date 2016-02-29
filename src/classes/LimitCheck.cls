public with sharing class LimitCheck {
    
    public class dispList{
        public String p1 {get;set;}
        public String p2 {get;set;}
        public String p3 {get;set;}
    }

    public List<String> h1list {get;set;}
    public List<String> h2list {get;set;}
    public List<dispList> dList {get;set;}

    //コンストラクタ
    public LimitCheck() {
        dList = new List<dispList>();
        System.debug('■■■　1　■■■');
        List<String> l1 = new List<String>{'getAggregateQueries()','getLimitAggregateQueries()','getCallouts()',
                                          'getLimitCallouts()','getChildRelationshipsDescribes()','getLimitChildRelationshipsDescribes()',
                                          'getCpuTime()','getLimitCpuTime()','getDMLRows()',
                                          'getLimitDMLRows()','getDMLStatements()','getLimitDMLStatements()',
                                          'getEmailInvocations()','getLimitEmailInvocations()','getFieldsDescribes()',
                                          'getLimitFieldsDescribes()','getFieldSetsDescribes()','getLimitFieldSetsDescribes()',
                                          'getFindSimilarCalls()','getLimitFindSimilarCalls()','getFutureCalls()',
                                          'getLimitFutureCalls()','getHeapSize()','getLimitHeapSize()',
                                          'getMobilePushApexCalls()','getLimitMobilePushApexCalls()','getPicklistDescribes()',
                                          'getLimitPicklistDescribes()','getQueries()','getLimitQueries()',
                                          'getQueryLocatorRows()','getLimitQueryLocatorRows()','getQueryRows()',
                                          'getLimitQueryRows()','getQueueableJobs()','getLimitQueueableJobs()',
                                          'getRecordTypesDescribes()','getLimitRecordTypesDescribes()','getRunAs()',
                                          'getLimitRunAs()','getSavepointRollbacks()','getLimitSavepointRollbacks()',
                                          'getSavepoints()','getLimitSavepoints()','getScriptStatements()',
                                          'getLimitScriptStatements()','getSoslQueries()','getLimitSoslQueries()'};
        System.debug('■■■　2　■■■');
        System.debug('■■■　l1.size() : ' + l1.size() + '　■■■');
        h1list = l1;        
        System.debug('■■■　3　■■■');                        
        List<String> l2 = new List<String>{'Returns the number of aggregate queries that have been processed with any SOQL query statement.',
                                           'Returns the total number of aggregate queries that can be processed with SOQL query statements.',
                                           'Returns the number of Web service statements that have been processed.',
                                           'Returns the total number of Web service statements that can be processed.',
                                           'Deprecated. Returns the number of child relationship objects that have been returned.',
                                           'Deprecated. Returns the maximum number of child relationship objects that can be returned.',
                                           'Returns the CPU time (in milliseconds) accumulated on the Salesforce servers in the current transaction.',
                                           'Returns the time limit (in milliseconds) of CPU usage in the current transaction.',
                                           'Returns the number of records that have been processed with any statement that counts against DML limits, such as DML statements, the Database.emptyRecycleBin method, and other methods.',
                                           'Returns the total number of records that can be processed with any statement that counts against DML limits, such as DML statements, the database.EmptyRecycleBin method, and other methods.',
                                           'Returns the number of DML statements (such as insert, update or the database.EmptyRecycleBin method) that have been called.',
                                           'Returns the total number of DML statements or the database.EmptyRecycleBin methods that can be called.',
                                           'Returns the number of email invocations (such as sendEmail) that have been called.',
                                           'Returns the total number of email invocation (such as sendEmail) that can be called.',
                                           'Deprecated. Returns the number of field describe calls that have been made.',
                                           'Deprecated. Returns the maximum number of field describe calls that can be made.',
                                           'Deprecated. Returns the number of field set describe calls that have been made.',
                                           'Deprecated. Returns the maximum number of field set describe calls that can be made.',
                                           'This method is deprecated. Returns the same value as getSoslQueries. The number of findSimilar methods is no longer a separate limit, but is tracked as the number of SOSL queries issued.',
                                           'This method is deprecated. Returns the same value as getLimitSoslQueries. The number of findSimilar methods is no longer a separate limit, but is tracked as the number of SOSL queries issued.',
                                           'Returns the number of methods with the future annotation that have been executed (not necessarily completed).',
                                           'Returns the total number of methods with the future annotation that can be executed (not necessarily completed).',
                                           'Returns the approximate amount of memory (in bytes) that has been used for the heap.',
                                           'Returns the total amount of memory (in bytes) that can be used for the heap.',
                                           'Returns the number of Apex calls that have been used by mobile push notifications during the current metering interval.',
                                           'Returns the total number of Apex calls that are allowed per day for mobile push notifications.',
                                           'Deprecated. Returns the number of PicklistEntry objects that have been returned.',
                                           'Deprecated. Returns the maximum number of PicklistEntry objects that can be returned.',
                                           'Returns the number of SOQL queries that have been issued.',
                                           'Returns the total number of SOQL queries that can be issued.',
                                           'Returns the number of records that have been returned by the Database.getQueryLocator method.',
                                           'Returns the total number of records that have been returned by the Database.getQueryLocator method.',
                                           'Returns the number of records that have been returned by issuing SOQL queries.',
                                           'Returns the total number of records that can be returned by issuing SOQL queries.',
                                           'Returns the number of queueable jobs that have been added to the queue per transaction. A queueable job corresponds to a class that implements the Queueable interface.',
                                           'Returns the maximum number of queueable jobs that can be added to the queue per transaction. A queueable job corresponds to a class that implements the Queueable interface.',
                                           'Deprecated. Returns the number of RecordTypeInfo objects that have been returned.','Deprecated. Returns the maximum number of RecordTypeInfo objects that can be returned.',
                                           'This method is deprecated. Returns the same value as getDMLStatements.',
                                           'This method is deprecated. Returns the same value as getLimitDMLStatements.',
                                           'This method is deprecated. Returns the same value as getDMLStatements.',
                                           'This method is deprecated. Returns the same value as getLimitDMLStatements.',
                                           'This method is deprecated. Returns the same value as getDMLStatements.',
                                           'This method is deprecated. Returns the same value as getLimitDMLStatements.',
                                           'Deprecated. Returns a value that is based on CPU time usage and that is an approximation of script statement usage.',
                                           'Deprecated. Returns the maximum number of Apex statements that can execute.',
                                           'Returns the number of SOSL queries that have been issued.',
                                           'Returns the total number of SOSL queries that can be issued.'};
        System.debug('■■■　4　■■■');
        System.debug('■■■　l2.size() : ' + l2.size() + '　■■■');
        h2list = l2;
        System.debug('■■■　5　■■■');

        List<String> l3 = new List<String>();
        l3.add(String.valueOf(Limits.getAggregateQueries()));
        l3.add(String.valueOf(Limits.getLimitAggregateQueries()));
        l3.add(String.valueOf(Limits.getCallouts()));
        l3.add(String.valueOf(Limits.getLimitCallouts()));
        l3.add(''); //l3.add(String.valueOf(Limits.getChildRelationshipsDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitChildRelationshipsDescribes()));
        l3.add(String.valueOf(Limits.getCpuTime()));
        l3.add(String.valueOf(Limits.getLimitCpuTime()));
        l3.add(String.valueOf(Limits.getDMLRows()));
        l3.add(String.valueOf(Limits.getLimitDMLRows()));
        l3.add(String.valueOf(Limits.getDMLStatements()));
        l3.add(String.valueOf(Limits.getLimitDMLStatements()));
        l3.add(String.valueOf(Limits.getEmailInvocations()));
        l3.add(String.valueOf(Limits.getLimitEmailInvocations()));
        l3.add(''); //l3.add(String.valueOf(Limits.getFieldsDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitFieldsDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getFieldSetsDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitFieldSetsDescribes()));
        l3.add(String.valueOf(Limits.getFindSimilarCalls()));
        l3.add(String.valueOf(Limits.getLimitFindSimilarCalls()));
        l3.add(String.valueOf(Limits.getFutureCalls()));
        l3.add(String.valueOf(Limits.getLimitFutureCalls()));
        l3.add(String.valueOf(Limits.getHeapSize()));
        l3.add(String.valueOf(Limits.getLimitHeapSize()));
        l3.add(String.valueOf(Limits.getMobilePushApexCalls()));
        l3.add(String.valueOf(Limits.getLimitMobilePushApexCalls()));
        l3.add(''); //l3.add(String.valueOf(Limits.getPicklistDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitPicklistDescribes()));
        l3.add(String.valueOf(Limits.getQueries()));
        l3.add(String.valueOf(Limits.getLimitQueries()));
        l3.add(String.valueOf(Limits.getQueryLocatorRows()));
        l3.add(String.valueOf(Limits.getLimitQueryLocatorRows()));
        l3.add(String.valueOf(Limits.getQueryRows()));
        l3.add(String.valueOf(Limits.getLimitQueryRows()));
        l3.add(String.valueOf(Limits.getQueueableJobs()));
        l3.add(String.valueOf(Limits.getLimitQueueableJobs()));
        l3.add(''); //l3.add(String.valueOf(Limits.getRecordTypesDescribes()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitRecordTypesDescribes()));
        l3.add(String.valueOf(Limits.getRunAs()));
        l3.add(String.valueOf(Limits.getLimitRunAs()));
        l3.add(String.valueOf(Limits.getSavepointRollbacks()));
        l3.add(String.valueOf(Limits.getLimitSavepointRollbacks()));
        l3.add(String.valueOf(Limits.getSavepoints()));
        l3.add(String.valueOf(Limits.getLimitSavepoints()));
        l3.add(''); //l3.add(String.valueOf(Limits.getScriptStatements()));
        l3.add(''); //l3.add(String.valueOf(Limits.getLimitScriptStatements()));
        l3.add(String.valueOf(Limits.getSoslQueries()));
        l3.add(String.valueOf(Limits.getLimitSoslQueries()));

        for(Integer i = 0; i<l1.size(); i++){
            System.debug('■■■　6-1　■■■');
            dispList d = new dispList();
            System.debug('■■■　6-2　■■■');
            d.p1 = l1[i];
            System.debug('■■■　6-3　■■■');
            d.p2 = l2[i];
            System.debug('■■■　6-4　■■■');
            d.p3 = l3[i];
            System.debug('■■■　6-5　■■■');
            dList.add(d);
            System.debug('■■■　6-6　■■■');
        }
        //System.debug('■■■　6　■■■');

    }
    
}