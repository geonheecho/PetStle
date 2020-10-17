package com.petstle.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petstle.Constants;
import com.petstle.domain.Pet;
import com.petstle.domain.Request;
import com.petstle.domain.Response;
import com.petstle.service.UserServiceImpl;
import com.petstle.service.PetService;
import com.petstle.service.RequestService;
import com.petstle.verification.VerifyUserService;

@Controller
@RequestMapping("req")
public class RequestController implements Constants {
	@Autowired
	private RequestService rservice;
	@Autowired
	private PetService pservice;
	@Autowired
	private VerifyUserService vservice;
	
	@Autowired
	private UserServiceImpl login;
	
	@RequestMapping("")
	public String rtnToHome() {
		return "redirect:/";
	}
	
	@GetMapping("list")
	public ModelAndView listRequest() {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView();
		String usrid = login.getLoggedUsrid();
		List<Request> rlist = rservice.listRequest(usrid);
		mav.addObject("rlist", rlist);
		return mav;
	}
	@GetMapping("req")
	public ModelAndView detailRequest(String id) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		if(!vservice.verify(id, REQUEST_RUSER) && vservice.verify(id, REQUEST_SUSER))
			return new ModelAndView("redirect:req/list");
		ModelAndView mav = new ModelAndView("req/req_detail");
		Request req = rservice.detailRequest(id);
		List<Pet> plist = rservice.listPetOnRequest(id);
		mav.addObject("req", req);
		mav.addObject("plist", plist);
		return mav;
	}
	@GetMapping("add")
	public ModelAndView addRequestForm() {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("req/req_add");
		String usrid = login.getLoggedUsrid();
		List<Pet> list = pservice.listPet(usrid);
		mav.addObject("list",list);
		return mav;
	}
	@PostMapping("add")
	public String addRequest(Request req, List<String> pets) {
		if(!login.isLogged())
			return "redirect:/";
		String usrid = login.getLoggedUsrid();
		req.setRusr(usrid);
		rservice.newRequest(req, pets);
		return "redirect:list";
	}
	@GetMapping("edit")
	public ModelAndView editRequestForm(String id) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		if(!vservice.verify(id, REQUEST_RUSER))
			return new ModelAndView("redirect:list");
		ModelAndView mav = new ModelAndView("req/req_edit");
		Request req = rservice.detailRequest(id);
		List<Pet> plist = rservice.listPetOnRequest(id);
		mav.addObject("req", req);
		mav.addObject("plist", plist);
		return mav;
	}
	@PostMapping("edit")
	public String editRequest(Request req, List<Pet> pets) {
		if(!login.isLogged())
			return "redirect:/";
		if(!vservice.verify(req.getReqid(), REQUEST_RUSER))
			return "redirect:list";
		rservice.updateRequest(req);
		return "redirect:list";
	}
	@GetMapping("del")
	public String deleteRequest(String id) {
		if(!login.isLogged())
			return "redirect:/";
		if(!vservice.verify(id, REQUEST_RUSER))
			return "redirect:list";
		rservice.deleteRequest(id);
		return "redirect:list";
	}

	@GetMapping("ap")
	public String applyRequest(String id) {
		if(!login.isLogged())
			return "redirect:/";
		String usrid = login.getLoggedUsrid();
		Response res = new Response();
		res.setReq(id);
		res.setSusr(usrid);
		rservice.addResponse(res);
		return "redirect:list";
	}
	@GetMapping("res/list")
	public ModelAndView listResponse(String id) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		if(!vservice.verify(id, REQUEST_RUSER))
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("req/res_list");
		List<Response> rlist = rservice.listResponseOnRequest(id);
		mav.addObject("rlist", rlist);
		return mav;
	}
	@GetMapping("res/del")
	public String deleteResponse(String id) {
		if(!login.isLogged())
			return "redirect:/";
		if(!vservice.verify(id, RESPONSE_SUSER))
			return "redirect:list";
		rservice.deleteResponse(id);
		return "redirect:list";
	}
	@GetMapping("res/sel")
	public String selectResponse(String id) {
		if(!login.isLogged())
			return "redirect:/";
		if(!vservice.verify(id, RESPONSE_RUSER))
			return "redirect:list";
		rservice.selectResponse(id);
		return "redirect:list";
	}
}
