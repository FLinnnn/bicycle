package cn.flin.controller;

import cn.flin.bean.gly;
import cn.flin.bean.resultInfo;
import cn.flin.service.GlyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: GlyController
 * @Author: FLin
 * @Date: 2020/1/20 14:20
 * @Description:
 */
@Controller
public class GlyController {
    @Autowired
    private GlyService glyService;
    /**
     * @Description: 管理员退出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/exitGLY", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo exitGLY(HttpServletRequest request){
        request.getSession().removeAttribute("glyid");
        request.getSession().removeAttribute("gly");
        return resultInfo.success();
    }
    /**
    * @Description: 管理员校验用户名密码
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/glylogin", method = RequestMethod.POST)
    @ResponseBody
    public resultInfo glyloginwithusernameandpassword(HttpServletRequest request, String username, String password) {

        boolean flag=glyService.checkusernameandpassword(username,password);
        if(!flag){
            gly gly=glyService.findByUsername(username);
            request.getSession().setAttribute("glyid",gly.getAdminid());
            request.getSession().setAttribute("gly",gly);
            return resultInfo.success();
        }else {
            return resultInfo.fail();
        }


    }
}
