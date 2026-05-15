package my.bean;

import java.sql.Timestamp;

public class Register {
    private int id;
    private String logname = "";
    private String password = "";
    private String phone = "";
    private String address = "";
    private String realname = "";
    private Timestamp createTime;

    public Register() {
    }

    public Register(String logname, String password, String phone, String address, String realname) {
        this.logname = logname;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.realname = realname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
