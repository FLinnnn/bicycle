package cn.flin.dao;

import cn.flin.bean.category;
import cn.flin.bean.categoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface categoryMapper {
    long countByExample(categoryExample example);

    int deleteByExample(categoryExample example);

    int deleteByPrimaryKey(Integer categoryid);

    int insert(category record);

    int insertSelective(category record);

    List<category> selectByExample(categoryExample example);

    category selectByPrimaryKey(Integer categoryid);

    int updateByExampleSelective(@Param("record") category record, @Param("example") categoryExample example);

    int updateByExample(@Param("record") category record, @Param("example") categoryExample example);

    int updateByPrimaryKeySelective(category record);

    int updateByPrimaryKey(category record);
}