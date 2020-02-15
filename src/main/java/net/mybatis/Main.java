package net.mybatis;

import net.javabean.Client;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main
{
	//插入方法 MyBatis
 	public static void main(String[] args)
	{
//		//多条数据插入
//		Client client =new Client();
//		client.setAccount("1004");
//		client.setPassword("123");
//		client.setSexy("男");
//		client.setEducation("大专");
//		client.setProfession("工人");
//		client.setPhone("12345678887");
//		client.setEmail("8797898@163.com");
//		client.setRegtime(new Date().toLocaleString());
//
////		List<Client> list =new ArrayList<>();
////		list.add(client);
//
//		SqlSession sqlSession= MyBatisUtil.getSqlSession();
//
//		ClientDao clientDao=sqlSession.getMapper(ClientDao.class);
//
//
//
//		clientDao.findById(client);
//		sqlSession.commit();
//		System.out.println(client.getClientid());
//		sqlSession.close();

		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");

		Client client=(Client) ac.getBean("client");

		System.out.println(client.getAccount());


	}
}
