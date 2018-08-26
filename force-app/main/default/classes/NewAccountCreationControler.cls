public with sharing class NewAccountCreationControler {
    
    public string AccountName {get; set;}
    public string PanNumber {get;set;}
    public Account acc;
    public Pagereference pg;
    
    private List<Contact> cntin = new List<Contact>();
    public List<Contact> cnt { get; set; }
    
    public NewAccountCreationControler(){
		cntin.add(new Contact());
		cntin.add(new Contact());
		cntin.add(new Contact());
    }
    
    public Pagereference saveRecord(){
        acc = new Account(Name=AccountName, PAN__c=PanNumber);
        insert acc;

        for(Contact a: cnt){
            a.accountid = acc.id;
        }
        insert cnt;
        
        pg = new PageReference('/' + acc.id);
        pg.setRedirect(true);
        return pg;
    }
    
    public Pagereference cancleRecord(){
        Schema.DescribeSObjectResult result = Account.SObjectType.getDescribe();
        pg =  new PageReference('/'+result.getKeyPrefix());
        pg.setRedirect(true);
        return pg;
    }
}