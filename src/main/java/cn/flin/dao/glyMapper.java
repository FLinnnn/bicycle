package cn.flin.dao;

import cn.flin.bean.gly;
import cn.flin.bean.glyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface glyMapper {
    long countByExample(glyExample example);

    int deleteByExample(glyExample example);

    int deleteByPrimaryKey(Integer adminid);

    int insert(gly record);

    int insertSelective(gly record);

    List<gly> selectByExample(glyExample example);

    gly selectByPrimaryKey(Integer adminid);

    int updateByExampleSelective(@Param("record") gly record, @Param("example") glyExample example);

    int updateByExample(@Param("record") gly record, @Param("example") glyExample example);

    int updateByPrimaryKeySelective(gly record);

    int updateByPrimaryKey(gly record);
}