public with sharing class caselist {
    
    public list<case> cslist {get;set;}
    public apexpages.StandardSetController stdc;
    
    public caselist(){
     
        cslist = new list<case>();
        cslist = [select id, casenumber, description from case];
        stdc = new apexpages.StandardSetController(database.getQueryLocator('select id, casenumber, description from case'));
        stdc.setPageSize(3);
        cslist = stdc.getRecords();
        
        
        
    }
    
    public void next(){
        
        if(stdc.getHasNext() == true){
            stdc.next();
        }
        cslist = stdc.getRecords();
    }
    
        public void previous(){
        
        if(stdc.getHasPrevious() == true){
            stdc.previous();	
        }
        cslist = stdc.getRecords();
    }

}