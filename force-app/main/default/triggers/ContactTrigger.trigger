trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete) {
    
    if(trigger.isinsert && trigger.isbefore){
        
    contacttriggercontroller.handlecontacttrigger(trigger.oldmap, trigger.new, trigger.old);
    }
}