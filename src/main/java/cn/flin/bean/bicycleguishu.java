package cn.flin.bean;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class bicycleguishu extends BaseRowModel {
    @ExcelProperty(value = "自行车归属id" ,index = 0)
    private Integer bzid;
    @ExcelProperty(value = "自行车id" ,index = 1)
    private Integer bid;
    @ExcelProperty(value = "租赁点id" ,index =2)
    private Integer zid;

    public bicycleguishu() {
    }

    public bicycleguishu(Integer bzid, Integer bid, Integer zid) {
        this.bzid = bzid;
        this.bid = bid;
        this.zid = zid;
    }

    public Integer getBzid() {
        return bzid;
    }

    public void setBzid(Integer bzid) {
        this.bzid = bzid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getZid() {
        return zid;
    }

    public void setZid(Integer zid) {
        this.zid = zid;
    }
}