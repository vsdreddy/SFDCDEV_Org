public class helloworld{
public void arg(){
    System.debug('Hellow World');
}

public void getVehicles(){
    Vehicle__c[] ves = [Select id from Vehicle__c];
    System.debug('Vehicle: ' + ves[0].id);
}

public void publicmsg(){
    system.debug('From public method accessed via object');
   }

public static void statmsg(){
    System.debug('From static menthod');
}
}