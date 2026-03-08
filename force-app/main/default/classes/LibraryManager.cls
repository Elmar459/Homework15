
public with sharing class LibraryManager {
    public List<Account> updateDescription() {
        // Task 1. Create Records
  try {
            List<Account> accounts = new List<Account>{
                new Account(Name = 'Test Account 1'),
                new Account(Name = 'Test Account 2'),
                new Account(Name = 'Test Account 3')
            };
            
            insert accounts;
            
            List<Account> queriedAccounts = [SELECT Id, Description FROM Account WHERE Id IN :accounts];
            
            for (Account acc : queriedAccounts) {
                acc.Description = 'Cool Description';
            }
            
            update queriedAccounts;
            
        } catch (DmlException e) {
            System.debug('DML Error: ' + e.getMessage());
        } catch (Exception e) {
            System.debug('Unexpected Error: ' + e.getMessage());
        }
    }
}
