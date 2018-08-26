public class AccountTriggerImplimentation {
   public void beforeInsert(List<Account> acc){
		For(Account a:acc){
            if(a.Name == 'Test Account'){
                a.Name.addError('Test Account cannot be added.');
            }
            if(a.PAN__c == 'Dummy'){
                a.PAN__c.addError('Enter valied Pan Number.');
            }
        }
    }
    
public void afterUpdate(List<Account> acc){
    try{
        List<Contact> c = new List<Contact>();
        for(Account a:acc){
            c.add(new Contact(
                FirstName=a.Name,
                LastName='Name',
                Accountid = a.id
            ));
        }
        insert(c);
    }catch(Exception e){
        System.debug('Error while creating Contact record from Account trigger: ' + e.getMessage());
    }
}

    public void afterInsert(List<Account> acc){
		try{
            for(Account a:acc){
                List<Contact> c = new List<Contact>();
                    c.add(new Contact(
                        FirstName = a.Name,
                        LastName = 'Last Name',
                        Accountid = a.id
                ));
                insert(c);
            }
        }catch(Exception e){
            System.debug('Error while creating Contact record from Account trigger: ' + e.getMessage());
        }
    }
    
    public void beforeUpdate(List<Account> acc, Map<id,Account> oldMap){
		try{
            for(Account a:acc){
                if(a.Name <> oldMap.get(a.id).Name){
                    a.Name.addError('Name can not be chaged');
                }
            }
        }
        catch(Exception e){
            System.debug('Exception while verifying name field: ' + e.getMessage());
        }
    }
    
    
}