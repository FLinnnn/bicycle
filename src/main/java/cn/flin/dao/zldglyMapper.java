package cn.flin.dao;

import cn.flin.bean.zldgly;
import cn.flin.bean.zldglyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface zldglyMapper {
    long countByExample(zldglyExample example);

    int deleteByExample(zldglyExample example);

    int deleteByPrimaryKey(Integer zldglyid);

    int insert(zldgly record);

    int insertSelective(zldgly record);

    List<zldgly> selectByExample(zldglyExample example);

    zldgly selectByPrimaryKey(Integer zldglyid);

    List<zldgly> selectByExampleWithZld(zldglyExample example);

    zldgly selectByPrimaryKeyWithZld(Integer zldglyid);

    int updateByExampleSelective(@Param("record") zldgly record, @Param("example") zldglyExample example);

    int updateByExample(@Param("record") zldgly record, @Param("example") zldglyExample example);

    int updateByPrimaryKeySelective(zldgly record);

    int updateByPrimaryKey(zldgly record);
}