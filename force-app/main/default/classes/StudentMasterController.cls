public class StudentMasterController {
    
    public studentmaster__c student {get;set;}
    public pagereference pgref {get;set;}
    
    public StudentMasterController(){
        
        student = new studentmaster__c();
    }
    
    public pagereference save(){
         try{
            
            insert student;
            pgref = new pagereference('/' + studentmaster__c.id);
            pgref.setredirect(true);
            return pgref;
            
        }catch(exception e){
            system.debug(e.getMessage());
        }
        
        return pgref;
    }
    
    public void cancel(){}
}