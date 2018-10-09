package com.comlink.rowmapper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class main {

	public static void main(String args[]) throws ParseException{
	      Date date = new Date(1468314000000L);
	        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	        System.out.println(format.format(date));
	        format.setTimeZone(TimeZone.getTimeZone("Etc/UTC"));
	        String formatted = format.format(date);
	        System.out.println(formatted);
	        format.setTimeZone(TimeZone.getTimeZone("Australia/Sydney"));
	        formatted = format.format(date);
	        System.out.println(formatted);
	}
}
