public with sharing class C_Datetest2 {

    //オブジェクト
    public Obj_DateTest__c chkin {get; set;}
    
    public List<String> largeList;

    public UserMaster__c um {get; set;}
    
    public Date createDate {get;set;}

    //コンストラクタ
    public C_Datetest2() {
        um = new UserMaster__c();

        chkin = new Obj_DateTest__c();
        largeList = new List<String>();
        //常に出ている
        createLargeList();
    }
    
    //確認ボタン
    public void check() {
    
        // 1行だけ出るメッセージ
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, '1行だけ出るメッセージ'));
        
        // 2行出るメッセージ
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, '2行出るメッセージ1'));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, '2行出るメッセージ2'));
        
    
        if(chkin.RegDate__c == Date.Today()){
            System.debug('一致');
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, '一致'));
        }else{
            System.debug('違います');
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, '違います'));
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'chkin.RegDate__c : ' + String.valueOf(chkin.RegDate__c)));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Date.Today() : ' + String.valueOf(Date.Today())));
    
    }
    
    private void createLargeList(){
        for(Integer i = 0; i<2000; i++){
            largeList.add(String.valueOf(i));
        }
    }
    
    public List<String> getLargeList(){
        return this.largeList;
    }
    
    public void setLargeList(String param){
        this.largeList.add(param);
    }
    
    //オブジェクト名と項目名で選択リスト情報を返す
    public static List<String> getListInfo(String objName,String colName){
         
        //戻り値用
        List<String> s = new List<String>();
         
        try{
            //オブジェクト情報取得
            Schema.DescribeSObjectResult o = Schema.getGlobalDescribe().get(objName).getDescribe(); 
             
            //項目取得
            Schema.DescribeFieldResult c = o.fields.getMap().get(colName).getDescribe();
             
            //選択リスト取得
            List<Schema.PicklistEntry> pList = c.getPicklistValues();
            for(Schema.PicklistEntry p : pList){
                s.add(p.label);
            }
        }catch(Exception e){
            //特に何もしない
        }
         
        return s;
    }

    //デバイス判定、リダイレクト処理
    public PageReference redirect() {
        String userAgent = ApexPages.currentPage().getHeaders().get('USER-AGENT');
        if(userAgent.contains('Android')) {
            PageReference pr = Page.MobilePageTestAndroid;
            pr.setRedirect(true);
            return pr;
        } else if(userAgent.contains('iPhone')) {
            PageReference pr = Page.MobilePageTestiPhone;
            pr.setRedirect(true);
            return pr;
        }
        Return null;
    }

}