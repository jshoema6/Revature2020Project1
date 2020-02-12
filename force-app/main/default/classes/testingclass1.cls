@istest
public class testingclass1 {
    
    static testmethod void testit1(){
        
        test.startTest();
        
        account acc = new account();
        acc.name = 'testdata';
        acc.AnnualRevenue = 10000;
        acc.Rating = 'Hot';
        insert acc;
        acc.Industry = 'Chemicals';
        update acc;
        
        account acc1 = new account();
        acc1.name = 'Reveture';
        insert acc1;
        delete acc1;
        
        account acc2 = new account();
        acc.AnnualRevenue = null;
        insert acc2;
        

        
        test.stopTest();
        
    }

}