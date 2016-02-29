trigger PreventDuplicateMaster1 on tt8__Master1__c (before insert,before update) 
{   
    Map<String, tt8__Master1__c> nonpmap = new Map<String, tt8__Master1__c>();
    
    for(tt8__Master1__c obj: [Select Id,Name,tt8__User__c from tt8__Master1__c]){
        if(obj.tt8__User__c != null){
            String key = obj.tt8__User__c;
            key = key.touppercase();
            if(!nonpmap.containsKey(key)){ 
                nonpmap.put(key,obj); 
            }   
        }
                
    }

    if(trigger.isInsert){   
        for (tt8__Master1__c obj : Trigger.new){
            if(obj.tt8__User__c != null){
                String key = obj.tt8__User__c;
                key = key.touppercase();
                if(nonpmap.containsKey(key)){
                    obj.tt8__User__c.addError('エラー文');
                }
            }
            
        }                        
    }
    
    if(Trigger.isUpdate){
        for(tt8__Master1__c obj : Trigger.new){
            if(obj.tt8__User__c != null){
                String key = obj.tt8__User__c;
                String oldKey = Trigger.oldMap.get(obj.Id).tt8__User__c;
                key = key.touppercase();
                oldKey = oldKey.touppercase();
                if(oldKey != key && nonpmap.containsKey(key)){
                    obj.tt8__User__c.addError('エラー文');
                }
            }
            
        }
    }
}