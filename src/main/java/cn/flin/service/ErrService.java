package cn.flin.service;

import cn.flin.bean.err;
import cn.flin.bean.errExample;
import cn.flin.dao.errMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: ErrService
 * @Author: FLin
 * @Date: 2020/1/31 17:07
 * @Description:
 */
@Service
public class ErrService {
    @Autowired
    private errMapper errMapper;
    /**
     * @Description: 查询所有的自行车运维信息 通过zldid
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<err> getAllbyzldid(Integer zldid) {
        return errMapper.selectByzldidAll(zldid);
    }
    /**
     * @Description: 查询所有的自行车运维信息
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public List<err> getAll() {
        return errMapper.selectByExampleAll(null);
    }
    /**
     * @Description:  删除自行车通过id列表bicycleid  删除错误外键关系
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleerrStrings(List<Integer> ids) {
        errExample errExample = new errExample();
        cn.flin.bean.errExample.Criteria criteria = errExample.createCriteria();
        criteria.andBidIn(ids);
        errMapper.deleteByExample(errExample);
    }
    /**
     * @Description: 删除自行车通过id 错误外键
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void deletebicycleerr(Integer id) {
        errMapper.deleteByPrimaryKey(id);
    }
    /**
     * @Description: 保存新错误
     * @Param:
     * @return:
     * @Author: FLin
     * @Date:
     */
    public void saveer(err err){
        errMapper.insertSelective(err);
    }
}
