package cn.flin.controller;

import cn.flin.bean.resultInfo;
import cn.flin.bean.zld;
import cn.flin.service.ZldService;
import cn.flin.utils.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: ZldController
 * @Author: FLin
 * @Date: 2020/1/17 15:43
 * @Description:
 */
@Controller
public class ZldController {
    @Autowired
    private ZldService zldService;
    /**
     * @Description: 不分页显示租赁点信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/zldExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllzldtoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<zld> list=zldService.findAll();
        String filePath = realPath+"zldbiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,list);
        return resultInfo.success();
    }
    /**
    * @Description: 查询所有的租赁点信息
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @ResponseBody
    @RequestMapping("/zldxinxi")
    public resultInfo findAllzld(){
        List<zld> list=zldService.findAll();
        return resultInfo.success().add("info",list);
    }
    /**
    * @Description: 保存新租赁点信息（包括图片）
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/zldupload",method = RequestMethod.POST)
    public String savezld(HttpServletRequest request,@RequestParam("bianhao") String bianhao , @RequestParam("mingcheng") String mingcheng , @RequestParam("didian") String didian, @RequestParam(value="zldimage",required=false) MultipartFile file){
        zld zld = new zld();
        zld.setBianhao(bianhao);
        zld.setMingcheng(mingcheng);
        zld.setDidian(didian);
        zld.setZldimage(file.getOriginalFilename());
        String filename=file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("images/");
        zldService.savezld(zld);
        try {
            file.transferTo(new File(path,filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "GLYzldCRUDList";
    }
    /**
    * @Description: 返回部门信息 在租赁点管理员联合表中
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping("/zld")
    @ResponseBody
    public resultInfo getZld(){
        List<zld> list=zldService.getzld();
        return resultInfo.success().add("zldlist",list);
    }
}
