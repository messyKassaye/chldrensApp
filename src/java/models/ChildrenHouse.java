/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author meseret
 */
public class ChildrenHouse {
    private String id;
    private int chidrenId;
    private String key;
    private String value;

    public ChildrenHouse(String id, int chidrenId, String key, String value) {
        this.id = id;
        this.chidrenId = chidrenId;
        this.key = key;
        this.value = value;
    }

    public ChildrenHouse() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getChidrenId() {
        return chidrenId;
    }

    public void setChidrenId(int chidrenId) {
        this.chidrenId = chidrenId;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    
    
    
}
