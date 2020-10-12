package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Pattern;
import java.util.Date;

public class zldgly extends BaseRowModel {
    @ExcelProperty(value = "租赁点管理员id" ,index = 0)
    private Integer zldglyid;
    @ExcelProperty(value = "租赁点管理员用户名" ,index = 1)
    @Pattern(regexp = "^\\w{3,20}$",message = "用户名格式错误")
    private String username;
    @ExcelProperty(value = "租赁点管理员密码" ,index = 2)
    private String password;
    @ExcelProperty(value = "租赁点管理员昵称" ,index = 3)
    private String name;
    @ExcelProperty(value = "租赁点管理员生日" ,index = 4,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    @ExcelProperty(value = "租赁点管理员性别" ,index = 5)
    private String sex;
    @ExcelProperty(value = "租赁点管理员电话" ,index = 6)
    private String telephone;
    @ExcelProperty(value = "租赁点管理员邮箱" ,index = 7)
    private String email;
    @ExcelProperty(value = "租赁点管理员所属租赁点" ,index = 8)
    private Integer zid;

    private zld zld;

    public zldgly() {
    }

    @Override
    public String toString() {
        return "zldgly{" +
                "zldglyid=" + zldglyid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", birthday=" + birthday +
                ", sex='" + sex + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", zid=" + zid +
                '}';
    }

    public zldgly(Integer zldglyid, String username, String password, String name, Date birthday, String sex, String telephone, String email, Integer zid) {
        this.zldglyid = zldglyid;
        this.username = username;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.sex = sex;
        this.telephone = telephone;
        this.email = email;
        this.zid = zid;
    }

    public zld getZld() {
        return zld;
    }

    public void setZld(zld zld) {
        this.zld = zld;
    }

    public Integer getZldglyid() {
        return zldglyid;
    }

    public void setZldglyid(Integer zldglyid) {
        this.zldglyid = zldglyid;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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

    public Integer getZid() {
        return zid;
    }

    public void setZid(Integer zid) {
        this.zid = zid;
    }
}