package cn.flin.service;

import cn.flin.bean.jiehuan;
import cn.flin.bean.jiehuanExample;
import cn.flin.dao.jiehuanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: JiehuanService
 * @Author: FLin
 * @Date: 2020/1/31 17:07
 * @Description:
 */
@Service
public class JiehuanService {
    @Autowired
    private jiehuanMapper jiehuanMapper;
    /**
     * @Description: 模糊查询byyhid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<jiehuan> mohuchaxunbyyhid(String Ex,Integer yhid){
        List<jiehuan> jiehuanList = jiehuanMapper.selectBylikesjiehuanbyuserid(Ex,yhid);
        return jiehuanList;
    }
    /**
     * @Description: 模糊查询
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<jiehuan> mohuchaxun(String Ex){
        List<jiehuan> jiehuanList = jiehuanMapper.selectBylikesjiehuan(Ex);
        return jiehuanList;
    }
    /**
     * @Description:  删除自行车通过id列表bicycleid  删除借还外键关系
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicyclejiehuanStrings(List<Integer> ids) {
        jiehuanExample jiehuanExample = new jiehuanExample();
        cn.flin.bean.jiehuanExample.Criteria criteria = jiehuanExample.createCriteria();
        criteria.andBidIn(ids);
        jiehuanMapper.deleteByExample(jiehuanExample);
    }
    /**
     * @Description: 删除自行车通过id 借还外键
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicyclejiehuan(Integer id) {
        jiehuanMapper.deleteByPrimaryKey(id);
    }
    /**
     * @Description: 保存新借还
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void savejiehuan(jiehuan jiehuan){
        jiehuanMapper.insertSelective(jiehuan);
    }
    /**
     * @Description: 查询所有的借还信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<jiehuan> getAll() {
        return jiehuanMapper.selectByExampleWithzldAndyhAndbicycle(null);

    }
    /**
     * @Description: 查询zld的借还信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<jiehuan> getAllonZLD(Integer bzldid) {
        return jiehuanMapper.selectByzldidKeyWithzldAndyhAndbicyclebyzldid(bzldid);

    }
    /**
     * @Description: 查询YH的借还信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<jiehuan> getAllonYH(Integer userid) {
        return jiehuanMapper.selectByuseridKeyWithzldAndyhAndbicyclebyuserid(userid);

    }
    /**
     * @Description: 根据借还id查询单个借还对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public jiehuan getjiehuanxinxi(Integer jiehuanid) {
        jiehuan jiehuan = jiehuanMapper.selectByPrimaryKeyWithzldAndyhAndbicycle(jiehuanid);
        return jiehuan;
    }
    /**
     * @Description: 更新
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void updatejiehuan(jiehuan jiehuan){
        jiehuanMapper.updateByPrimaryKeySelective(jiehuan);
    }
}
