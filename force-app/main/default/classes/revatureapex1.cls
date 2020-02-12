public class revatureapex1 {
    
    private integer val1 = 0;
    
    public static integer staticTest = 200;
    
    static {
        
        system.debug('This is not even part of the class at all. But we\'re still going.');
    }
    
    public void updateval1(integer x){
        val1=x;
    }
    public integer getval1(){
        return this.val1;
    }
    
    @invocablemethod(label = 'sample method1')
    public static void method1(list<id> ids){
    
    system.debug('id of new record' + ids);
        map<integer,string> mapofdays = new map<integer,string>();
        
        mapofdays.put(1, 'Monday');
        mapofdays.put(2, 'Tuesday');
        mapofdays.put(3, 'Wednesday');
        mapofdays.put(4, 'Thursday');
        mapofdays.put(5, 'Friday');
        
        system.debug(mapofdays);
    }
    
    public void method2(){
        list<string> dayslist = new list<string> ();
        dayslist.add('Fishday');
        dayslist.add('Chickenday');
        dayslist.add('Eggnesday');
        dayslist.add('Orangeday');
        dayslist.add('Lemonday');
        map<integer, string> mapofdays2 = new map<integer, string>();
        
        for(integer x=0; x< dayslist.size(); x++){
            mapofdays2.put(x, dayslist[x]);
        }
        
        system.debug(mapofdays2);
    }
}