package cn.flin.controller;

import cn.flin.bean.resultInfo;
import cn.flin.bean.zldgly;
import cn.flin.service.ZldglyService;
import cn.flin.utils.ExcelUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: zldgly
 * @Author: FLin
 * @Date: 2020/1/16 18:59
 * @Description:
 */
@Controller
public class ZldglyController {
    @Autowired
    ZldglyService zldglyService;
    /** 
    * @Description: 删除传入字符串以-分割
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    @ResponseBody
    @RequestMapping(value = "/zldglyCRUD/{ids}",method = RequestMethod.DELETE)
    public resultInfo deletezldglyByid(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> dids=new ArrayList<>();
            for (String string:str_ids){
                dids.add(Integer.parseInt(string));

            }
            zldglyService.deletezldglyStrings(dids);
        }else{
            Integer id= Integer.parseInt(ids);
            zldglyService.deletezldgly(id);

        }
        return resultInfo.success();
    }
    /** 
    * @Description: 租赁点管理员更新信息
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    @ResponseBody
    @RequestMapping(value = "/zldglyCRUD/{zldglyid}", method = RequestMethod.PUT)
    public resultInfo saveupdatezldgly(zldgly zldgly){
        zldglyService.updatezldgly(zldgly);
        return resultInfo.success();
    }
    /** 
    * @Description: 根据租赁点管理员id查询租赁点管理员对象
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    @RequestMapping(value = "/zldglyCRUD/{id}",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getzldglyxinxi(@PathVariable("id")Integer zldglyid){
        zldgly zldgly=zldglyService.getzldglyxinxi(zldglyid);
        return resultInfo.success().add("zldglyxinxi",zldgly);
    }
    /** 
    * @Description: 检查租赁点管理新增的用户名是否重复
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    @ResponseBody
    @RequestMapping("/checknewusername")
    public resultInfo checknewzldglyusername(@RequestParam("username") String username){
        boolean f=zldglyService.checknewusername(username);
        if (f){
            return resultInfo.success();
        }else{
            return resultInfo.fail();
        }

    }
    /** 
    * @Description: 保存 租赁点管理员对象
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    @RequestMapping(value = "/zldglyCRUD",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo savezldgly(@Valid zldgly zldgly, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return resultInfo.fail().add("err",map);
        }else {
            zldglyService.saveZldgly(zldgly);
            return resultInfo.success();

        }
    }
    /**
    * @Description:  分页显示租赁点管理员信息
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/zldglyCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllZldglyWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<zldgly> zldglyList=zldglyService.getAll();
        PageInfo page=new PageInfo(zldglyList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /** 
    * @Description:分配管理租赁点管理员
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
//弃用
//    public String getAllzldgly(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        PageHelper.startPage(pn,5);
//        List<zldgly> zldglyList=zldglyService.getAll();
//        PageInfo page=new PageInfo(zldglyList,5);
//        model.addAttribute("pageInfo",page);
//        return "zldglyCRUDList";
//    }
    /**
     * @Description: 不分页显示租赁点管理员信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/zldglyExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllzldglytoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<zldgly> zldglyList=zldglyService.getAll();
        String filePath = realPath+"zldglybiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,zldglyList);
        return resultInfo.success();
    }
    /**
     * @Description: 租赁点管理员退出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/exitZLDGLY", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo exitZLDGLY(HttpServletRequest request){
        request.getSession().removeAttribute("zldid");
        request.getSession().removeAttribute("zldgly");
        return resultInfo.success();
    }
    /**
    * @Description:  校验用户名密码存入session
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/zldglylogin", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo zldglyloginwithusernameandpassword(HttpServletRequest request, String username, String password) {

        boolean flag=zldglyService.checkusernameandpassword(username,password);
        if(!flag){
            zldgly zldgly=zldglyService.findByUsername(username);
            request.getSession().setAttribute("zldid",zldgly.getZid());
            request.getSession().setAttribute("zldgly",zldgly);
            return resultInfo.success();
        }else {
            return resultInfo.fail();
        }


    }
}
