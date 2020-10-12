package cn.flin.controller;

import cn.flin.bean.err;
import cn.flin.bean.resultInfo;
import cn.flin.service.ErrService;
import cn.flin.utils.ExcelUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: ErrController
 * @Author: FLin
 * @Date: 2020/1/31 17:07
 * @Description:
 */
@Controller
public class ErrController {
    @Autowired
    private ErrService errService;
    /**
     * @Description: 删除传入字符串以-分割
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping(value = "/errCRUD/{ids}",method = RequestMethod.DELETE)
    public resultInfo deleteerrByid(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> dids=new ArrayList<>();
            for (String string:str_ids){
                dids.add(Integer.parseInt(string));

            }
            errService.deletebicycleerrStrings(dids);
        }else{
            Integer id= Integer.parseInt(ids);
            errService.deletebicycleerr(id);

        }
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示维护信息并输出 zld权限
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/errExcelzldCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllerrtoExcelzld(HttpServletRequest request) {
        Integer zldid = (Integer)request.getSession().getAttribute("zldid");
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<err> all = errService.getAllbyzldid(zldid);
        String filePath = realPath+"zldweihuxinxibiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,all);
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示维护信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/errExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllerrtoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<err> all = errService.getAll();
        String filePath = realPath+"weihuxinxibiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,all);
        return resultInfo.success();
    }
    /**
     * @Description: 分页显示管理员运维管理byzldid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/errzldCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllerrWithJsonzldid(HttpServletRequest request, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        Integer zldid = (Integer)request.getSession().getAttribute("zldid");
        PageHelper.startPage(pn,5);
        List<err> all = errService.getAllbyzldid(zldid);
        PageInfo page=new PageInfo(all,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示管理员运维管理
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/errCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllerrWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<err> all = errService.getAll();
        PageInfo page=new PageInfo(all,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
    * @Description: 保存一个报修信息
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @ResponseBody
    @RequestMapping(value = "/errCRUD",method = RequestMethod.POST)
    public resultInfo savenewerr(err err){
        errService.saveer(err);
        return resultInfo.success();
    }
}
