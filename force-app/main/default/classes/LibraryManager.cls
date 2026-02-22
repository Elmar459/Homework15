
public with sharing class LibraryManager {
    public LibraryManager() {
        // Task 1. Create Records
        List<Account> accountList = new List<Account>();
        accountList.add(new Account(Name = 'ABB Ltd'));
        accountList.add(new Account(Name = 'Socar Inc'));
        accountList.add(new Account(Name = 'Azercell Telecom'));
      
        insert accountList;

        // Task 2. Query and Update
        List<Account> accountList = [Select Name from Account];
        for (Account acc: accountList) {
            acc.Description = 'Potential customer';
        }
        update accountList;
        
        // Task 3. Error Handling
        try{
            DmlException ex = new DmlException('This is a custom error message');
            throw ex;
        }
        catch(DmlException ex) {
            System.debug('Error: ' + ex.getMessage());
        }
    }
}
