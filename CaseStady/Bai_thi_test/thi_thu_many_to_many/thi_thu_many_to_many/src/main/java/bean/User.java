package bean;

import java.util.List;

public class User {
    private int id;
    private String name;
    private String code;
    private String birthday;
    private String thoiGianKhoiTao;

    private List<Role> roles;

    public User() {
    }

    public User(int id, String name, String code, String birthday, String thoiGianKhoiTao, List<Role> roles) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.birthday = birthday;
        this.thoiGianKhoiTao = thoiGianKhoiTao;
        this.roles = roles;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getThoiGianKhoiTao() {
        return thoiGianKhoiTao;
    }

    public void setThoiGianKhoiTao(String thoiGianKhoiTao) {
        this.thoiGianKhoiTao = thoiGianKhoiTao;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
