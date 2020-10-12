package cn.flin.service;

import cn.flin.bean.gly;
import cn.flin.bean.glyExample;
import cn.flin.dao.glyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @PackageName: cn.flin.service
 * @ClassName: GlyService
 * @Author: FLin
 * @Date: 2020/1/20 15:42
 * @Description:
 */
@Service
public class GlyService {
    @Autowired
    private glyMapper glyMapper;
    /**
    * @Description: 校验用户名密码
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public boolean checkusernameandpassword(String username, String password) {
        glyExample glyExample = new glyExample();
        cn.flin.bean.glyExample.Criteria criteria = glyExample.createCriteria();
        criteria.andAdminusernameEqualTo(username);
        criteria.andAdminpasswordEqualTo(password);
        long l = glyMapper.countByExample(glyExample);
        return l==0;
    }
    /**
    * @Description: 通过用户名查对象
    * @Param:
    * @return:
    * @Author: FLin
    * @Date:
    */
    public gly findByUsername(String username) {
        glyExample glyExample = new glyExample();
        cn.flin.bean.glyExample.Criteria criteria = glyExample.createCriteria();
        criteria.andAdminusernameEqualTo(username);
        List<gly> glys = glyMapper.selectByExample(glyExample);
        gly gly = glys.get(0);
        return gly;
    }
}
