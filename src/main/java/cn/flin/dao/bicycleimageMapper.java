package cn.flin.dao;

import cn.flin.bean.bicycleimage;
import cn.flin.bean.bicycleimageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface bicycleimageMapper {
    long countByExample(bicycleimageExample example);

    int deleteByExample(bicycleimageExample example);

    int deleteByPrimaryKey(Integer imageid);

    int insert(bicycleimage record);

    int insertSelective(bicycleimage record);

    List<bicycleimage> selectByExample(bicycleimageExample example);

    bicycleimage selectByPrimaryKey(Integer imageid);

    int updateByExampleSelective(@Param("record") bicycleimage record, @Param("example") bicycleimageExample example);

    int updateByExample(@Param("record") bicycleimage record, @Param("example") bicycleimageExample example);

    int updateByPrimaryKeySelective(bicycleimage record);

    int updateByPrimaryKey(bicycleimage record);
}