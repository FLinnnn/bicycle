package cn.flin.service;

import cn.flin.bean.zldgly;
import cn.flin.bean.zldglyExample;
import cn.flin.dao.zldglyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: ZldglyService
 * @Author: FLin
 * @Date: 2020/1/16 19:11
 * @Description:
 */
@Service
public class ZldglyService {
    @Autowired
    zldglyMapper zldglyMapper;
    /** 
    * @Description: 查询所有的租赁点管理员包含租赁点信息
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public List<zldgly> getAll() {
        return zldglyMapper.selectByExampleWithZld(null);
    }
    /**
    * @Description: 保存租赁点管理员
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void saveZldgly(zldgly zldgly) {
        zldglyMapper.insertSelective(zldgly);
    }
    /** 
    * @Description: 检查新的用户名是否重复
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public boolean checknewusername(String username) {
        zldglyExample zldglyExample = new zldglyExample();
        cn.flin.bean.zldglyExample.Criteria criteria = zldglyExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        long l = zldglyMapper.countByExample(zldglyExample);
        return l==0;
    }
    /**
    * @Description: 根据租赁点管理员id查询租赁点管理员的对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public zldgly getzldglyxinxi(Integer zldglyid) {
        zldgly zldgly = zldglyMapper.selectByPrimaryKeyWithZld(zldglyid);
        return zldgly;
    }
    /** 
    * @Description: 租赁点管理员更新
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public void updatezldgly(zldgly zldgly) {
        zldglyMapper.updateByPrimaryKeySelective(zldgly);
    }
    /**
    * @Description: 删除租赁点管理员通过id
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void deletezldgly(Integer id) {
        zldglyMapper.deleteByPrimaryKey(id);
    }
    /**
    * @Description:  删除租赁点管理员通过id列表
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void deletezldglyStrings(List<Integer> ids) {
        zldglyExample zldglyExample = new zldglyExample();
        cn.flin.bean.zldglyExample.Criteria criteria = zldglyExample.createCriteria();
         criteria.andZldglyidIn(ids);
        zldglyMapper.deleteByExample(zldglyExample);
    }
    /**
    * @Description:  校验用户名密码
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public boolean checkusernameandpassword(String username, String password) {
        zldglyExample  zldglyExample = new  zldglyExample();
        cn.flin.bean.zldglyExample.Criteria criteria =  zldglyExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        long l =  zldglyMapper.countByExample(zldglyExample);
        return l==0;
    }
    /**
    * @Description: 通过用户名查对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public zldgly findByUsername(String username) {
        zldglyExample zldglyExample = new zldglyExample();
        cn.flin.bean.zldglyExample.Criteria criteria = zldglyExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<zldgly> zldglys = zldglyMapper.selectByExample(zldglyExample);
        zldgly zldgly = zldglys.get(0);
        return zldgly;
    }
}
