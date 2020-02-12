public with sharing class ContactExtension {
    
    public contact cont {get;set;}
    public apexpages.StandardController aps;
    public string x {get;set;}

    
    
    public contactextension(apexpages.StandardController std){
        //connect the record and the controllers
        this.aps = std;
        this.cont = (Contact)std.getRecord();
        this.x = 'Now extension controller is working.';
        
    }

}