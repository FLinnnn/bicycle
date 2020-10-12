package cn.flin.dao;

import cn.flin.bean.bicycle;
import cn.flin.bean.bicycleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface bicycleMapper {
    long countByExample(bicycleExample example);

    int deleteByExample(bicycleExample example);

    int deleteByPrimaryKey(Integer bicycleid);

    int insert(bicycle record);

    int insertSelective(bicycle record);

    List<bicycle> selectByExample(bicycleExample example);

    bicycle selectByPrimaryKey(Integer bicycleid);

    List<bicycle> selectByExampleWithCategoryAndImageAndZld(bicycleExample example);

    bicycle selectByPrimaryKeyWithCategoryAndImageAndZld(Integer bicycleid);

    List<bicycle> selectByzldidKeyWithCategoryAndImageAndZld(Integer zldid);

    List<bicycle> selectBycidAll(Integer cid);

    List<bicycle> selectBylikes(@Param("Ex") String Ex);

    List<bicycle> selectBylikesONLYONZLD(@Param("Ex") String Ex,@Param("zldid") Integer zldid);

    int updateByExampleSelective(@Param("record") bicycle record, @Param("example") bicycleExample example);

    int updateByExample(@Param("record") bicycle record, @Param("example") bicycleExample example);

    int updateByPrimaryKeySelective(bicycle record);

    int updateByPrimaryKey(bicycle record);
}