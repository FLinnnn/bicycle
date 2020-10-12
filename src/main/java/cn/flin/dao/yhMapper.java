package cn.flin.dao;

import cn.flin.bean.yh;
import cn.flin.bean.yhExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface yhMapper {
    long countByExample(yhExample example);

    int deleteByExample(yhExample example);

    int deleteByPrimaryKey(Integer uid);

    int insert(yh record);

    int insertSelective(yh record);

    List<yh> selectByExample(yhExample example);

    yh selectByPrimaryKey(Integer uid);

    int updateByExampleSelective(@Param("record") yh record, @Param("example") yhExample example);

    int updateByExample(@Param("record") yh record, @Param("example") yhExample example);

    int updateByPrimaryKeySelective(yh record);

    int updateByPrimaryKey(yh record);
}