@isTest
private class TestRestrictContactByName
{
	@isTest
	static void itShould()
	{
		Contact c = new Contact();
		c.FirstName = 'test';
		c.Lastname = 'INVALIDNAME';

		Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
		System.assert(!result.isSuccess());	
		}
}