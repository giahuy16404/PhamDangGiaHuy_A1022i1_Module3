package com.example.display_list;

public class Entity {
    private String name;
    private String birthday;
    private String location;
    private String pictures;

    public Entity(String name, String birthday, String location, String pictures) {
        this.name = name;
        this.birthday = birthday;
        this.location = location;
        this.pictures = pictures;
    }

    public String getName() {
        return name;
    }

    public String getPictures() {
        return pictures;
    }

    public void setPictures(String pictures) {
        this.pictures = pictures;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
