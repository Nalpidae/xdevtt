public with sharing class RSS_ListCon {

    //価格と数量
    Decimal s_price = 0;
    Decimal s_quantity = 0;
    String name = '';

    //DTOクラス
    public class RSS_DTO{
        public Boolean checked{get;set;}
        public RssSearch__c rss{get;set;}

        public RSS_DTO(){
            checked = false;
            rss = new RssSearch__c();
        }
    }

    /** 検索条件が格納されます */
    public RssSearch__c rss{get;set;}

    /** DTOクラスのリスト */
    public List<RSS_DTO> rsslist{get;set;}

    //初期処理
    public void init(){
        rss = new RssSearch__c();
    }

    //一括更新処理処理 
    public PageReference bulkUpdate() {

        List<RssSearch__c> updatersslist = new List<RssSearch__c>();
        for(RSS_DTO dto : rsslist){
            if(dto.checked){
                updatersslist.add(dto.rss);
            }
        }

        if(updatersslist.size() > 0){
            update updatersslist;
        }

        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 
        updatersslist.size() + '件のデータの処理が完了しました。'));
        return null;
    }

    public PageReference clear(){
        rss = new RssSearch__c();
        rsslist = new List<RSS_DTO>();
        return null;
    }

    public PageReference cancel(){
        search();
        return null;
    }

    public PageReference search() {
        List<RssSearch__c> searchResult = new List<RssSearch__c>();
        rsslist = new List<RSS_DTO>();

        //Field名を取得
        Map<String,Schema.SObjectField> fieldMap = RssSearch__c.sObjectType.getDescribe().fields.getMap();
        List<Schema.SObjectField> fieldList = fieldMap.values();
        String selectFields ='';
        for(Integer i =0; i< fieldList.size();i++){
            Schema.SObjectField field = fieldList.get(i);
            if(i==0){
                selectFields += field.getDescribe().getName() + ' ';
            }else{
                selectFields += ', ' + field.getDescribe().getName(); 
            }
        }

        //検索SOQLの作成
        String query='SELECT ' + selectFields + ' FROM RssSearch__c';
        String joinString = ' WHERE ';

        if (rss.name__c != null && rss.name__c != ''){
            name = rss.name__c;
            query += joinString + ' name LIKE \'' + '%' + rss.name__c + '%' + '\'';
            joinString = ' AND ';
        }

        if (rss.S_Price__c != null){
            s_price = rss.S_Price__c;
            query += joinString + ' S_Price__c = ' + s_price;
            joinString = ' AND ';
        }

        if (rss.S_Quantity__c != null){
            s_quantity = rss.S_Quantity__c;
            query += joinString + ' S_Quantity__c = ' + s_quantity;
            joinString = ' AND ';
        }

        query += ' ORDER BY S_Price__c,S_Quantity__c,name NULLS LAST ';

        //Query Limit
        query += ' LIMIT 100';
        searchResult = database.query(query);

        if(searchResult.size() >= 100){
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 
        '検索条件で得られる結果が100件を超えています。100件目以降は表示されません。'));
        }

        //DTOクラスへ登録
        for(RssSearch__c rss : searchResult){
            RSS_DTO temp = new RSS_DTO();
            temp.rss = rss;
            rsslist.add(temp);
        } 

        return null;
    }
}