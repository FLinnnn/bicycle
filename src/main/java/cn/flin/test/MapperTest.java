package cn.flin.test;

import cn.flin.bean.gly;
import cn.flin.dao.glyMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	glyMapper glyMapper;
	
	@Autowired
	SqlSession sqlSession;

	@Test
	public void testCRUD(){
		System.out.println(glyMapper);
		

		glyMapper mapper = sqlSession.getMapper(glyMapper.class);
		for(int i = 0;i<5;i++){
			String uid = UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insertSelective(new gly(null,uid+"ceshi",uid+"ceshi"));
		}
		System.out.println("批量添加管理员完成");
		
	}

}
