package bean.serviceBean;

import java.io.Serializable;

public class ServiceType{
    private int id;
    private String name;

    public ServiceType(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public ServiceType() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
