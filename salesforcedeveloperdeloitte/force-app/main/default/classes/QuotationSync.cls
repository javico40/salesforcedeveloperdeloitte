public interface QuotationSync {
    
    boolean confirmProductExistByCode(String codigoProducto);
	
    double searchProductByCode(String codigoProducto);
}