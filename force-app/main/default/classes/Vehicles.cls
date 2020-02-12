public class Vehicles {
    
    public integer wheels;
    public integer seats;
    public integer doors;
    
    public Vehicles(){
        
        system.debug('Constructed using super class.');
    }
    
    public void carsetup(integer x, integer y, integer z){
        this.wheels = x;
        this.seats = y;
        this.doors = z;
    }
    
    public void bikesetup(integer x, integer y){
        this.wheels = x;
        this.seats = y;
    }
}