package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class err extends BaseRowModel {
    @ExcelProperty(value = "维护id" ,index = 0)
    private Integer errid;
    @ExcelProperty(value = "自行车id" ,index = 1)
    private Integer bid;
    @ExcelProperty(value = "维护信息" ,index = 2)
    private String type;
    @ExcelProperty(value = "维护时间" ,index = 3,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    private bicycle bicycle;

    private category category;

    private bicycleimage bicycleimage;

    private bicycleguishu bicycleguishu;

    private zld zld;

    private zldgly zldgly;

    public cn.flin.bean.zldgly getZldgly() {
        return zldgly;
    }

    public void setZldgly(cn.flin.bean.zldgly zldgly) {
        this.zldgly = zldgly;
    }

    public cn.flin.bean.bicycle getBicycle() {
        return bicycle;
    }

    public void setBicycle(cn.flin.bean.bicycle bicycle) {
        this.bicycle = bicycle;
    }

    public cn.flin.bean.category getCategory() {
        return category;
    }

    public void setCategory(cn.flin.bean.category category) {
        this.category = category;
    }

    public cn.flin.bean.bicycleimage getBicycleimage() {
        return bicycleimage;
    }

    public void setBicycleimage(cn.flin.bean.bicycleimage bicycleimage) {
        this.bicycleimage = bicycleimage;
    }

    public cn.flin.bean.bicycleguishu getBicycleguishu() {
        return bicycleguishu;
    }

    public void setBicycleguishu(cn.flin.bean.bicycleguishu bicycleguishu) {
        this.bicycleguishu = bicycleguishu;
    }

    public cn.flin.bean.zld getZld() {
        return zld;
    }

    public void setZld(cn.flin.bean.zld zld) {
        this.zld = zld;
    }

    public err() {
    }

    public err(Integer errid, Integer bid, String type, Date date) {
        this.errid = errid;
        this.bid = bid;
        this.type = type;
        this.date = date;
    }

    public Integer getErrid() {
        return errid;
    }

    public void setErrid(Integer errid) {
        this.errid = errid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}