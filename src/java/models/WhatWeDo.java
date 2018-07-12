package models;

import java.io.Serializable;

public class WhatWeDo implements Serializable {
    private int id;
    private String title;
    private String subTitle;
    private String description;
    private String cover;

    public WhatWeDo() {
    }

    public WhatWeDo(int id, String title, String subTitle, String description, String cover) {
        this.id = id;
        this.title = title;
        this.subTitle = subTitle;
        this.description = description;
        this.cover = cover;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }
}
