package net.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class MyBatisUtil
{
	public static SqlSession getSqlSession()
	{
		try{

		String path= "SqlMapConfig.xml";

		SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();

		Reader reader= Resources.getResourceAsReader(path);

		SqlSessionFactory sqlSessionFactory=sqlSessionFactoryBuilder.build(reader);

		SqlSession sqlSession=sqlSessionFactory.openSession();

		return  sqlSession;

		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
