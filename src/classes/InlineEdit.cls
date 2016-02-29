public class InlineEdit {
     
    private ApexPages.StandardController standardController;
     
    public List<Contact> contacts { get; set; }
     
    public static String CONTACT_COLUMN_WIDTH { get {return String.valueOf(100 / 5) + '%';} }
     
    private static final Integer RELATED_LIST_SIZE = 10;
     
    public InlineEdit(ApexPages.StandardController standardController) {
        this.standardController = standardController;
        Id recordId = standardController.getRecord().Id;
        if (recordId == null) {
            contacts = new List<Contact>();
        } else {
            contacts = (Contact[])Database.query(
                createAllFieldsSOQL(Contact.SObjectType, SObjectType.Contact.fields.getMap()) +
                ' WHERE AccountId=\'' + recordId + '\' FOR UPDATE'
            );
        }
        for (Integer i = 0, size = RELATED_LIST_SIZE - contacts.size(); i < size; i++) {
            contacts.add(new Contact());
        }
    }
     
    public PageReference save() {
        PageReference ret = standardController.save();
        SObject parent = standardController.getRecord();
        for (Integer i = contacts.size() - 1; i >= 0; i--) {
            Contact c = contacts[i];
            if (c.LastName == null) {
                contacts.remove(i);
            } else {
                c.AccountId = parent.Id;
            }
        }
        upsert contacts;
        PageReference retPage = new PageReference(Page.InlineEdit.getUrl() + '?id=' + parent.Id);
        retPage.setRedirect(true);
        return retPage;
    }
     
    public static String createAllFieldsSOQL(SObjectType sObjectType, Map<String, SObjectField> fields) {
        String query = 'SELECT ';
        for (String fieldName : fields.keySet()) {
            query += (query != 'SELECT ' ? ',' : '') + fieldName;
        }
        return query + ' FROM ' + sObjectType.getDescribe().getName();
    }
     
     

     
}