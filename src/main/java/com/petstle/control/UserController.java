package com.petstle.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petstle.domain.LogInfo;
import com.petstle.domain.User;
import com.petstle.domain.UserAuth;
import com.petstle.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService lservice;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	

	@GetMapping("login")
	public String loginForm() {
		if(lservice.isLogged())
			return "redirect:/";
		return "login";
	}
	@PostMapping("login")
	public String login() {
		return "redirect:/";
	}
	@GetMapping("logout")
	public String logout() {
		lservice.logout();
		return "redirect/";
	}
	
	@GetMapping("join")
	public String joinForm() {
		if(lservice.isLogged())
			return "redirect:/";
		if(request.getAttribute("jsw") == null) {
			request.setAttribute("jsw", "ann");
			return "user/j_t";
		}
		String jsw = request.getAttribute("jsw").toString();
		if(jsw.substring(0, 1).equals("x")) {
			request.setAttribute("jsw", "xan");
			return "user/j_a";
		}
		if(jsw.substring(0, 2).equals("xx")) {
			request.setAttribute("jsw", "xxa");
			return "user/j_i";
		}
		return "redirect:";
	}
	@PostMapping("j_t")
	public String join_term() {
		if(lservice.isLogged())
			return "redirect:/";
		if(request.getAttribute("jsw") == null)
			return "redirect:/";
		String jsw = request.getAttribute("jsw").toString();
		if(jsw.substring(0, 1).equals("ann")) {
			request.setAttribute("jsw", "xnn");
			return "join";
		}
		return "redirect:/";
	}
	@PostMapping("j_a")
	public String join_auth(UserAuth ua) {
		if(lservice.isLogged())
			return "redirect:/";
		if(request.getAttribute("jsw") == null)
			return "redirect:/";
		String jsw = request.getAttribute("jsw").toString();
		if(jsw.substring(0, 1).equals("xan")) {
			request.setAttribute("ua", ua);
			request.setAttribute("jsw", "xxn");
			return "join";
		}
		return "redirect:/";
	}
	@PostMapping("j_i")
	public String join_info(User u, String pw) {
		if(lservice.isLogged())
			return "redirect:/";
		if(request.getAttribute("jsw") == null)
			return "redirect:/";
		String jsw = request.getAttribute("jsw").toString();
		if(jsw.substring(0, 1).equals("xxa")) {
			UserAuth ua = (UserAuth)request.getAttribute("ua");
			u.setName(ua.getName());
			u.setGender(ua.getGender());
			u.setBirth(ua.getBirth());
			u.setUnique_key(ua.getUnique_key());
			u.setUnique_in_site(ua.getUnique_in_site());
			lservice.joinUser(u, pw);
			return "redirect:login";
		}
		return "redirect:/";
	}
	
	@GetMapping("info")
	public ModelAndView userInfo() {
		if(!lservice.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("user/info");
		User user = lservice.detailUser();
		mav.addObject("user", user);
		return mav;
	}
	
	@GetMapping("del")
	public String deleteUser(String usrid) {
		if(!lservice.isLogged())
			return "redirect:/";
		lservice.deleteUser(usrid);
		lservice.logout();
		return "redirect:/";
	}
	
	@GetMapping("edit")
	public ModelAndView editForm() {
		if(!lservice.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("user/edit");
		User user = lservice.detailUser();
		mav.addObject("user", user);
		return mav;
	}
	@PostMapping("edit")
	public String edit(User user) {
		if(!lservice.isLogged())
			return "redirect:/";
		lservice.updateUser(user);
		return "redirect:info";
	}
}
