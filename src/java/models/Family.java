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
public class Family {
    private int id;
    private int child_id;
    private String first_name;
    private String last_name;
    private String relation;

    public Family(int id, int child_id, String first_name, String last_name, String relation) {
        this.id = id;
        this.child_id = child_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.relation = relation;
    }

    public Family() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getChild_id() {
        return child_id;
    }

    public void setChild_id(int child_id) {
        this.child_id = child_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }
    
    
}
