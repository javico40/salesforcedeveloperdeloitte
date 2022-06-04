@isTest
public class QuotationHelperTest {
    
    @isTest
    public static void pruebaUno(){
        
        Inventario__c inv = new Inventario__c();
        inv.name = 'Test1';
        inv.Cantidad_dis__c = 1;
        inv.Cantidad_apart__c = 1;
        inv.CodigoProd__c = 'PROD001';
        insert inv;
        
        Test.startTest();
         QuotationHelper qt = new QuotationHelper();
         qt.confirmProductExistByCode('PROD001');
        Test.stopTest();
        
    }

}