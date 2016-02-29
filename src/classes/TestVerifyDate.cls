@isTest
private class TestVerifyDate {
    @isTest static void testTestVerifyDate() {
        Date d = VerifyDate.CheckDates(Date.today(), Date.today().addDays(-50));
    }
    @isTest static void testTestVerifyDate2() {
        Date d = VerifyDate.CheckDates(Date.today(), Date.today().addDays(50));
    }
    @isTest static void testTestVerifyDate3() {
        Date d = VerifyDate.CheckDates(Date.today(), Date.today().addDays(5));
    }
}