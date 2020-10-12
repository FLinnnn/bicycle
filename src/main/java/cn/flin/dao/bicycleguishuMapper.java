package cn.flin.dao;

import cn.flin.bean.bicycleguishu;
import cn.flin.bean.bicycleguishuExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface bicycleguishuMapper {
    long countByExample(bicycleguishuExample example);

    int deleteByExample(bicycleguishuExample example);

    int deleteByPrimaryKey(Integer bzid);

    int insert(bicycleguishu record);

    int insertSelective(bicycleguishu record);

    List<bicycleguishu> selectByExample(bicycleguishuExample example);

    bicycleguishu selectByPrimaryKey(Integer bzid);

    int updateByExampleSelective(@Param("record") bicycleguishu record, @Param("example") bicycleguishuExample example);

    int updateByExample(@Param("record") bicycleguishu record, @Param("example") bicycleguishuExample example);

    int updateByPrimaryKeySelective(bicycleguishu record);

    int updateByPrimaryKey(bicycleguishu record);
}