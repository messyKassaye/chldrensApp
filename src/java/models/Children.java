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
public class Children {
    private int id;
    private String firstName;
    private String lastName;
    private String gender;
    private String livesWith;
    private String speaks;
    private String schools;
    private String history;
    private String family_income;
    private String sponsors_saying;
    private String profile_pic;
    private String age;
    private String country;

    public Children(int id, String firstName, String lastName, String gender, String livesWith, String speaks, String schools, String history, String sponsors_saying) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.livesWith = livesWith;
        this.speaks = speaks;
        this.schools = schools;
        this.history = history;
        this.sponsors_saying = sponsors_saying;
    }

    public Children() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLivesWith() {
        return livesWith;
    }

    public void setLivesWith(String livesWith) {
        this.livesWith = livesWith;
    }

    public String getSpeaks() {
        return speaks;
    }

    public void setSpeaks(String speaks) {
        this.speaks = speaks;
    }

    public String getSchools() {
        return schools;
    }

    public void setSchools(String schools) {
        this.schools = schools;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getSponsors_saying() {
        return sponsors_saying;
    }

    public void setSponsors_saying(String sponsors_saying) {
        this.sponsors_saying = sponsors_saying;
    }


    

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String getFamily_income() {
        return family_income;
    }

    public void setFamily_income(String family_income) {
        this.family_income = family_income;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

   

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
    
    
    
    
    
    
}
