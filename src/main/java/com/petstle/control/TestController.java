package com.petstle.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petstle.domain.LogInfo;

@Controller
@RequestMapping("")
public class TestController {	
	@RequestMapping("")
	public String main(HttpSession session) {
		LogInfo login = new LogInfo();
		login.setUsrid("AHtcO8V8");
		session.setAttribute("login", login);
		
		return "main";
	}
}
