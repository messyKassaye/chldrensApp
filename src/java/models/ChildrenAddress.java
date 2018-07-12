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
public class ChildrenAddress {
    private int id;
    private int chldren_id;
    private String country;
    private String city;

    public ChildrenAddress(int id, int chldren_id, String country, String city) {
        this.id = id;
        this.chldren_id = chldren_id;
        this.country = country;
        this.city = city;
    }

    public int getChldren_id() {
        return chldren_id;
    }

    public void setChldren_id(int chldren_id) {
        this.chldren_id = chldren_id;
    }

    
    public ChildrenAddress() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    
    
}
