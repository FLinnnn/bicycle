package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class zld extends BaseRowModel {
    @ExcelProperty(value = "租赁点id" ,index = 0)
    private Integer zldid;
    @ExcelProperty(value = "租赁点编号" ,index = 1)
    private String bianhao;
    @ExcelProperty(value = "租赁点名称" ,index = 2)
    private String mingcheng;
    @ExcelProperty(value = "租赁点地点" ,index = 3)
    private String didian;
    @ExcelProperty(value = "租赁点图片" ,index = 4)
    private String zldimage;

    public zld() {
    }

    public zld(Integer zldid, String bianhao, String mingcheng, String didian, String zldimage) {
        this.zldid = zldid;
        this.bianhao = bianhao;
        this.mingcheng = mingcheng;
        this.didian = didian;
        this.zldimage = zldimage;
    }

    public Integer getZldid() {
        return zldid;
    }

    public void setZldid(Integer zldid) {
        this.zldid = zldid;
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao == null ? null : bianhao.trim();
    }

    public String getMingcheng() {
        return mingcheng;
    }

    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng == null ? null : mingcheng.trim();
    }

    public String getDidian() {
        return didian;
    }

    public void setDidian(String didian) {
        this.didian = didian == null ? null : didian.trim();
    }

    public String getZldimage() {
        return zldimage;
    }

    public void setZldimage(String zldimage) {
        this.zldimage = zldimage == null ? null : zldimage.trim();
    }
}