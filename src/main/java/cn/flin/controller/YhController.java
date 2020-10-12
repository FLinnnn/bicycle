package cn.flin.controller;

import cn.flin.bean.resultInfo;
import cn.flin.bean.yh;
import cn.flin.service.YhService;
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
 * @ClassName: YhController
 * @Author: FLin
 * @Date: 2020/1/20 14:21
 * @Description:
 */
@Controller
public class YhController {
    @Autowired
    private YhService yhService;
    /**
    * @Description: 用户退出
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/exitYH", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo exitYH(HttpServletRequest request){
        request.getSession().removeAttribute("yhid");
        request.getSession().removeAttribute("yh");
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示用户信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/yhExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllyhtoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<yh> getall = yhService.getall();
        String filePath = realPath+"yhbiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,getall);
        return resultInfo.success();
    }
    /**
    * @Description: 更新用户
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/updateYHCRUD", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo updateYH(yh yh){
        yhService.updateyh(yh);
        return resultInfo.success();
    }

    /**
    * @Description: 通过uid找yh对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @ResponseBody
    @RequestMapping(value = "/YHCRUD/{uid}",method = RequestMethod.GET)
    public resultInfo findyhbyuid(@PathVariable("uid") Integer uid){
        yh findbyuid = yhService.findbyuid(uid);
        return resultInfo.success().add("YHxinxi",findbyuid);
    }
    /**
     * @Description: 检查用户名是否重复
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping("/checknewyhusername")
    public resultInfo checknewyhusername(@RequestParam("username") String username) {

        boolean f = yhService.checknewyhusername(username);
        if (f) {
            return resultInfo.success();
        } else {
            return resultInfo.fail();
        }

    }
    /**
    * @Description: 保存新用户
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/yh", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo savenewyh(HttpServletRequest request,yh yh) {

        yhService.savenewyh(yh);
        request.getSession().setAttribute("yhid", yh.getUid());
        request.getSession().setAttribute("yh", yhService.findbyuid(yh.getUid()));
        return resultInfo.success();

    }
    /**
    * @Description: 通过username和password检查
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/yhlogin", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo yhloginwithusernameandpassword(HttpServletRequest request,String username, String password) {

        boolean flag=yhService.checkusernameandpassword(username,password);
        if(!flag){
            yh yh=yhService.findByUsername(username);
            request.getSession().setAttribute("yhid", yh.getUid());

            request.getSession().setAttribute("yh",yh);
            return resultInfo.success();
        }else {
            return resultInfo.fail();
        }


    }
    /**
     * @Description:  分页显示用户信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/yhListCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllyhWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<yh> yhList=yhService.getAll();
        PageInfo page=new PageInfo(yhList,5);

        return resultInfo.success().add("pageInfo",page);
    }

    /**
     * @Description: 保存 用户对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/yhCRUD",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo saveyh(yh yh){
            yhService.saveyh(yh);
            return resultInfo.success();

    }
    /**
     * @Description: 删除传入字符串以-分割 yh
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping(value = "/yhCRUD/{ids}",method = RequestMethod.DELETE)
    public resultInfo deleteyhByid(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> dids=new ArrayList<>();
            for (String string:str_ids){
                dids.add(Integer.parseInt(string));
            }
            yhService.deleteyhStrings(dids);
        }else{
            Integer id= Integer.parseInt(ids);
            yhService.deleteyh(id);
        }
        return resultInfo.success();
    }
    /**
     * @Description: 用户更新信息 put
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping(value = "/yhCRUD/{uid}", method = RequestMethod.PUT)
    public resultInfo saveupdateyh(yh yh){
        yhService.updateyh(yh);
        return resultInfo.success();
    }
}
