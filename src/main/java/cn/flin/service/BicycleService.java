package cn.flin.service;

import cn.flin.bean.bicycle;
import cn.flin.bean.bicycleExample;
import cn.flin.dao.bicycleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: BicycleService
 * @Author: FLin
 * @Date: 2020/1/30 16:31
 * @Description:
 */
@Service
public class BicycleService {

    @Autowired
    private bicycleMapper bicycleMapper;
    /**
     * @Description: 模糊查询onlyonzldid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<bicycle> mohuchaxunzldid(String Ex,Integer zldid){
        List<bicycle> bicycleList = bicycleMapper.selectBylikesONLYONZLD(Ex,zldid);
        return bicycleList;
    }
    /**
    * @Description: 模糊查询
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public List<bicycle> mohuchaxun(String Ex){
        List<bicycle> bicycleList = bicycleMapper.selectBylikes(Ex);
        return bicycleList;
    }
    /**
     * @Description: 检查自行车新增报修bicycleid是否重复或不存在
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public boolean checkbicycleid(Integer bicycleid) {
        bicycleExample bicycleExample = new bicycleExample();
        cn.flin.bean.bicycleExample.Criteria criteria = bicycleExample.createCriteria();
        criteria.andBicycleidEqualTo(bicycleid);
        long l = bicycleMapper.countByExample(bicycleExample);
        return l==1;
    }
    /**
     * @Description: 检查新的自行车编号是否重复
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public boolean checknewbianhao(String bianhao) {
        bicycleExample bicycleExample = new bicycleExample();
        cn.flin.bean.bicycleExample.Criteria criteria = bicycleExample.createCriteria();
        criteria.andBianhaoEqualTo(bianhao);
        long l = bicycleMapper.countByExample(bicycleExample);
        return l==0;
    }
    /**
     * @Description: 根据自行车bianhao查询单个自行车对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public bicycle getbicyclexinxibybianhao(String bianhao) {
        bicycleExample bicycleExample = new bicycleExample();
        cn.flin.bean.bicycleExample.Criteria criteria = bicycleExample.createCriteria();
        criteria.andBianhaoEqualTo(bianhao);
        List<bicycle> bicycleList = bicycleMapper.selectByExample(bicycleExample);
        bicycle bicycle=bicycleList.get(0);
        return bicycle;
    }
    /**
     * @Description: 保存自行车
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void savebicycle(bicycle bicycle) {
        bicycleMapper.insertSelective(bicycle);
    }
    /**
     * @Description: 根据自行车id查询单个自行车对象
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public bicycle getbicyclexinxi(Integer bicycleid) {
        bicycle bicycle = bicycleMapper.selectByPrimaryKeyWithCategoryAndImageAndZld(bicycleid);
        return bicycle;
    }
    /**
     * @Description: 自行车信息更新
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void updatebicycle(bicycle bicycle) {
        bicycleMapper.updateByPrimaryKeySelective(bicycle);
    }
    /**
     * @Description: 删除自行车通过id
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycle(Integer id) {
        bicycleMapper.deleteByPrimaryKey(id);
    }
    /**
     * @Description:  删除自行车通过id列表bicycleid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleStrings(List<Integer> ids) {
        bicycleExample bicycleExample = new bicycleExample();
        cn.flin.bean.bicycleExample.Criteria criteria = bicycleExample.createCriteria();
        criteria.andBicycleidIn(ids);
        bicycleMapper.deleteByExample(bicycleExample);
    }
    /**
     * @Description: 查询所有的自行车信息bycid 分类
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<bicycle> getAllbycid(Integer cid) {
        return bicycleMapper.selectBycidAll(cid);
    }
    /**
     * @Description: 查询所有的自行车信息byzldid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<bicycle> getAllbyzldid(Integer zldid) {
        return bicycleMapper.selectByzldidKeyWithCategoryAndImageAndZld(zldid);
    }
    /**
     * @Description: 查询所有的自行车信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<bicycle> getAll() {
        return bicycleMapper.selectByExampleWithCategoryAndImageAndZld(null);
    }
    /**
    * @Description: 更新status
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void changstatus(bicycle bicycle){
        bicycleMapper.updateByPrimaryKeySelective(bicycle);
    }
}
