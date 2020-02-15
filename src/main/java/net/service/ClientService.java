package net.service;

import net.javabean.Client;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;


public interface ClientService
{
	//单条插入
	public int addClientOnly(Client client);
	//查询账号
	public Client findById(String account);
	//全表查询
	public ArrayList<Client> queryTest(Client client);
	//删除用户
	public int deleteByAccount(String account);
}
