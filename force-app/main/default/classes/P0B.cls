/////////////////////////////////////////////////////////////////
//
// Name: Project 0 Bravo
// Author: Jonathan Shoemaker (jonathan.shoemaker@revature.net)
// Date: 01/23/2020	
// Description: Series of apex methods to demonstrate
// basic understanding of coding concepts.
//
/////////////////////////////////////////////////////////////////


public class P0B {
    
    /*
* 1. Return the nth Fibonacci number
* Test Cases:
* Input: 0     Output: 0
* Input: 1    Output: 1
* Input: 2     Output: 1
* Input: 10    Output: 55

//FIB TESTING
p0b testobject = new p0b();
testobject.fibnumber(0);
testobject.fibnumber(1);
testobject.fibnumber(2);
testobject.fibnumber(10);

*/
    
    public integer fibnumber(integer nth){
        
        integer first = 0;
        integer fibnumber = 1;
        
        for (integer i=0; i<(nth-1); i++){
            
            fibnumber = first + fibnumber;
            first = fibnumber - first;
            system.debug(fibnumber);
            
        }
        
        return fibnumber;
    }
    
    /*
* 2. Sort an array of integers.
* Test Cases:
* Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
* Input: [5,4,3,2,1]     Output: [1,2,3,4,5]

//SORTING TESTING
p0b testobject = new p0b();
list<integer> newarray = new list<integer>();
newarray.add(1);
newarray.add(3);
newarray.add(4);
newarray.add(1);
newarray.add(2);
system.debug(newarray);
newarray = testobject.sortingfunction(newarray);
system.debug(newarray);

*/
    
    
    public list<integer> sortingfunction(list<integer> passedinarray){
        
        passedinarray.sort();
        return passedinarray;
    }
    
    /*
* 3. Return the factorial of n.
* Test Cases:
* Input: 0    Output: 1
* Input: 1    Output: 1
* Input: 3    Output: 6

//FACTORIAL TESTING
p0b testobject = new p0b();
system.debug(testobject.factorialfunction(0));
system.debug(testobject.factorialfunction(1));
system.debug(testobject.factorialfunction(3));

*/
    
    
    public static integer factorialfunction(integer nth){
        
        integer total = 1;
        
        for(integer i=nth; i>0; i--){
            
            total *= i;
            system.debug(total);
            
        }
        
        return total;
        
    }
    
    
    /*
* 4. Rotate left
* Given an array, array, and an integer, n, rotate the values in array left n times and return array
* Test Cases:
* Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
* Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
* Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]

//ROTATE TESTING
p0b testobject = new p0b();
list<integer> intlist = new list<integer>();
intlist.add(1);
intlist.add(2);
intlist.add(3);
intlist.add(4);
intlist.add(5);
system.debug(intlist);
system.debug(testobject.rotatearrayleft(intlist,1));
*/
    
    
    public list<integer> rotateArrayLeft(list<integer> array1, integer nth){
        
        for(integer j=0; j<nth;j++){
            integer firstnum = array1[0];
            for(integer i=0; i<array1.size();i++){
                
                if(i > 0){
                    array1[i-1] = array1[i];
                    
                }
            }
            array1[(array1.size()-1)] = firstnum;
        }
        return array1;
    }
    
    /*
* 6. Create a method that retrieves a list of all accounts and updates those accounts.
*      Create a custom field on the Account standard object called Size__c that will be a 
* picklist containing small/medium/large.
*     Create a method that retrieves a list of all accounts. 
*         - If an account has between 1-1000 employees then it is classified as small.
*         - If an account has between 1001-10000 employees it is classified as medium.
*         - If an account has more than 10000 employees it is classified as large.
*     Update the Size__c field on each account to reflect the amount of employees in the Account.

//UPDATE WITH SIZE TESTING
p0b testobject = new p0b();
testobject.updateaccount();
*/
    
    public void updateaccount(){
        
        list<account> accountlist = new list<account>();
        accountlist = [select id,name,NumberOfEmployees, size__c from account];
        for(account a: accountlist){
            if (a.numberofemployees >= 1 && a.numberofemployees <= 1000){
                a.size__c = 'small';
                system.debug(a.name + ' is now marked as ' + a.size__c);
                
            }
            else if(a.numberofemployees >= 1001 && a.numberofemployees <= 10000){
                a.size__c = 'medium';
                system.debug(a.name + ' is now marked as ' + a.size__c);                
            }
            else if(a.numberofemployees > 10000){
                a.size__c = 'large';
                system.debug(a.name + ' is now marked as ' + a.size__c);                
            }
        }
        
        update accountlist;
    }
    
    
    /* 
* 7. Create a method that will find all leads that contain 'ca' in their fields. 
*     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
* Converted' and their description should display the message, "We are no longer doing 
* business in California."

//CLOSING CALIFORNIA LEADS TESTING
p0b testobject = new p0b();
testobject.closingcali();
*/
    
    public void closingcali(){
        
        list<lead> leadlist = new list<lead>();
        leadlist = [select id, company, status,address, description from lead where state like '%ca%'];
        
        for(lead l: leadlist){
            l.status = 'Closed - Not Converted';
            system.debug(l.company + ' has changed it\'s status to ' + l.status);
            l.description = 'We are no longer doing business in California.';
            system.debug('And a note has been added in the decription area that states: '+ l.description);
        }
        
        update leadlist;
    }
    
    /*
* 8. Create a method that will find all Opportunities which have already passed their Close Date 
* and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
* they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
* 
//PASSED DUE TESTING
p0b testobject = new p0b();
testobject.passeddue();
*/
    
    public void passedDue(){
        
        list<opportunity> opplist1 = new list<opportunity>();
        opplist1 = [select id, name, closedate, stagename from opportunity where stagename != 'Closed Won'];
        
        for(opportunity o: opplist1){
            if(o.closedate < date.today()){
                o.stagename = 'Closed Lost';
                system.debug('The status for ' + o.name + ' has been changed to ' + o.StageName);
            }
            else{
                system.debug(o.name + ' is still an open opporunity.');
            }
        }
        
        update opplist1;
        
    }
}