public class MaserInputController{

    public Master1__c master {get; set;}

    public MaserInputController(){
        master = new Master1__c();
    }
 
    public void save(){
        try{
            Database.SaveResult result = Database.insert(master, false);
            checkResult(result);
            // insert master;
        }
        catch(Exception e){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, /*e.getTypeName(),*/ e.getMessage()));
        }
        
    }

    /**
     * insert、update結果を確認する
     * @param result [description]
     */
    private void checkResult(Database.SaveResult result){
        //失敗の場合のみ確認を行う
        if (!result.isSuccess()) {
 
            Datacloud.DuplicateResult duplicateResult;
            List<Datacloud.MatchRecord> matchRecords;
            List<Datacloud.FieldDiff> errFields;
         
            List<String> duplicateItems = new List<String>();
            List<Id> duplicateIds = new List<id>();
             
            for(Database.Error duplicateError : result.getErrors()){
                duplicateResult = ((Database.DuplicateError)duplicateError).getDuplicateResult();
            }
            
            for(Datacloud.MatchResult duplicateMatchResult : duplicateResult.getMatchResults()) {
                matchRecords = duplicateMatchResult.getMatchRecords();
            }
         
            for(Datacloud.MatchRecord duplicateMatchRecord : matchRecords) {
                duplicateIds.add(duplicateMatchRecord.getRecord().Id);
                errFields = duplicateMatchRecord.getFieldDiffs();
            }
         
            for (Datacloud.FieldDiff diff : errFields) {
                if (diff.getDifference() == 'Same') {
                    duplicateItems.add(diff.getName());
                }
            }
         
            system.debug('重複レコードID:' + duplicateIds);
            system.debug('重複項目:' + duplicateItems);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, '重複レコードID:' + duplicateIds));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, '重複項目:' + duplicateItems));
         
        }
    }

}