package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class category extends BaseRowModel {
    @ExcelProperty(value = "分类id" ,index = 0)
    private Integer categoryid;
    @ExcelProperty(value = "分类名称" ,index = 1)
    private String cname;

    public category() {
    }

    public category(Integer categoryid, String cname) {
        this.categoryid = categoryid;
        this.cname = cname;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }
}