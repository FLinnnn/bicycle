package cn.flin.dao;

import cn.flin.bean.err;
import cn.flin.bean.errExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface errMapper {
    long countByExample(errExample example);

    int deleteByExample(errExample example);

    int deleteByPrimaryKey(Integer errid);

    int insert(err record);

    int insertSelective(err record);

    List<err> selectByExample(errExample example);

    err selectByPrimaryKey(Integer errid);

    List<err> selectByExampleAll(errExample example);

    err selectByPrimaryKeyAll(Integer errid);

    List<err> selectByzldidAll(Integer zldid);

    int updateByExampleSelective(@Param("record") err record, @Param("example") errExample example);

    int updateByExample(@Param("record") err record, @Param("example") errExample example);

    int updateByPrimaryKeySelective(err record);

    int updateByPrimaryKey(err record);
}