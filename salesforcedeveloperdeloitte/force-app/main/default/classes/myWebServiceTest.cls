@isTest
public class myWebServiceTest {
@isTest
    static void testMyWS() {
        Account c = new Account();
        
		System.debug(UserInfo.getOrganizationId()+''+UserInfo.getSessionId().SubString(15));
        test.startTest();  
         c.Id = myWebService.makeAccount('Prueba','1','1','www.me.com');
         
         system.debug(c.Id);
         test.startTest();
    }
}