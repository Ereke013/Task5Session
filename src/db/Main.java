package db;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Main {
    public static void main(String[] args) {
        Date d = new Date((long)1481723817*1000);
        DateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat m = new SimpleDateFormat("MM");
        System.out.println(f.format(d));
    }
}
