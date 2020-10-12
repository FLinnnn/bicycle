package cn.flin.service;

import cn.flin.bean.bicycleimage;
import cn.flin.bean.bicycleimageExample;
import cn.flin.dao.bicycleimageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: BicycleImageService
 * @Author: FLin
 * @Date: 2020/1/30 19:54
 * @Description:
 */
@Service
public class BicycleImageService {
    @Autowired
    bicycleimageMapper bicycleimageMapper;
    /**
    * @Description: 通过bid找imageid
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public Integer findbybidget(Integer bid){
        bicycleimageExample bicycleimageExample = new bicycleimageExample();
        cn.flin.bean.bicycleimageExample.Criteria criteria = bicycleimageExample.createCriteria();
        criteria.andBidEqualTo(bid);
        List<bicycleimage> bicycleimages = bicycleimageMapper.selectByExample(bicycleimageExample);
        bicycleimage bicycleimagesss = bicycleimages.get(0);
        return bicycleimagesss.getImageid();
    }
    /** 
    * @Description: 查找通过bid yesornot
    * @Param:  
    * @return:  
    * @Author: FLin
    * @Date: 
    */
    public boolean findbybid(Integer bid){
        bicycleimageExample bicycleimageExample = new bicycleimageExample();
        cn.flin.bean.bicycleimageExample.Criteria criteria = bicycleimageExample.createCriteria();
        criteria.andBidEqualTo(bid);
        long l = bicycleimageMapper.countByExample(bicycleimageExample);
        return (l==1);
    }
    /**
     * @Description:  删除自行车通过id列表bicycleid  删除图片外键关系
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleimageStrings(List<Integer> ids) {
        bicycleimageExample bicycleimageExample = new bicycleimageExample();
        cn.flin.bean.bicycleimageExample.Criteria criteria = bicycleimageExample.createCriteria();
        criteria.andBidIn(ids);
        bicycleimageMapper.deleteByExample(bicycleimageExample);
    }
    /**
     * @Description: 删除自行车通过id 图片外键
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleimage(Integer id) {
        bicycleimageMapper.deleteByPrimaryKey(id);
    }
    /**
    * @Description: 保存一个新的
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public void savebi(bicycleimage bicycleimage){
        bicycleimageMapper.insertSelective(bicycleimage);
    }
    /**
     * @Description: 更新
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void updatebi(bicycleimage bicycleimage){
        bicycleimageMapper.updateByPrimaryKeySelective(bicycleimage);
    }
}
