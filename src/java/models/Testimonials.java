package models;

import java.io.Serializable;

public class Testimonials implements Serializable {
    private String testimony;
    private String name;
    private String profile;

    public Testimonials() {
    }

    public Testimonials(String testimony, String name, String profile) {
        this.testimony = testimony;
        this.name = name;
        this.profile = profile;
    }

    public String getTestimony() {
        return testimony;
    }

    public void setTestimony(String testimony) {
        this.testimony = testimony;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
