@istest
public class ContactTestingClass {
    
    static testmethod void testcontacttrigger(){
        
        test.startTest();
        
        list<contact> contlist = new list<contact>();
        
        contact con1 = new contact();
        con1.AccountId = '0016g000008TXHTAA4';
        contlist.add(con1);
        insert con1;
        
        contact con2 = new contact();
        con2.AccountId = '0016g000008TXHTAA4';
        contlist.add(con2);
        insert con2;

        contact con3 = new contact();
        con3.AccountId = '0016g000008TXHTAA4';
        contlist.add(con3);
        insert con3;
            
        contact con4 = new contact();
		con4.AccountId = '0016g000008TXHTAA4';
        contlist.add(con4);
        insert con4;
                
        test.stopTest();
        
    }

}