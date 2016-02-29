public with sharing class C_MapDisp {

	public Obj_CheckIn__c checkin {get;set;}
	
	public List<Obj_CheckIn__c> checkinlist {get;set;}

	public List<String> chkinNoList {get;set;}
	
	public C_MapDisp() {
		
	}
	
	/**
	 * ページ表示時の初期化処理
	 **/
	public PageReference init() {
		try {
			checkin = new Obj_CheckIn__c();
			//List<Obj_CheckIn__c> checkinlist = new List<Obj_CheckIn__c>();
			checkinlist = [select Id, Name, CheckinShaName__c, Address__c, LocationName__c, Location__Latitude__s, Location__Longitude__s 
						   from Obj_CheckIn__c];
			chkinNoList = new List<String>();
			for(Obj_CheckIn__c o : checkinlist) {
				String urlStr = '/apex/P_MapDisp/';
				urlStr += '?latitude=' + o.Location__Latitude__s + '&longitude=' + o.Location__Longitude__s;
				chkinNoList.add(urlStr);
			}
			if(System.currentPageReference().getParameters().get('latitude') != null &&
				System.currentPageReference().getParameters().get('longitude') != null) {
					checkin.Location__Latitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('latitude'));
					checkin.Location__Longitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('longitude'));
				} else if (checkinlist == null || checkinlist.size() == 0){
					checkin.Location__Latitude__s = 35.658611;
					checkin.Location__Longitude__s = 139.745556;
				} else {
					checkin.Location__Latitude__s = checkinlist.get(0).Location__Latitude__s;
					checkin.Location__Longitude__s = checkinlist.get(0).Location__Longitude__s;
				}
			//リクエストパラメータで渡された緯度、経度をチェックイン情報の緯度、経度の初期値に設定
			//checkin.Location__Latitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('latitude'));
			//checkin.Location__Longitude__s = Decimal.valueOf(System.currentPageReference().getParameters().get('longitude'));
			//checkin.Location__Latitude__s = 35.658611;
			//checkin.Location__Longitude__s = 139.745556;
			//checkin.Location__Latitude__s = checkinlist.get(0).Location__Latitude__s;
			//checkin.Location__Longitude__s = checkinlist.get(0).Location__Longitude__s;
		}
		catch (Exception e) {
			System.debug(e);
		}
		return null;
	}

	//チェックイン名クリック時
	public PageReference disp() {
		//Obj_CheckIn__c paramObj = System.currentPageReference().getParameters().get('loc');
		return null;
	}

}