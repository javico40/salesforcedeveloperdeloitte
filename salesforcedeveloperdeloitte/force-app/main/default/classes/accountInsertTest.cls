@isTest
public class accountInsertTest {

    @isTest
    static void testInsert(){
        
        String miCuenta = 'Bedu';
        
        Account acc = new Account();
        acc.Name = miCuenta;
        acc.AccountNumber = '12345';
        insert acc;
        
        Account acc2 = new Account();
        acc2.Name = 'Nueva Cuenta';
        acc2.AccountNumber = '12345';
        
        Test.startTest();
        Database.SaveResult result = Database.insert(acc2, true);
        Test.stopTest();
        
        //System.assert(result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        //System.assertEquals('Cannot save account',result.getErrors()[0].getMessage());
    }
    
}