package cn.flin.controller;

import cn.flin.bean.*;
import cn.flin.service.*;
import cn.flin.utils.ExcelUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: BicycleController
 * @Author: FLin
 * @Date: 2020/1/20 14:20
 * @Description:
 */
@Controller
public class BicycleController {
    @Autowired
    private BicycleImageService bicycleImageService;
    @Autowired
    private BicycleGuishuService bicycleGuishuService;
    @Autowired
    private BicycleService bicycleService;
    @Autowired
    private ErrService errService;
    @Autowired
    private JiehuanService jiehuanService;
    /**
     * @Description: 不分页显示自行车信息并输出 zld权限
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleExcelzldCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycletoExcelzld(HttpServletRequest request) {
        Integer zldid = (Integer)request.getSession().getAttribute("zldid");
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<bicycle> all = bicycleService.getAllbyzldid(zldid);
        String filePath = realPath+"zldzixingchexinxibiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,all);
        return resultInfo.success();
    }
    /**
     * @Description: 不分页显示自行车信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycletoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<bicycle> all = bicycleService.getAll();
        String filePath = realPath+"zixingchexinxibiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,all);
        return resultInfo.success();
    }
    /**
     * @Description: 检查自行车新增的编号是否重复
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping("/checknewbianhao")
    public resultInfo checknewbicyclebianhao(@RequestParam("bianhao") String bianhao){
        boolean f=bicycleService.checknewbianhao(bianhao);
        if (f){
            return resultInfo.success();
        }else{
            return resultInfo.fail();
        }

    }
    /**
     * @Description: 检查自行车新增报修bicycleid是否重复或不存在
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping("/checkbicycleid")
    public resultInfo checknewbicyclebicycleid(@RequestParam("bicycleid") Integer bicycleid){
        boolean f=bicycleService.checkbicycleid(bicycleid);
        if (f){
            return resultInfo.success();
        }else{
            return resultInfo.fail();
        }

    }
    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        //只要网页中传来的数据格式为yyyy-MM-dd 就会转化为Date类型
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
    }
    /**
     * @Description: 保存 新自行车对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleCRUD",method = RequestMethod.POST)
    public String savebicycle(HttpServletRequest request, @RequestParam("bianhao") String bianhao , @RequestParam("pinpai") String pinpai , @RequestParam("cid") Integer cid , @RequestParam("tianjiariqi") Date tianjiariqi, @RequestParam("beizhu") String beizhu , @RequestParam("status") String status , @RequestParam("zldid") Integer zldid , @RequestParam(value="image",required=false)  MultipartFile file){
        bicycle bicycle = new bicycle();
        bicycle.setBianhao(bianhao);
        bicycle.setPinpai(pinpai);
        bicycle.setCid(cid);
        bicycle.setTianjiariqi(tianjiariqi);
        bicycle.setBeizhu(beizhu);
        bicycle.setStatus(status);
        bicycleService.savebicycle(bicycle);
        bicycle vobicycle = bicycleService.getbicyclexinxibybianhao(bianhao);
        Integer vobicycleid=vobicycle.getBicycleid();
        bicycleguishu bicycleguishu = new bicycleguishu();
        bicycleguishu.setBid(vobicycleid);
        bicycleguishu.setZid(zldid);
        bicycleGuishuService.savebg(bicycleguishu);
        bicycleimage bicycleimage = new bicycleimage();
        bicycleimage.setBid(vobicycleid);
        bicycleimage.setImage(file.getOriginalFilename());
        bicycleImageService.savebi(bicycleimage);
        String filename=file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("images/");
        try {
            file.transferTo(new File(path,filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "GLYbicycle";
    }
    /**
     * @Description: 保存 新自行车对象 toZLD
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycletozldCRUD",method = RequestMethod.POST)
    public String savebicycletozld(HttpServletRequest request, @RequestParam("bianhao") String bianhao , @RequestParam("pinpai") String pinpai , @RequestParam("cid") Integer cid , @RequestParam("tianjiariqi") Date tianjiariqi, @RequestParam("beizhu") String beizhu , @RequestParam("status") String status , @RequestParam("zldid") Integer zldid , @RequestParam(value="image",required=false)  MultipartFile file){
        bicycle bicycle = new bicycle();
        bicycle.setBianhao(bianhao);
        bicycle.setPinpai(pinpai);
        bicycle.setCid(cid);
        bicycle.setTianjiariqi(tianjiariqi);
        bicycle.setBeizhu(beizhu);
        bicycle.setStatus(status);
        bicycleService.savebicycle(bicycle);
        bicycle vobicycle = bicycleService.getbicyclexinxibybianhao(bianhao);
        Integer vobicycleid=vobicycle.getBicycleid();
        bicycleguishu bicycleguishu = new bicycleguishu();
        bicycleguishu.setBid(vobicycleid);
        bicycleguishu.setZid(zldid);
        bicycleGuishuService.savebg(bicycleguishu);
        bicycleimage bicycleimage = new bicycleimage();
        bicycleimage.setBid(vobicycleid);
        bicycleimage.setImage(file.getOriginalFilename());
        bicycleImageService.savebi(bicycleimage);
        String filename=file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("images/");
        try {
            file.transferTo(new File(path,filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ZLDbicycle";
    }
    /**
     * @Description: 根据自行车id查询单个自行车对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleCRUD/{id}",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getbicyclexinxi(@PathVariable("id")Integer bicycleid){
        bicycle bicyclexinxi = bicycleService.getbicyclexinxi(bicycleid);
        return resultInfo.success().add("bicyclexinxi",bicyclexinxi);
    }
    /**
     * @Description: 自行车更新信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleupdateCRUD", method = RequestMethod.POST)
    public String saveupdatebicycle(HttpServletRequest request,@RequestParam("bicycleid") Integer bicycleid ,  @RequestParam("bianhao") String bianhao , @RequestParam("pinpai") String pinpai , @RequestParam("cid") Integer cid , @RequestParam("tianjiariqi") Date tianjiariqi, @RequestParam("beizhu") String beizhu , @RequestParam("status") String status , @RequestParam("zldid") Integer zldid , @RequestParam(value="image",required=false)  MultipartFile file){
        bicycle bicycleupdate = new bicycle();
        bicycleupdate.setBicycleid(bicycleid);
        bicycleupdate.setBianhao(bianhao);
        bicycleupdate.setPinpai(pinpai);
        bicycleupdate.setCid(cid);
        bicycleupdate.setTianjiariqi(tianjiariqi);
        bicycleupdate.setBeizhu(beizhu);
        bicycleupdate.setStatus(status);
        bicycleService.updatebicycle(bicycleupdate);
        bicycleguishu bicycleguishuupdate = new bicycleguishu();
        bicycleguishuupdate.setBzid(bicycleGuishuService.findbybidgetguishu(bicycleid));
        bicycleguishuupdate.setBid(bicycleid);
        bicycleguishuupdate.setZid(zldid);
        bicycleGuishuService.updatebgs(bicycleguishuupdate);
        bicycleimage bicycleimageupdate = new bicycleimage();
        bicycleimageupdate.setImageid(bicycleImageService.findbybidget(bicycleid));
        bicycleimageupdate.setBid(bicycleid);
        bicycleimageupdate.setImage(file.getOriginalFilename());
        bicycleImageService.updatebi(bicycleimageupdate);
        String filename=file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("images/");
        try {
            file.transferTo(new File(path,filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "GLYbicycle";
    }
    /**
     * @Description: 自行车更新信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleupdatetozldCRUD", method = RequestMethod.POST)
    public String saveupdatebicycletozld(HttpServletRequest request,@RequestParam("bicycleid") Integer bicycleid ,  @RequestParam("bianhao") String bianhao , @RequestParam("pinpai") String pinpai , @RequestParam("cid") Integer cid , @RequestParam("tianjiariqi") Date tianjiariqi, @RequestParam("beizhu") String beizhu , @RequestParam("status") String status , @RequestParam("zldid") Integer zldid , @RequestParam(value="image",required=false)  MultipartFile file){
        bicycle bicycleupdate = new bicycle();
        bicycleupdate.setBicycleid(bicycleid);
        bicycleupdate.setBianhao(bianhao);
        bicycleupdate.setPinpai(pinpai);
        bicycleupdate.setCid(cid);
        bicycleupdate.setTianjiariqi(tianjiariqi);
        bicycleupdate.setBeizhu(beizhu);
        bicycleupdate.setStatus(status);
        bicycleService.updatebicycle(bicycleupdate);
        bicycleguishu bicycleguishuupdate = new bicycleguishu();
        bicycleguishuupdate.setBzid(bicycleGuishuService.findbybidgetguishu(bicycleid));
        bicycleguishuupdate.setBid(bicycleid);
        bicycleguishuupdate.setZid(zldid);
        bicycleGuishuService.updatebgs(bicycleguishuupdate);
        bicycleimage bicycleimageupdate = new bicycleimage();
        bicycleimageupdate.setImageid(bicycleImageService.findbybidget(bicycleid));
        bicycleimageupdate.setBid(bicycleid);
        bicycleimageupdate.setImage(file.getOriginalFilename());
        bicycleImageService.updatebi(bicycleimageupdate);
        String filename=file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("images/");
        try {
            file.transferTo(new File(path,filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "ZLDbicycle";
    }
    /**
     * @Description: 删除传入字符串以-分割
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @ResponseBody
    @RequestMapping(value = "/bicycleCRUD/{ids}",method = RequestMethod.DELETE)
    public resultInfo deletebicycleByid(@PathVariable("ids")String ids){
        if(ids.contains("-")){
            String[] str_ids = ids.split("-");
            List<Integer> dids=new ArrayList<>();
            for (String string:str_ids){
                dids.add(Integer.parseInt(string));

            }
            bicycleGuishuService.deletebicycleguishuStrings(dids);
            bicycleImageService.deletebicycleimageStrings(dids);
            try {
                errService.deletebicycleerrStrings(dids);
                jiehuanService.deletebicyclejiehuanStrings(dids);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                bicycleService.deletebicycleStrings(dids);
            } catch (Exception e) {
                e.printStackTrace();
                bicycleImageService.deletebicycleimageStrings(dids);
                bicycleService.deletebicycleStrings(dids);
            }

        }else{
            Integer id= Integer.parseInt(ids);
            bicycleGuishuService.deletebicycleguishu(id);
            bicycleImageService.deletebicycleimage(id);
            try {
                errService.deletebicycleerr(id);
                jiehuanService.deletebicyclejiehuan(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                bicycleService.deletebicycle(id);
            } catch (Exception e) {
                e.printStackTrace();
                bicycleImageService.deletebicycleimage(id);
                bicycleService.deletebicycle(id);
            }

        }
        return resultInfo.success();
    }
    /**
     * @Description: 分页显示管理员自行车管理byzld
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicycleZLDCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycleWithJsonZLD(HttpServletRequest req,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        Integer zldid= (Integer)req.getSession().getAttribute("zldid");
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.getAllbyzldid(zldid);
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示模糊查询自行车
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/chaxunzldidCRUD",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo getAllbicyclebychaxunzldid(HttpServletRequest request,@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "E",defaultValue = "")String E){
//        String Ex = "\"%"+E+"%\"";
//        System.out.println(Ex);
        Integer zldid = (Integer)request.getSession().getAttribute("zldid");
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.mohuchaxunzldid(E,zldid);
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示模糊查询自行车
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/chaxunCRUD",method = RequestMethod.POST)
    @ResponseBody
    public resultInfo getAllbicyclebychaxun(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "E",defaultValue = "")String E){
//        String Ex = "\"%"+E+"%\"";
//        System.out.println(Ex);
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.mohuchaxun(E);
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
    * @Description: 分页显示管理员自行车管理
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    @RequestMapping(value = "/bicycleCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycleWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.getAll();
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示管理员自行车管理zldid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicyclewithzldidCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycleWithJsonzldid(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "zldid")Integer zldid){
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.getAllbyzldid(zldid);
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 分页显示管理员自行车管理cid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicyclewithcidCRUD",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllbicycleWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "cid")Integer cid){
        PageHelper.startPage(pn,5);
        List<bicycle> bicycleList=bicycleService.getAllbycid(cid);
        PageInfo page=new PageInfo(bicycleList,5);

        return resultInfo.success().add("pageInfo",page);
    }
    /**
     * @Description: 修改自行车状态为维护
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicyclebaoxiuCRUD/{errid}",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo changeastatustotwo(@PathVariable(value = "errid")Integer errid){
        bicycle cstatus = new bicycle();
        cstatus.setBicycleid(errid);
        cstatus.setStatus("2");
        bicycleService.changstatus(cstatus);
        return resultInfo.success();
    }
    /**
     * @Description: 修改自行车状态为正常
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/bicyclezhengchangCRUD/{errid}",method = RequestMethod.GET)
    @ResponseBody
    public resultInfo changeastatustoone(@PathVariable(value = "errid")Integer errid){
        bicycle cstatus = new bicycle();
        cstatus.setBicycleid(errid);
        cstatus.setStatus("1");
        bicycleService.changstatus(cstatus);
        return resultInfo.success();
    }
}
