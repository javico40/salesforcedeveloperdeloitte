public class MyController {
    
    Account account;
    
    public String getName(){
        return 'MiApp'; 
    }
    
    public Account getAccount(){
        if(account == null)
            account = [SELECT id, name FROM Account WHERE id = :ApexPages.currentPage().getParameters().get('id')];
        return account;
    }
    
    public PageReference save(){
        update account;
        return null;
    }

}