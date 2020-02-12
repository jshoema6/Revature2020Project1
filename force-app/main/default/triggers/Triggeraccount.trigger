trigger Triggeraccount on Account (before insert, before update, before delete, after insert, after update) {
    
    if(Trigger.isbefore){
        
        accounttriggerhandler.handlebefore(trigger.oldmap, trigger.new, trigger.old);
        
    }
    
    if(trigger.isafter){
        accounttriggerhandler.afterhandler(trigger.oldmap, trigger.new, trigger.old);
    }
}
    
        
        /*

    //After is for creating additional records etc
    //You have access to the IDs for the created records
    
    if(trigger.isafter && trigger.isupdate){
        
        //close all related cases if Account active is switched to no
        list<case> caselist = new list<case>();
        caselist = [select id, accountid from case where accountid != null];
        list<case> closecaselist = new list<case>();
        
        for(account acc: trigger.new){
            for(case c: caselist){
                if(acc.id == c.accountid){
                    closecaselist.add(c);
                }
            }
        }
        
        system.debug(closecaselist);
        
        for(case currentcase: closecaselist){
            currentcase.status = 'Closed';
        }
        
        update closecaselist;
    }
    
    
    
    
    /*
    if(trigger.isinsert){
        contact cont;
        list<contact> contlist = new list<contact>();
        
        for(account acc: trigger.new){
            cont = new contact(accountid = acc.Id, lastname = acc.Name + 'from Trigger');
            contlist.add(cont);
        }
        insert contlist;
    }
*/