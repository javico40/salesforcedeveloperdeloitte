trigger accountInsert on Account (before insert) {
    
    Account acc;
    
    for(Account a: Trigger.New){
        acc = a;
    }
    
    List<Account> lst = [SELECT id, Name FROM Account WHERE name = :acc.Name LIMIT 1];
    
    if(lst.size() > 0){
        acc.Name.addError('La cuenta que intenta crear ya existe');
    }

}