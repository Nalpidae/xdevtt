public with sharing class SaveMarkerPosition{
    
    /* 保存対象取引先ID */
    public Account Acc{get;set;}
    
    /* 保存データ */
    public String lat{get;set;}
    public String lon{get;set;}
    
    /*
    *  コンストラクタ
    */
    public SaveMarkerPosition(){
        Acc = [SELECT Id, Name, tt8__geo__latitude__s, tt8__geo__longitude__s , CreatedDate FROM Account ORDER BY CreatedDate DESC LIMIT 1]; 
        lat = String.valueOf(Acc.tt8__geo__latitude__s);
        lon = String.valueOf(Acc.tt8__geo__longitude__s);
    }
    
    /*
    * 保存処理
    */
    public void SaveData(){
        system.debug(lat);
        system.debug(lon);
        Acc.geo__latitude__s = Double.ValueOf(lat);
        Acc.geo__longitude__s = Double.ValueOf(lon);
        //Acc.geo__latitude__s = null;
        //Acc.geo__longitude__s = null;
        update Acc;
    }

    /*
    * マーカー削除処理
    */
    public void DelMarker(){
    system.debug(lat);
    system.debug(lon);
        Acc.geo__latitude__s = null;
        Acc.geo__longitude__s = null;
        update Acc;
    }

}