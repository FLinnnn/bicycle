package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class jiehuan extends BaseRowModel {
    @ExcelProperty(value = "订单id" ,index = 0)
    private Integer jiehuanid;
    @ExcelProperty(value = "自行车id" ,index = 1)
    private Integer bid;
    @ExcelProperty(value = "租赁点id" ,index = 2)
    private Integer bzldid;
    @ExcelProperty(value = "借取日期" ,index = 3,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bdate;
    @ExcelProperty(value = "归还日期" ,index = 4,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date todate;
    @ExcelProperty(value = "订单状态" ,index = 5)
    private String jiehuanstatus;
    @ExcelProperty(value = "用户id" ,index = 6)
    private Integer userid;

    private  zld zld;

    private yh yh;

    private bicycle bicycle;

    public cn.flin.bean.zld getZld() {
        return zld;
    }

    public void setZld(cn.flin.bean.zld zld) {
        this.zld = zld;
    }

    public cn.flin.bean.yh getYh() {
        return yh;
    }

    public void setYh(cn.flin.bean.yh yh) {
        this.yh = yh;
    }

    public cn.flin.bean.bicycle getBicycle() {
        return bicycle;
    }

    public void setBicycle(cn.flin.bean.bicycle bicycle) {
        this.bicycle = bicycle;
    }

    public jiehuan() {
    }

    public jiehuan(Integer jiehuanid, Integer bid, Integer bzldid, Date bdate, Date todate, String jiehuanstatus, Integer userid) {
        this.jiehuanid = jiehuanid;
        this.bid = bid;
        this.bzldid = bzldid;
        this.bdate = bdate;
        this.todate = todate;
        this.jiehuanstatus = jiehuanstatus;
        this.userid = userid;
    }

    public Integer getJiehuanid() {
        return jiehuanid;
    }

    public void setJiehuanid(Integer jiehuanid) {
        this.jiehuanid = jiehuanid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getBzldid() {
        return bzldid;
    }

    public void setBzldid(Integer bzldid) {
        this.bzldid = bzldid;
    }

    public Date getBdate() {
        return bdate;
    }

    public void setBdate(Date bdate) {
        this.bdate = bdate;
    }

    public Date getTodate() {
        return todate;
    }

    public void setTodate(Date todate) {
        this.todate = todate;
    }

    public String getJiehuanstatus() {
        return jiehuanstatus;
    }

    public void setJiehuanstatus(String jiehuanstatus) {
        this.jiehuanstatus = jiehuanstatus == null ? null : jiehuanstatus.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}