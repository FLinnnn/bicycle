package cn.flin.controller;

import cn.flin.bean.category;
import cn.flin.bean.resultInfo;
import cn.flin.service.CategoryService;
import cn.flin.utils.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * @PackageName: cn.flin.controller
 * @ClassName: CategoryController
 * @Author: FLin
 * @Date: 2020/1/30 16:15
 * @Description:
 */
@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    /**
     * @Description: 不分页显示分类信息并输出
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping(value = "/categoryExcelCRUD", method = RequestMethod.GET)
    @ResponseBody
    public resultInfo getAllcategorytoExcel(HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        List<category> all = categoryService.findAll();
        String filePath = realPath+"fenleixinxibiao.xlsx";
        ExcelUtil.writeWithTemplate(filePath,all);
        return resultInfo.success();
    }
    /**
     * @Description: 返回分类信息在自行车管理员表
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    @RequestMapping("/category")
    @ResponseBody
    public resultInfo getCategory(){
        List<category> list=categoryService.findAll();
        return resultInfo.success().add("categorylist",list);
    }
}
