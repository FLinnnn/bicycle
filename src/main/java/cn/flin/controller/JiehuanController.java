package cn.flin.controller;

import cn.flin.bean.bicycle;
import cn.flin.bean.jiehuan;
import cn.flin.bean.resultInfo;
import cn.flin.service.BicycleService;
import cn.flin.service.JiehuanService;
import cn.flin.utils.ExcelUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: JiehuanController
 * @Author: FLin
 * @Date: 2020/1/31 17:07
 * @Description:
 */
@Controller
public class JiehuanController {
    @Autowired
    private JiehuanService jiehuanService;
    @Autowired
    private BicycleService bicycleService;
    /**
     * @Description: 分页显示模糊查询自行车借还信息 byyhid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/chaxunjiehuanCRUDbyyh",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo getAllbicyclebychaxunjiehuanbyyhid(HttpServletRequest request,@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "E",defaultValue = "")String E){
        Integer yhid =(Integer) request.getSession().getAttribute("yhid");
        PageHelper.startPage(pn,5);
        List<jiehuan> mohuchaxun = jiehuanService.mohuchaxunbyyhid(E,yhid);
        PageInfo page=new PageInfo(mohuchaxun,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示模糊查询自行车借还信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/chaxunjiehuanCRUD",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo getAllbicyclebychaxunjiehuan(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "E",defaultValue = "")String E){
        PageHelper.startPage(pn,5);
        List<jiehuan> mohuchaxun = jiehuanService.mohuchaxun(E);
        PageInfo page=new PageInfo(mohuchaxun,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 不分页显示借还订单信息管理并输出
     *通过zldid 输出zld的订单借还表
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuandingdanExcelCRUDzld", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllYHjiehuantoExcelzld(HttpServletRequest request) {
        Integer zldid = (Integer)request.getSession().getAttribute("zldid");
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<jiehuan> jiehuanList = jiehuanService.getAllonZLD(zldid);
        String filePath = realPath+"zlddingdanbiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,jiehuanList);
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示借还订单信息管理并输出
     *通过用户id 输出用户的订单借还表
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/YHjiehuandingdanExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllYHjiehuantoExcel(HttpServletRequest request) {
        Integer yhid = (Integer)request.getSession().getAttribute("yhid");
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<jiehuan> jiehuanList = jiehuanService.getAllonYH(yhid);
        String filePath = realPath+"yonghudingdanbiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,jiehuanList);
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示借还订单信息管理并输出
     *
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuandingdanExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAlljiehuantoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<jiehuan> jiehuanList = jiehuanService.getAll();
        String filePath = realPath+"dingdanbiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,jiehuanList);
        return resultInfo.success();
    }

    /**
     * @Description: 分页显示借还订单信息管理
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuandingdanCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAlljiehuanWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<jiehuan> jiehuanList = jiehuanService.getAll();
        PageInfo page = new PageInfo(jiehuanList, 5);

        return resultInfo.success().add("pageInfo", page);
    }
    /**
     * @Description: 分页显示借还订单信息管理ZLD
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuandingdanZLDCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAlljiehuanWithJsonZLD(HttpServletRequest reques,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        Integer zldid= (Integer)reques.getSession().getAttribute("zldid");
        PageHelper.startPage(pn, 5);
        List<jiehuan> jiehuanList = jiehuanService.getAllonZLD(zldid);
        PageInfo page = new PageInfo(jiehuanList, 5);

        return resultInfo.success().add("pageInfo", page);
    }
    /**
     * @Description: 分页显示借还订单信息管理YH
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuandingdanYHCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAlljiehuanWithJsonYH(HttpServletRequest reques,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        Integer yhid = (Integer)reques.getSession().getAttribute("yhid");
        PageHelper.startPage(pn, 5);
        List<jiehuan> jiehuanList = jiehuanService.getAllonYH(yhid);
        PageInfo page = new PageInfo(jiehuanList, 5);

        return resultInfo.success().add("pageInfo", page);
    }
    /**
     * @Description: 保存新的借还信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuanCRUD", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo savejiehuan(HttpServletRequest request, jiehuan jiehuan) {
        Date date = new Date();
        jiehuan.setBdate(date);
        jiehuan.setJiehuanstatus("1");
        Integer yhid = (Integer)request.getSession().getAttribute("yhid");
        jiehuan.setUserid(yhid);
        jiehuanService.savejiehuan(jiehuan);
        bicycle bicycle = new bicycle();
        bicycle.setBicycleid(jiehuan.getBid());
        bicycle.setStatus("0");

        bicycleService.changstatus(bicycle);
        return resultInfo.success();
    }

    /**
     * @Description: 还车
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuanguihuanCRUD", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo jiehuanguihuan(HttpServletRequest request, jiehuan jiehuan) {
        Date date = new Date();
        jiehuan.setTodate(date);
        jiehuan.setJiehuanstatus("0");
        Integer yhid = (Integer) request.getSession().getAttribute("yhid");
        jiehuan.setUserid(yhid);
        jiehuanService.updatejiehuan(jiehuan);
        bicycle bicycle = new bicycle();
        bicycle.setBicycleid(jiehuan.getBid());
        bicycle.setStatus("1");

        bicycleService.changstatus(bicycle);
        return resultInfo.success();
    }

    /**
     * @Description: 根据借还id查询单个借还对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/jiehuanCRUD/{id}", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getjiehuanxinxi(@PathVariable("id") Integer jiehuanid) {
        jiehuan jiehuanxinxi = jiehuanService.getjiehuanxinxi(jiehuanid);
        return resultInfo.success().add("jiehuanxinxi", jiehuanxinxi);
    }
}
