package cn.flin.service;

import cn.flin.bean.category;
import cn.flin.dao.categoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: CategoryService
 * @Author: FLin
 * @Date: 2020/1/30 16:18
 * @Description:
 */
@Service
public class CategoryService {
    @Autowired
    private categoryMapper categoryMapper;
    /**
    * @Description: 查询所有分类信息
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public List<category> findAll() {
        return categoryMapper.selectByExample(null);
    }
}
