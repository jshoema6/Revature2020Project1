trigger StudentTrigger on Studentmaster__c (before insert, after insert, before update, after update, before delete) {
    
    if(trigger.isbefore){
        if(trigger.isupdate || trigger.isinsert){
            for(studentmaster__c student: trigger.new){
                if(student.Age__c < 18){
                    student.adderror('A student cannot be under 18 years old.');
                }
            }
        }
        if(trigger.isinsert){
            for(studentmaster__c student: trigger.new){
                if(student.Confirmed__c == true){
                    student.adderror('A new student record cannot be marked as Confirmed.');
                }
            }
        }
    }

}