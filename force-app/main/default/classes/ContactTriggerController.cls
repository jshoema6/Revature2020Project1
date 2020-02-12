public class ContactTriggerController {
    
    
    public static void handlecontacttrigger (map<id,contact> triggeroldmap, list<contact> triggernew, list<contact> triggerold) {
        
        
        aggregateresult[] groupedlist = [select count(id), accountid from contact group by accountid having count(id) > 3];
        system.debug(groupedlist);
        
        if(trigger.isinsert && trigger.isbefore){
            
            for (contact c: triggernew){    
                for (aggregateresult a: groupedlist){
                    if(a.get('AccountId') == c.accountid){
                        c.adderror('More than 3 Contacts for an Account.');
                    }
                }
            }
        }
    }
}