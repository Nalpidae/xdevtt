public with sharing class C_CheckIn {
    
    public Obj_CheckIn__c checkin {get;set;}
    
    public C_CheckIn() {
        
    }
    
    /**
     * ページ表示時の初期化処理
     **/
    public PageReference init() {
        try {
            checkin = new Obj_CheckIn__c();
            //リクエストパラメータで渡された緯度、経度をチェックイン情報の緯度、経度の初期値に設定
            //checkin.Location__Latitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('latitude'));
            //checkin.Location__Longitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('longitude'));
            checkin.RegDate__c = Date.Today();
        }
        catch (Exception e) {
            System.debug(e);
        }
        return null;
    }
    
    public PageReference save() {
        insert checkin;
        return null;
    }
    
    public PageReference cancel() {
        return null;
    }
    
}