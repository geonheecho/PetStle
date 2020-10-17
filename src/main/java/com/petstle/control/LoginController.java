package com.petstle.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.petstle.domain.LogInfo;

@Controller
public class LoginController {
	@Autowired
	private HttpSession session;
	
	public boolean isLogged() {
		LogInfo login = (LogInfo)session.getAttribute("login");
		if(login == null)
			return false;
		if(login.getUsrid() == null) {
			session.invalidate();
			return false;
		}
		if(login.getUsrid().isEmpty()) {
			session.invalidate();
			return false;
		}
		return true;
	}
}
