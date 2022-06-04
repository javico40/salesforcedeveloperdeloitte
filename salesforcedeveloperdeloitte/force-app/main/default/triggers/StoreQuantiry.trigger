trigger StoreQuantiry on QuoteLineItem (after update) {
    
    QuoteLineItem qt = new QuoteLineItem();
    
    for(QuoteLineItem item:Trigger.New){
        qt = item;
    }
   
    System.debug('Cantidad en item '+qt.Quantity);
    
    QuotationHelper qot = new QuotationHelper();
    qot.updateReservedQuantiry(qt.Product2Id,qt.Quantity);
   
}