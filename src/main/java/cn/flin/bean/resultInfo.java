package cn.flin.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @PackageName: cn.flin.bean 返回类
 * @ClassName: resultInfo
 * @Author: FLin
 * @Date: 2020/1/17 11:24
 * @Description:
 */
public class resultInfo {
    private int code;
    private String msg;
    private Map<String ,Object> extend =new HashMap<String, Object>();

    public resultInfo() {
    }

    public resultInfo(int code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }

    public resultInfo(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public resultInfo add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }
    public static resultInfo success(){
        resultInfo info=new resultInfo();
        info.setCode(200);
        info.setMsg("成功");
        return info;
    }
    public static resultInfo fail(){
        resultInfo info=new resultInfo();
        info.setCode(500);
        info.setMsg("失败");
        return info;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
