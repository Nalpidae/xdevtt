public with sharing class JqueryDatePicker {
    public Date fromDate {get;set;}
    public Date toDate {get;set;}
    public JqueryDatePicker() {

    }
    public PageReference showDates() {
        System.debug('######### fromDate'+fromDate);
        System.debug('######### toDate'+toDate);
        return null;
    }

}