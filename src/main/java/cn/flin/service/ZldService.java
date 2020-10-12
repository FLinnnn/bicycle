package cn.flin.service;

import cn.flin.bean.zld;
import cn.flin.dao.zldMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: ZldService
 * @Author: FLin
 * @Date: 2020/1/17 15:45
 * @Description:
 */
@Service
public class ZldService {
    @Autowired
    private zldMapper zldMapper;
    /** 
    * @Description: 保存租赁点信息 
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public void savezld(zld zld){
        zldMapper.insertSelective(zld);
    }
    /** 
    * @Description: 查询所有租赁点 
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public List<zld> getzld() {
        List<zld> zldlist = zldMapper.selectByExample(null);
        return zldlist;
    }
    /** 
    * @Description: 查询所有租赁点 
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public List<zld> findAll() {
        return zldMapper.selectByExample(null);
    }
}
