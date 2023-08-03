package com.soaint.content.model;

import java.io.Serializable;

public class GenericItem implements Serializable{
    
    
    private String id;
    private String description;

    public GenericItem(String i, String d){
        id = i;
        description = d;
        }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }    
}
