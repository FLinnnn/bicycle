package cn.flin.service;

import cn.flin.bean.yh;
import cn.flin.bean.yhExample;
import cn.flin.dao.yhMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: YhService
 * @Author: FLin
 * @Date: 2020/1/20 14:21
 * @Description:
 */
@Service
public class YhService {
    @Autowired
    private yhMapper yhMapper;
    /**
     * @Description: 获取所有用户信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<yh> getall(){
        return yhMapper.selectByExample(null);
    }
    /**
    * @Description: 更新
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void updateyh(yh yh){
        yhMapper.updateByPrimaryKeySelective(yh);
    }
    /**
    * @Description: 通过uid找yh对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public yh findbyuid(Integer uid){
        yh yh = yhMapper.selectByPrimaryKey(uid);
        return yh;
    }
    /**
    * @Description: 检查用户名重复
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public boolean checknewyhusername(String username) {
        yhExample yhExample = new yhExample();
        cn.flin.bean.yhExample.Criteria criteria = yhExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        long l = yhMapper.countByExample(yhExample);
        return l==0;
    }
    /**
    * @Description: 保存新用户
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void savenewyh(yh yh) {
        yhMapper.insertSelective(yh);
    }
    /**
    * @Description: 登录检查用户名和密码
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public boolean checkusernameandpassword(String username, String password) {
        yhExample yhExample = new yhExample();
        cn.flin.bean.yhExample.Criteria criteria = yhExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        long l = yhMapper.countByExample(yhExample);
        return l==0;
    }
    /**
    * @Description: 通过用户名找到yh对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public yh findByUsername(String username) {
        yhExample yhExample = new yhExample();
        cn.flin.bean.yhExample.Criteria criteria = yhExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<yh> yhs = yhMapper.selectByExample(yhExample);
        yh yh = yhs.get(0);
        return yh;
    }
    /**
     * @Description: 查询所有的用户信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<yh> getAll() {
        return yhMapper.selectByExample(null);
    }
    /**
     * @Description: 保存用户
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void saveyh(yh yh) {
        yhMapper.insertSelective(yh);
    }
    /**
     * @Description:  删除用户通过id列表
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deleteyhStrings(List<Integer> ids) {
        yhExample yhExample = new yhExample();
        cn.flin.bean.yhExample.Criteria criteria = yhExample.createCriteria();
        criteria.andUidIn(ids);
        yhMapper.deleteByExample(yhExample);
    }
    /**
     * @Description: 删除用户通过id
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deleteyh(Integer id) {
        yhMapper.deleteByPrimaryKey(id);
    }
}
