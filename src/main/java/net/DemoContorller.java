package net;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoContorller
{




	@RequestMapping("/hello")
	@ResponseBody
	public String text(){
		return "hello,spring boot!!";
	}

}
