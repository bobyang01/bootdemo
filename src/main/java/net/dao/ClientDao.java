package net.dao;

import net.javabean.Client;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ClientDao
{
	//多条插入方法
	public int addClient(List<Client> list);
	//单条插入
	public int addClientOnly(Client client);
	//查询账号
	public Client findById(String account);
	//全表查询
	public ArrayList<Client> queryTest(Client client);
	//删除用户
	public int deleteByAccount(String account);

}
