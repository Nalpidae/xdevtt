public with sharing class C_TestObj{

    public List<tt8__TestObj__c> ListTestObj {get;set;}

    public C_TestObj(){
        ListTestObj = new List<tt8__TestObj__c>();
        ListTestObj = [Select Id, Name, tt8__TestText__c, tt8__TestRichText__c, tt8__TestLongTextArea__c, tt8__Obj_DateTest__c
                       From tt8__TestObj__c];
    }

}