package cc.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/clientMember/")
public class ClientMemberController {
//로그인창으로 이동
	@RequestMapping("login_form")
	public String login_form() {
		return "member/login";
	}
	
	@RequestMapping("sign") 
	public String sign() throws Exception {
		return "member/clientSignup";
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}

}