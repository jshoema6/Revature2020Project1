public with sharing class AccountTriggerHandler {
    
    
    public static void handlebefore(map<id,account> triggeroldmap, list<account> triggernew, list<account> triggerold){
        
        if(Trigger.isbefore){
            
            if(Trigger.isinsert){
                for(Account acc:triggernew){
                    
                    if(acc.AnnualRevenue == null){
                        acc.adderror('Annual Revenue cannot be null.');
                    }
                    
                    if(acc.AnnualRevenue < 100000 && acc.Rating == 'Hot'){
                        
                        acc.adderror('Accounts marked as Hot should have an annual revenue above $100,000');
                    }
                    
                    if(acc.AnnualRevenue < 1000){
                        acc.adderror('Annual Revenue cannot be less than $1000 for new accounts.');
                    }
                    
                    if(acc.Industry == 'Chemicals'){
                        acc.adderror('Chemicals is not a valid option for account creation. Please select Banking.');
                    }
                }
            }
            
            if(Trigger.isupdate){
                for(Account acc:triggernew){
                    
                    //system.debug('Values from accounts in insert mode trigger.new: ' + acc);
                    //system.debug('This is the account ID: ' + acc.Id);
                    
                    //dont allow change of picklist from education to construction
                    if(acc.Industry == 'Construction' && triggeroldmap.get(acc.id).industry == 'Education'){
                        acc.adderror('Education to Construction is a bad move.');   
                    }
                    
                    if(acc.AnnualRevenue < 100000 && acc.Rating == 'Hot'){
                        
                        acc.adderror('Accounts marked as Hot should have an annual revenue above $100,000');
                    }
                    
                    if(acc.AnnualRevenue == null){
                        acc.adderror('Annual Revenue cannot be null.');
                    }
                    
                    if(acc.Industry == 'Chemicals'){
                        acc.adderror('Chemicals is not a valid option for an account. Please select Banking.'); //Literally a validation rule replacement
                    }
                }
            } 
            
            if(trigger.isdelete){
                for(account acc: triggerold){
                    if(acc.Name == 'Revature'){
                        acc.adderror('You cannot delete Revature. Revature deletes you.');
                    }
                }
            }
        }
    }
    
    public static void afterhandler(map<id,account> triggeroldmap, list<account> triggernew, list<account> triggerold){
        
        if(trigger.isafter){
            if(trigger.isinsert){
                contact cont;
                list<contact> contlist = new list<contact>();
                
                for(account acc: triggernew){
                    cont = new contact(accountid = acc.Id, lastname = acc.Name + 'from Trigger');
                    contlist.add(cont);
                }
                insert contlist;
            }
            
            if(trigger.isupdate){
                list<case> caselist = new list<case>();
                caselist = [select id, accountid from case where accountid != null];
                list<case> closecaselist = new list<case>();
                
                for(account acc: triggernew){
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
            
        }
    }
}