package cn.flin.service;

import cn.flin.bean.bicycleguishu;
import cn.flin.bean.bicycleguishuExample;
import cn.flin.bean.bicycleimage;
import cn.flin.dao.bicycleguishuMapper;
import cn.flin.dao.bicycleimageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: BicycleGuishuService
 * @Author: FLin
 * @Date: 2020/1/30 19:54
 * @Description:
 */
@Service
public class BicycleGuishuService {
    @Autowired
    private bicycleguishuMapper bicycleguishuMapper;
    /**
     * @Description:  删除自行车通过id列表bicycleid  删除归属外键关系
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleguishuStrings(List<Integer> ids) {
        bicycleguishuExample bicycleguishuExample = new bicycleguishuExample();
        cn.flin.bean.bicycleguishuExample.Criteria criteria = bicycleguishuExample.createCriteria();
        criteria.andBidIn(ids);
        bicycleguishuMapper.deleteByExample(bicycleguishuExample);
    }
    /**
     * @Description: 删除自行车通过id 归属外键
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleguishu(Integer id) {
        bicycleguishuMapper.deleteByPrimaryKey(id);
    }
    /**
    * @Description: 保存新
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void savebg(bicycleguishu bicycleguishu){
        bicycleguishuMapper.insertSelective(bicycleguishu);
    }
    /**
     * @Description: 通过bid找guishuid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public Integer findbybidgetguishu(Integer bid){
        bicycleguishuExample bicycleguishuExample = new bicycleguishuExample();
        cn.flin.bean.bicycleguishuExample.Criteria criteria = bicycleguishuExample.createCriteria();
        criteria.andBidEqualTo(bid);
        List<bicycleguishu> bicycleguishus = bicycleguishuMapper.selectByExample(bicycleguishuExample);
        bicycleguishu bicycleguishuss = bicycleguishus.get(0);
        return bicycleguishuss.getBzid();
    }
    /**
     * @Description: 更新
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void updatebgs(bicycleguishu bicycleguishu){
        bicycleguishuMapper.updateByPrimaryKeySelective(bicycleguishu);
    }
}
