package com.soaint.content.common;


import java.util.ResourceBundle;

public class ContentProperties {
    private static ResourceBundle properties = ResourceBundle.getBundle("com.soaint.content.content");


    public static void main(String args[]){
        System.out.println( "*********       " + ContentProperties.getProperty( "ucm_checkIn.endpoint" ) );
    }

    public static String getProperty(String key){
        return properties.getString( key );
    }
}
