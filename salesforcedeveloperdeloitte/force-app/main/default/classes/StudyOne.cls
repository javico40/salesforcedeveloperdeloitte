/*
*Public class to study sObject access programatically
*/
public class StudyOne {
    
    public void describeInventario(){
        //Get the token by member variable
        Schema.sObjectType opp = Inventario__c.sObjectType;
        //Get the token by sObject method
        Inventario__c inv = new Inventario__c();
        Schema.sObjectType invT = inv.getSObjectType();
        //Get sObjectField
        Schema.sObjectField oppDesc = Inventario__c.Name;
        Schema.DescribeFieldResult fieldResult = Inventario__c.Name.getDescribe();
        Schema.SObjectField field = fieldResult.getSObjectField();
        
    }
    
    public void pruebaUno(){
        
        Schema.SObjectField test = Opportunity.Name;
        
    }
    
    public static void pruebaDos(){
        String[] objectTypes = new String[]{'Account', 'Opportunity'};
        Schema.DescribeSObjectResult[] objectResult = Schema.describeSObjects(objectTypes); 
        for(Schema.DescribeSObjectResult item:objectResult){
        	System.debug(item);    
        }
    }
    
    public static void pruebaTres(){
 		
        Map<String, Schema.SObjectType> allObjects = Schema.getGlobalDescribe();
        System.debug(allObjects);
        
        for(String item:allObjects.keyset()){
            Schema.SObjectType sob = allObjects.get(item);
            System.debug(sob);
        }
        
    }

}