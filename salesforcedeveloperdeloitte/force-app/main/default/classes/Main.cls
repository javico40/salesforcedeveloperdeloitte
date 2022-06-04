public class Main {
    
    public Main(){
		
		String prueba = '';
        
        Perro paco = new Perro();
        prueba = paco.comer('Mensaje');
        Perro.comerMas();
        
        System.debug('Mensaje retornado: '+prueba);
    }

}