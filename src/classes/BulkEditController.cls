/**
  * 一括編集ページ用カスタムコントローラ(仮)
  */
 public with sharing class BulkEditController {

    /**
     * コンストラクタ
     */
    public BulkEditController() {
        
    }

    /**
     * SOQL生成
     * @param objType 対象オブジェクト（SObjectType）
     * @return 標準項目とすべてのカスタム項目をSELECTしたSOQL文
     */
    public String getSelectAllQuery(Schema.SObjectType objType) {
        String wfnms = 'SELECT '
            + 'Id,'
            + 'Name,'
            + 'CreatedDate,'
            + 'CreatedById,'
            + 'LastModifiedDate,'
            + 'LastModifiedById,'
            + 'SystemModstamp,'
            + getCustomFieldNames(objType)
            + ' FROM '
            + objType.getDescribe().getName();
        return wfnms;
    }

    /**
     * カスタム項目名をカンマ区切りで返します
     * @param objType 対象オブジェクト（SObjectType）
     * @return カスタム項目名のカンマ区切り
     */
    public String getCustomFieldNames(Schema.SObjectType objType) {
        String s = '';
        String separator = '';
        Map<String, Schema.SObjectField> fieldMap = objType.getDescribe().fields.getMap();
        for (String fieldName : fieldMap.keySet()) {
            if (fieldName.endsWith('__c')) {
                s += separator + fieldName;
                separator = ',';
            }
        }
        return s;
    }    

 }