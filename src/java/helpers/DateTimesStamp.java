/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.sql.Timestamp;
import java.util.Calendar;

/**
 *
 * @author meseret
 */
public class DateTimesStamp {
    private static DateTimesStamp date= null;

    public DateTimesStamp() {
    }
    
    public static  DateTimesStamp instance(){
        if(date==null){
            date=new DateTimesStamp();
        }
        
        return date;
    }
    
    public Timestamp getTimeStamp(){
        Calendar calendar = Calendar.getInstance();
        java.util.Date now = calendar.getTime();
        Timestamp time = new Timestamp(now.getTime());
       
        return time;
    }
    
}
