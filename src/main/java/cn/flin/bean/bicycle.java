package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class bicycle extends BaseRowModel {
    @ExcelProperty(value = "自行车id" ,index = 0)
    private Integer bicycleid;
    @ExcelProperty(value = "自行车编号" ,index = 1)
    private String bianhao;
    @ExcelProperty(value = "自行车品牌" ,index = 2)
    private String pinpai;
    @ExcelProperty(value = "自行车分类id" ,index = 3)
    private Integer cid;
    @ExcelProperty(value = "添加日期" ,index = 4,format = "yyyy/MM/dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tianjiariqi;
    @ExcelProperty(value = "自行车备注" ,index = 5)
    private String beizhu;
    @ExcelProperty(value = "自行车状态" ,index = 6)
    private String status;

    private category category;

    private bicycleimage bicycleimage;

    private zld zld;

    public cn.flin.bean.zld getZld() {
        return zld;
    }

    public void setZld(cn.flin.bean.zld zld) {
        this.zld = zld;
    }

    public cn.flin.bean.bicycleimage getBicycleimage() {
        return bicycleimage;
    }

    public void setBicycleimage(cn.flin.bean.bicycleimage bicycleimage) {
        this.bicycleimage = bicycleimage;
    }

    public cn.flin.bean.category getCategory() {
        return category;
    }

    public void setCategory(cn.flin.bean.category category) {
        this.category = category;
    }

    public bicycle() {
    }

    public bicycle(Integer bicycleid, String bianhao, String pinpai, Integer cid, Date tianjiariqi, String beizhu, String status) {
        this.bicycleid = bicycleid;
        this.bianhao = bianhao;
        this.pinpai = pinpai;
        this.cid = cid;
        this.tianjiariqi = tianjiariqi;
        this.beizhu = beizhu;
        this.status = status;
    }

    public Integer getBicycleid() {
        return bicycleid;
    }

    public void setBicycleid(Integer bicycleid) {
        this.bicycleid = bicycleid;
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? null : bianhao.trim();
    }

    public String getPinpai() {
        return pinpai;
    }

    public void setPinpai(String pinpai) {
        this.pinpai = pinpai == null ? null : pinpai.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Date getTianjiariqi() {
        return tianjiariqi;
    }

    public void setTianjiariqi(Date tianjiariqi) {
        this.tianjiariqi = tianjiariqi;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? null : beizhu.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}