public class AccListController {
    
    public List<Account> accountList{get;set;}
    
    public AccListController(ApexPages.StandardSetController setCon){
        accountList = new List<Account>();
        Map<Id,sObject> accMap = new Map<Id,sObject>(setCon.getSelected());
        accountList = [SELECT ID, Name FROM Account WHERE ID IN :accMap.keyset()];
        System.debug('##setCon.getRecords'+setCon.getRecords());
    }

}