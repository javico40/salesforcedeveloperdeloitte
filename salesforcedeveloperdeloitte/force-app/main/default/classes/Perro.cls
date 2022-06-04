public class Perro extends Animal implements PurchaseOrder, MiInterfaz2 {
    //Variables y propiedades
    private String color;
    
    //Constructor
    public Perro(){
        this.color = 'Verde';
    }

    //Metodo
    public static void comerMas(){
        System.debug('Comiendo');
    }
    
    public String comer(String msj){
        System.debug(msj);
        this.respirar(msj);
        this.color = 'Azul';
        return msj;
     }
    
    void caminar(){
        
    }
    
    void respirar(String msj){
        
    }
    
    public Double discount(){
        Double test = 0.0;
        return test;
    }
}