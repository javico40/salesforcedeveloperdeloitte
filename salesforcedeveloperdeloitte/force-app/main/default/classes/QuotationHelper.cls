public class QuotationHelper implements QuotationSync {
    
    public void initialConfig(){
        
        Account acc1 = new Account();
        acc1.Name = 'Compumundo';
        insert acc1;
        
        Account acc2 = new Account();
        acc2.Name = 'Compuworld';
        insert acc2;
        
        /*Codigo para ejecutar el metodo
        QuotationHelper qth = new QuotationHelper();
        gth.initialConfig();*/
        
    }
    
    public List<Inventario__c> productsInInventory(){ 
        List<Inventario__c> lstInv = [SELECT Id, CodigoProd__c, Name, Cantidad_dis__c, Cantidad_apart__c FROM Inventario__c];      
        return lstInv;
    }
    
    public boolean confirmProductExistByCode(String codigoProducto){
        
        boolean exist = false;
        
        List<Product2> listProd = [SELECT ID FROM Product2 WHERE ExternalId = :codigoProducto LIMIT 1];

        if(listProd.size() > 0){
            exist = true;
        }
        
        /*Codigo para ejecutar el metodo
        QuotationHelper qth = new QuotationHelper();
        double result = gth.confirmProductExistByCode(codigoProducto);
		System.debug('Existe el producto:'+result);
        */
        
        return exist;
    }
	
    public Double searchProductByCode(String codigoProducto){
        
        double cantDis = 0;
        
        Inventario__c prodInv = [SELECT id, Cantidad_dis__c FROM Inventario__c WHERE CodigoProd__c = :codigoProducto LIMIT 1];
        cantDis = prodInv.Cantidad_dis__c;
        
        /*Codigo para ejecutar el metodo
        QuotationHelper qth = new QuotationHelper();
        double result = qth.searchProductByCode(codigoProducto);
		System.debug('Cantidad del producto en existencias:'+result);
        */
        
        return cantDis;
    }
    
    @InvocableMethod(label='StockAlert')
    public static void StockEmptyAlert(){
        
        List<Inventario__c> lstInv = new List<Inventario__c>();
        QuotationHelper qt = new QuotationHelper();
        
        lstInv = qt.productsInInventory();
        
        List<FeedItem> feed = new List<FeedItem>();
        
        for(Inventario__c inv:lstInv){
            if(inv.Cantidad_dis__c == 0){
                //Post to chatter
                FeedItem objPost = new FeedItem();
				objPost.ParentId = UserInfo.getUserId();
				objPost.Body = 'Producto sin Inventario';
				feed.add(objPost);
                
            }
        }
        
        insert feed;
    }
    
    public void updateReservedQuantiry(Id Product2Id, Double quantity){
        
     	Product2 prod = [SELECT id, Name, ExternalId from Product2 WHERE Id = :Product2Id];   
        boolean exist = confirmProductExistByCode(prod.ExternalId);
        
        //Si existe el producto
        if(exist){ 
           double disp = searchProductByCode(prod.ExternalId); 
            
            //Si hay disponibilidad
            if(disp > quantity){
                
                Inventario__c inv = [SELECT id, Name, Cantidad_dis__c, Cantidad_apart__c FROM Inventario__c WHERE CodigoProd__c = :prod.ExternalId];
                inv.Cantidad_apart__c = inv.Cantidad_apart__c + quantity;
                inv.Cantidad_dis__c = inv.Cantidad_dis__c - quantity;
                update inv;
            }
        }
        
    }
    
}