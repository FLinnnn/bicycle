package cn.flin.dao;

import cn.flin.bean.jiehuan;
import cn.flin.bean.jiehuanExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface jiehuanMapper {
    long countByExample(jiehuanExample example);

    int deleteByExample(jiehuanExample example);

    int deleteByPrimaryKey(Integer jiehuanid);

    int insert(jiehuan record);

    int insertSelective(jiehuan record);

    List<jiehuan> selectByExample(jiehuanExample example);

    jiehuan selectByPrimaryKey(Integer jiehuanid);


    List<jiehuan> selectByExampleWithzldAndyhAndbicycle(jiehuanExample example);

    jiehuan selectByPrimaryKeyWithzldAndyhAndbicycle(Integer jiehuanid);

    List<jiehuan> selectBylikesjiehuan(@Param("Ex") String Ex);

    List<jiehuan> selectBylikesjiehuanbyuserid(@Param("Ex") String Ex,@Param("yhid") Integer yhid);

    List<jiehuan> selectByuseridKeyWithzldAndyhAndbicyclebyuserid(Integer jiehuanid);

    List<jiehuan> selectByzldidKeyWithzldAndyhAndbicyclebyzldid(Integer bzldid);

    int updateByExampleSelective(@Param("record") jiehuan record, @Param("example") jiehuanExample example);

    int updateByExample(@Param("record") jiehuan record, @Param("example") jiehuanExample example);

    int updateByPrimaryKeySelective(jiehuan record);

    int updateByPrimaryKey(jiehuan record);
}