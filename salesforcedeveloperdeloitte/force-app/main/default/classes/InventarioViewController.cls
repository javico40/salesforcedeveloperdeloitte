public class InventarioViewController {
    
    private final sObject parent;
    public String codigo {get;set;}
    public List<PricebookEntry> listInv {get;set;}

    
    
    public InventarioViewController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void buscar(){
        String query = 'SELECT id, Product2.Name, UnitPrice, Product2.ExternalId FROM PricebookEntry WHERE Product2.ExternalId = :codigo';
        listInv = Database.query(query);
    }
    
    public void limpiar(){
        listInv.clear();
    }

}