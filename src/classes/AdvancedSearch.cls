public with sharing class AdvancedSearch{
    public String Sf{get;set;}
    public String Selectedobject { get; set; }    
    public List<List<String>> sobjList { get; set; }
    public List<List<String>> cobjList { get; set; }
    public List<SObjectField> objfieldlist { get; set; }

    public AdvancedSearch(){
        createLinks();
    }

    public List<SelectOption> getSelectedobjnames(){
        //sobjList = new List<List<String>>();
        List<Schema.SObjectType> obj = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select Object--','--Select Object--'));
        for(Schema.SObjectType st : obj){
            if(Selectedobject == null || Selectedobject=='' ){       
                Selectedobject = st.getDescribe().getName();
            }
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getName()));
            options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getLabel() + '[' + st.getDescribe().getKeyPrefix() + ']'));

            //if(st.getDescribe().getKeyPrefix() != null){
            //    List<String> tmp = new List<String>();
            //    tmp.add(st.getDescribe().getLabel());
            //    tmp.add(st.getDescribe().getKeyPrefix());
            //    sobjList.add(tmp);
            //}
        }
        //System.debug(sobjList);
        return options;
    }
   
    public List<SelectOption> getSelectedobjFields(){
        //SObjectType objTyp = Schema.getGlobalDescribe().get(Selectedobject);
        //DescribeSObjectResult objDef = objTyp.getDescribe();
        //Map<String, SObjectField> fields = objDef.fields.getMap();

        //Set<String> fieldSet = fields.keySet();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--Select Object--','--Select Object--'));

        //for(String s:fieldSet){  
        //    SObjectField Sobjfields = fields.get(s);
        //    DescribeFieldResult selectedField = Sobjfields.getDescribe();                 
        //    //options.add(new SelectOption(selectedField.getName(),selectedField.getName()));
        //    options.add(new SelectOption(selectedField.getName(),selectedField.getLabel()));
        //}

        List<Schema.SObjectType> obj = Schema.getGlobalDescribe().Values();
        //List<SelectOption> options = new List<SelectOption>();
        //options.add(new SelectOption('--Select Object--','--Select Object--'));
        for(Schema.SObjectType st : obj){
            if(Selectedobject == null || Selectedobject=='' ){       
                Selectedobject = st.getDescribe().getName();
            }
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getName()));
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getLabel() + '[' + st.getDescribe().getKeyPrefix() + ']'));

            if(st.getDescribe().getKeyPrefix() != null && st.getDescribe().isCustom()){
                //List<String> tmp = new List<String>();
                //tmp.add(st.getDescribe().getLabel());
                //tmp.add(st.getDescribe().getKeyPrefix());
                options.add(new SelectOption(st.getDescribe().getLabel(),st.getDescribe().getLabel()));
                //if(st.getDescribe().isCustom()){
                //    cobjList.add(tmp);
                //} else {
                //    sobjList.add(tmp);
                //}
            }
        }

        return options;
    }

    public void createLinks(){
        sobjList = new List<List<String>>();
        cobjList = new List<List<String>>();
        List<Schema.SObjectType> obj = Schema.getGlobalDescribe().Values();
        //List<SelectOption> options = new List<SelectOption>();
        //options.add(new SelectOption('--Select Object--','--Select Object--'));
        for(Schema.SObjectType st : obj){
            if(Selectedobject == null || Selectedobject=='' ){       
                Selectedobject = st.getDescribe().getName();
            }
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getName()));
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getLabel() + '[' + st.getDescribe().getKeyPrefix() + ']'));

            if(st.getDescribe().getKeyPrefix() != null){
                List<String> tmp = new List<String>();
                tmp.add(st.getDescribe().getLabel());
                tmp.add(st.getDescribe().getKeyPrefix());
                if(st.getDescribe().isCustom()){
                    cobjList.add(tmp);
                } else {
                    sobjList.add(tmp);
                }
            }
        }
        System.debug(sobjList);
        System.debug(cobjList);
        //return options;
    }

    public void createFields(){
        //aaa
    	System.debug('■ Selectedobject : ' + Selectedobject);
    	//Schema.SObjectType objTyp = Schema.getGlobalDescribe().get(Selectedobject);
    	//System.debug('■ objTyp : ' + objTyp);
        //DescribeSObjectResult objDef = objTyp.getDescribe();
        //Map<String, SObjectField> fields = objDef.fields.getMap();
        Map <String, Schema.SObjectField> fields = Schema.getGlobalDescribe().get(Selectedobject).getDescribe().fields.getMap();

        //objfieldlist = fields.values();

        for(SObjectField f : fields.values()){
        	if(f.getDescribe().isCreateable()){
        		objfieldlist.add(f);
        	}
        }

        /*
        sobjList = new List<List<String>>();
        cobjList = new List<List<String>>();
        List<Schema.SObjectType> obj = Schema.getGlobalDescribe().Values();
        //List<SelectOption> options = new List<SelectOption>();
        //options.add(new SelectOption('--Select Object--','--Select Object--'));
        for(Schema.SObjectType st : obj){
            if(Selectedobject == null || Selectedobject=='' ){       
                Selectedobject = st.getDescribe().getName();
            }
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getName()));
            //options.add(new SelectOption(st.getDescribe().getName(),st.getDescribe().getLabel() + '[' + st.getDescribe().getKeyPrefix() + ']'));

            if(st.getDescribe().getKeyPrefix() != null){
                List<String> tmp = new List<String>();
                tmp.add(st.getDescribe().getLabel());
                tmp.add(st.getDescribe().getKeyPrefix());
                if(st.getDescribe().isCustom()){
                    cobjList.add(tmp);
                } else {
                    sobjList.add(tmp);
                }
            }
        }
        System.debug(sobjList);
        System.debug(cobjList);
        //return options;
        */
    }

}