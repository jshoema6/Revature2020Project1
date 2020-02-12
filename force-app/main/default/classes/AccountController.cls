public class AccountController {
    
    public Account acc {get;set;}
    public pagereference pg{get;set;}
    public list<account> acclist {get;set;}
    public boolean cb {get;set;}
    
    public accountcontroller(){
        acc = new account();
      	cb = false;
    }
    
    public void showlist(){
        
        acclist = new list<account>([select id, name, rating, annualrevenue from account where createddate = today]);
    }
    
    public void save(){
        try{
            
            insert acc;
            
        }catch(exception e){
            system.debug(e.getMessage());
        }
    }
    public void cancel(){
        
    }
}