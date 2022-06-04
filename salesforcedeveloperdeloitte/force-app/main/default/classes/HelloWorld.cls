public class HelloWorld {
    
    String test;
    
    void hello() {
        
        system.debug('Hola mundo');
        String str;
        Integer i = 0;
        boolean check = true;
        List<String> strList;
        Set<String> s;
        Map<ID,String> m;
        
         this.test = 'Adios';
        
        if(i > 0){
            this.test = 'es mayor';
        } else {
            this.test = 'es cero o menor';
        }
        
        switch on i {
   			when 2 {
       			System.debug('when block 2');
   			}
   			when -3 {
      			 System.debug('when block -3');
   			}
   			when else {
      			 System.debug('default');
   			}
		}
        
        integer testWhile = 0;
        
        while(testWhile < 5){
            System.debug('Prueba '+testWhile);
            testWhile++;
        }
        
        testWhile = 5;
        
        do{
           System.debug('Prueba '+testWhile);
           testWhile++;
        }while(testWhile < 5);

        
        Account acc = new Account();
        Account acc2 = new Account();
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Test';
        inv.Cantidad_apart__c = 3;
        insert inv;
        
        List<sObject> lst = new List<sObject>();
        lst.add(inv);
        lst.add(acc);
        
        String nameInv = 'Test';
        Inventario__c inv2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
        sObject inv3 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
  		List<sObject> lst2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV];
        
        //Test
        for(integer k = 0; k <= lst2.size(); k++){
            System.debug('Result:'+lst2);
            Inventario__c inv4 = (Inventario__c)lst2[k];
            System.debug('Result:'+inv4.Name);
        }
        
        /*
        for(Account test:listAccount){
            
        }
        */
        
    }
    
    public void Hello2(){
        this.test = 'Hola';
    }
    
    public void HelloSOSL(){
        
      List<List<sObject>> result = [FIND 'United'
      IN ALL FIELDS
      RETURNING
              Account(Id, Name, Type
              WHERE Rating = 'Hot'
              ORDER BY CreatedDate DESC),
              Lead(Id, Name, Company
              ORDER BY CreatedDate),
              Contact(Id, Name, Account.Name
              ORDER BY Account.Name, LastName),
              Opportunity(Id, Name, Account.Name
                          ORDER BY CreatedDate)];
        
    }
    
    public void DML(){
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Test 4';
        inv.Cantidad_apart__c = 3;
        inv.CodigoProd__c = 'PROD004';
        //insert inv;
        
        Inventario__c inv2 = new Inventario__c();
        inv2.Name = 'Test 5';
        inv2.Cantidad_apart__c = 3;
        inv2.CodigoProd__c = 'PROD005';
        //insert inv2;
        
        List<Inventario__c> lst = new List<Inventario__c>();
        lst.add(inv);
        lst.add(inv2);
        
        insert lst;
        
        Inventario__c inv3 = [SELECT id, Name, CodigoProd__c FROM Inventario__c WHERE Id = 'a005f000007kK78AAE' LIMIT 1];
        inv3.Name = 'Otro Valor';
        update inv3;
        
        
        Inventario__c inv4 = [SELECT id, Name, CodigoProd__c FROM Inventario__c WHERE Id = 'a005f000007kK78AAE' LIMIT 1];
        delete inv4;
        
        //Inventario__c invDML = new Inventario__c(Name='Test',Cantidad_apart__c=3);
        //insert inv;
    }

}