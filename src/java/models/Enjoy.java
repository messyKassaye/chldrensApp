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
public class Enjoy {
    private int id;
    private int children_id;
    private String enjoys;

    public Enjoy(int id, int children_id, String enjoys) {
        this.id = id;
        this.children_id = children_id;
        this.enjoys = enjoys;
    }

    public int getChildren_id() {
        return children_id;
    }

    public void setChildren_id(int children_id) {
        this.children_id = children_id;
    }

    

    public Enjoy() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnjoys() {
        return enjoys;
    }

    public void setEnjoys(String enjoys) {
        this.enjoys = enjoys;
    }
    
    
    
}
