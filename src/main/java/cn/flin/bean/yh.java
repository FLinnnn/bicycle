package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class yh extends BaseRowModel {
    @ExcelProperty(value = "用户id" ,index = 0)
    private Integer uid;
    @ExcelProperty(value = "用户名" ,index = 1)
    private String username;
    @ExcelProperty(value = "密码" ,index = 2)
    private String password;
    @ExcelProperty(value = "昵称" ,index = 3)
    private String uname;
    @ExcelProperty(value = "用户生日" ,index = 4,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    @ExcelProperty(value = "性别" ,index = 5)
    private String sex;
    @ExcelProperty(value = "电话" ,index = 6)
    private String telephone;
    @ExcelProperty(value = "邮箱" ,index = 7)
    private String email;

    public yh() {
    }

    public yh(Integer uid, String username, String password, String uname, Date birthday, String sex, String telephone, String email) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.uname = uname;
        this.birthday = birthday;
        this.sex = sex;
        this.telephone = telephone;
        this.email = email;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }
}