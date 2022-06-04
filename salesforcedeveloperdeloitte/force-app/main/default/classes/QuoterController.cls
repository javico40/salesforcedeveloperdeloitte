public class QuoterController {
    
    private final sObject parent;
    public String codigo {get;set;}
    public List<PricebookEntry> listInv {get;set;}
    
    public QuoterController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void buscar(){
        
      listInv = [Select id, Pricebook2Id, Product2.Name, UnitPrice, Product2.ExternalId, disponible__c, 	reserva__c from PricebookEntry Where Product2.ExternalId = :codigo LIMIT 1];
      
      //Buscar disponible
      QuotationHelper helper = new QuotationHelper();
      Double disp = 0;
      disp = helper.searchProductByCode(codigo);
        
      for(PricebookEntry item:listInv){
        item.disponible__c = disp;    
      }
        
      update listInv;   
    
    }
    
    public void guardar(){
        
        Quote qt = (Quote) parent;
        List<QuoteLineItem> listToInsert = new List<QuoteLineItem>();
        Id pricebookId;
        
        for(PricebookEntry item:listInv){
            //Assign same price entry
            pricebookId = item.Pricebook2Id;
            //New Line Item
            QuoteLineItem cotItem = new QuoteLineItem();
        	cotItem.Product2Id = item.Product2.Id;
            cotItem.Quantity = item.reserva__c;
            cotItem.QuoteId = qt.Id;
            cotItem.UnitPrice = item.UnitPrice;
            cotItem.PricebookEntryId = item.id;
            listToInsert.add(cotItem);
        }
		
        qt.Pricebook2Id = pricebookId;
		update qt;  
        insert listToInsert;
        codigo = '';
        listInv.clear();
        
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Registro guardado'));
    	
    }
        
    public void cancelar(){
       listInv.clear();
    }
        
    public void atras(){
       codigo = '';
       listInv.clear(); 
    }

}