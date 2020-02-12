public class Car extends Vehicles implements interface1 {
    
    public integer processcount = 0;
    
    public void caraccessories(integer numOfCupholders, integer acvents, integer racks){
        
        system.debug(numofCupholders + ' ' + acvents + ' ' + racks);
        
        
    }

    
    
    public Car(){
        
        processcount++;
        system.debug(processcount);
        
    }
    
    public Car(integer x, integer y){
        
        system.debug('This object was constructed using the second constructor.');
        
    }
    
    
    
    public void method1(){
        this.carsetup(4, 4, 4);
        system.debug('new car setup: ' + this.wheels + this.seats );
        this.caraccessories(3,1,2);
    }
        
    public void bikesetup(integer x, integer y, integer a){
            
        }
    
    public static void stmethod(){
        system.debug('This is only a static method. There is no spoon.');
    }
    
}