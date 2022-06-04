@isTest
public class InventarioViewControllerTest {
    
    @isTest
    static void buscarTest() {
        
        Date oppDate = Date.newInstance(2022, 4, 1);
        
        Opportunity opp = new Opportunity();
        opp.Name = 'My Opp';
        opp.StageName = 'Qualification';
        opp.CloseDate = oppDate;
        insert opp;
        
        Quote qt = new Quote();
        qt.Name = 'Test';
        qt.OpportunityId = opp.Id;
        insert qt;
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'PANTALON';
        inv.CodigoProd__c = 'PROD001';
        inv.Cantidad_dis__c = 1;
        inv.Cantidad_apart__c = 1;
        insert inv;
        
        List<Inventario__c> lstProd = new List<Inventario__c>(); 
        
        PageReference pageRef = Page.VisualInventario;
        Test.setCurrentPage(pageRef);
        
        Apexpages.StandardController sc = new Apexpages.StandardController(qt);
        InventarioViewController controller = new InventarioViewController(sc);
        
        controller.codigo = inv.CodigoProd__c;
        
        Test.startTest();
        controller.buscar();
		Test.stopTest();
        
        lstProd = controller.ListInv;
        
        System.assertEquals(1, lstProd.size());
    }
    
    @isTest
    static void limpiarTest() {
        
        Date oppDate = Date.newInstance(2022, 4, 1);
        
        Opportunity opp = new Opportunity();
        opp.Name = 'My Opp';
        opp.StageName = 'Qualification';
        opp.CloseDate = oppDate;
        insert opp;
        
        Quote qt = new Quote();
        qt.Name = 'Test';
        qt.OpportunityId = opp.Id;
        insert qt;
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'PANTALON';
        inv.CodigoProd__c = 'PROD001';
        inv.Cantidad_dis__c = 1;
        inv.Cantidad_apart__c = 1;
        insert inv;
        
        List<Inventario__c> lstProd = new List<Inventario__c>(); 
        
        PageReference pageRef = Page.VisualInventario;
        Test.setCurrentPage(pageRef);
        
        Apexpages.StandardController sc = new Apexpages.StandardController(qt);
        InventarioViewController controller = new InventarioViewController(sc);
        
        controller.codigo = inv.CodigoProd__c;
        
        Test.startTest();
        controller.buscar();
        controller.limpiar();
		Test.stopTest();
        
        lstProd = controller.ListInv;
        
        System.assertEquals(0, lstProd.size());
    }
}