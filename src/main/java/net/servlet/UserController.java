package net.servlet;

import com.google.gson.Gson;
import net.javabean.Client;
import net.javabean.DemoObject;
import net.javabean.Document;
import net.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController
{

	@Autowired
	private ClientService clientService;

	@RequestMapping("/dologin")
	public @ResponseBody
	String dologin(String account, String password, HttpServletRequest request)
	{
		System.out.println("进来了");
		String result = "";
		Client client = clientService.findById(account);

		if (client != null)
		{
			if (client.getPassword().equals(password))
			{
				System.out.println(client.getAccount());
				//					WorkerImpl menu = new WorkerImpl();
				//					HashMap<String, ArrayList<Psymenu>> mapservlet = menu.menuMap(role);
				//					request.getSession().setAttribute("menumap",mapservlet);
				//					request.getSession().setAttribute("user",manager);
				result ="true";
				request.getSession().setAttribute("user",client.getAccount());
			} else
			{
				result = "nopwd";
			}
		}else{
			result = "noname";
		}
		return result;
	}

	@RequestMapping("/doReg")
	public @ResponseBody
	String doReg(Client client, HttpServletRequest request, HttpServletResponse response)
	{
		utf8(request,response);
		System.out.println("准备注册");
		String result = "";
		if(clientService.findById(client.getAccount())==null){
			client.setRegtime(getTime());
			clientService.addClientOnly(client);
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}

	@RequestMapping(value = "/doSearch",produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String doSearch(String page, String limit, String account, String education, String profession, HttpServletRequest request, HttpServletResponse response)
	{
		utf8(request,response);
		System.out.println("准备搜索");
		Client client=new Client();
//		//当前页
//		String page=request.getParameter("page");
//		System.out.println(page);
//		//条数
//		String limit=request.getParameter("limit");
//		System.out.println(limit);
		//账号
//		String account=request.getParameter("data[account]");
//		//学历
//		String education=request.getParameter("data[education]");
//		//职业
//		String profession=request.getParameter("data[profession]");
		System.out.println(account);
		System.out.println(education);
		System.out.println(profession);
		client.setAccount(account);
		client.setEducation(education);
		client.setProfession(profession);


		ArrayList<Client> list1 = clientService.queryTest(client);

		DemoObject demoObject=new DemoObject();

		demoObject.setCode(0);

		demoObject.setMsg("");

		int nowPage;
		List<Client> list=new ArrayList<>();

		if(list1.size()<Integer.valueOf(page)*Integer.valueOf(limit)){
			nowPage=list1.size();
		}else {
			nowPage=Integer.valueOf(page)*Integer.valueOf(limit);
		}

		for (int i = (Integer.valueOf(page)-1)*Integer.valueOf(limit); i <nowPage; i++)
		{
			list.add(list1.get(i));
		}
		demoObject.setCount(list1.size());
		demoObject.setData(list);

		String json =new Gson().toJson(demoObject);
		return json;
	}

	@RequestMapping("/uploadfile")
	//文件上传
	public @ResponseBody
	int uploadfile(@RequestParam("file") MultipartFile file, Document document, HttpServletRequest request)
	{
		String path=request.getServletContext().getRealPath("/WEB-INF/upload");
		String filename = file.getOriginalFilename();
		try
		{
			//			判断总目录是否存在
			File pathdocu=new File(path);
			if(!pathdocu.exists()){
				pathdocu.mkdir();
			}
			//			session里面的账户
			String pname= (String) request.getSession().getAttribute("user");
			//			判断以这个账号为命名目录的是否存在
			File pathpname=new File(path+"/"+pname);
			if(!pathpname.exists()){
				pathpname.mkdir();
			}
			//			判断这个标题的文档是否存在
			File pathwendang=new File(path+"/"+pname+"/"+document.getDocumentTitle());
			if(!pathwendang.exists()){
				pathwendang.mkdir();
				panduantype(filename);
				file.transferTo(new File(path+"/"+pname+"/"+document.getDocumentTitle()+"/" + filename));
			}
			else{
				//已经存在文档情况
				return 1;
			}
			panduantype(filename);

		} catch (IOException e)
		{
			e.printStackTrace();
		}
		//未存在文档情况,上传完成以后

		return 0;
	}


	@RequestMapping(value = "/doDelete",produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String doDelete(String account, HttpServletRequest request, HttpServletResponse response)
	{
		utf8(request,response);
		System.out.println("准备删除");
		System.out.println(account);
		String result="";
		int num=clientService.deleteByAccount(account);
		if (num>0){
			result="success";
		}else{
			result="nosuccess";
		}
		return result;
	}



	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat s = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		String format = s.format(date);
		return format;
	}

	//utf封装
	public void utf8(HttpServletRequest request, HttpServletResponse response){
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
	}

	//判断文档类型
	public String panduantype(String filename){
		String[] arr=filename.split("\\.");
		if(arr.length>0){
			System.out.println(arr[1]);
			return arr[1];
		}
		return "无类型";
	}
}
