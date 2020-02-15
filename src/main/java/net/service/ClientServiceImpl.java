package net.service;

import net.dao.ClientDao;
import net.javabean.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ClientServiceImpl implements ClientService
{
	//使用注解,完成自动装配的工作，也就是直接获取到clientDao对象
	@Autowired
	private ClientDao clientDao;

	@Override
	public int addClientOnly(Client client)
	{
		int sum=clientDao.addClientOnly(client);
		return sum;
	}

	@Override
	public Client findById(String account)
	{
		Client id=clientDao.findById(account);
		return id;
	}

	@Override
	public ArrayList<Client> queryTest(Client client)
	{
		ArrayList<Client> list=clientDao.queryTest(client);
		return list;
	}

	@Override
	public int deleteByAccount(String account)
	{
		int sum=clientDao.deleteByAccount(account);
		return sum;
	}
}
