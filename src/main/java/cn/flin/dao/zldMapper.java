package cn.flin.dao;

import cn.flin.bean.zld;
import cn.flin.bean.zldExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface zldMapper {
    long countByExample(zldExample example);

    int deleteByExample(zldExample example);

    int deleteByPrimaryKey(Integer zldid);

    int insert(zld record);

    int insertSelective(zld record);

    List<zld> selectByExample(zldExample example);

    zld selectByPrimaryKey(Integer zldid);

    int updateByExampleSelective(@Param("record") zld record, @Param("example") zldExample example);

    int updateByExample(@Param("record") zld record, @Param("example") zldExample example);

    int updateByPrimaryKeySelective(zld record);

    int updateByPrimaryKey(zld record);
}