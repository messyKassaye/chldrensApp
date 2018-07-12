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
public class ChildrenProfile {
    private int foreign_id;
    private String path;

    public ChildrenProfile(int foreign_id, String path) {
        this.foreign_id = foreign_id;
        this.path = path;
    }

    public ChildrenProfile() {
    }

    public int getForeign_id() {
        return foreign_id;
    }

    public void setForeign_id(int foreign_id) {
        this.foreign_id = foreign_id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    
}
