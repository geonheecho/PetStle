package com.petstle.control;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.petstle.StatusConstants;
import com.petstle.domain.Attribute;
import com.petstle.domain.LogInfo;
import com.petstle.domain.Report;
import com.petstle.domain.Request;
import com.petstle.service.ReportAttribute;
//import com.petstle.domain.ReportListResult;
import com.petstle.service.ReportService;
import com.petstle.verification.VerifyUser;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("Report")
public class ReportController implements StatusConstants{
	
	@Autowired
	private ReportService rservice;
	@Autowired
	private ReportAttribute rattrs; 
	
	
	private Request req;

	
	@Autowired
	private LoginController login;
	
	@Autowired
	private VerifyUser vservice;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("")
	public String rtnToHome() {
		return "redirect:/";
	}
	
	@GetMapping("list")
	public ModelAndView listReportOnRequest() {
		if(!login.isLogged())
			 return new ModelAndView("redirect:/");//로그인이 안되어있으면 index페이지로 감 . 
			ModelAndView mv=new ModelAndView("Report/list");
			LogInfo login=(LogInfo)session.getAttribute("login");
			String usrid=login.getUsrid();	//usrid를 가져옴		
			List<Report> report_list = rservice.listReportOnRequest();// report_list변수를 선언해주고 service에 listReportOnRequest를  변수에 넣어주고 report를 리스트에 담아줬다.
			log.info("report_list"+report_list);//찍어봤다 들어오는지 안들어오는지
			
			return mv; //리턴			
		}
	
	@GetMapping("write.do")
	public ModelAndView newReport(String repid) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mv=new ModelAndView("Report/write");	
		String usrid = (String)session.getAttribute("usrid"); 	
		List<Attribute> attrs= rattrs.getReportStatus();
		mv.addObject("attrs", attrs);//c:forEach문에 attrs에 담아서 보낼것이다. 
		return mv;
	}
	
	@PostMapping("write.do")
	public String newReport(Report rep, MultipartHttpServletRequest files) throws Exception{
		//sqldate-->utildate로 변환
		java.util.Date now = new java.util.Date();
		rep.setF_req("9NR3xdIY");//테스트 아이디.
		Request req =rservice.getRequest(rep.getF_req());
		
		if(!login.isLogged())	
			
			return "redirect:/";		
		//과거 날짜에 글을 쓸수가없고 미래 날짜에 글을쓸수가 없음 현재 날짜,시간에서만 쓰기위해 if문을 걸어줌
		if (req.getStartday().getTime()<= now.getTime() && now.getTime() < req.getEndday().getTime()) {
			
		  rservice.newReport(rep,files); 
		  
		  return "redirect:/"; 
		  }
		 
		
		return "redirect:list";	
	}
	
	@GetMapping("content")
	public ModelAndView detailReport(String repid) {
		
		//if(login.isLogged())	
		ModelAndView mv= new ModelAndView("Report/content");
		Report report=rservice.detailReport(repid);
		List<Attribute> attrs= rattrs.getReportStatus();
		mv.addObject("attrs", attrs); // attrs로 담아서 view 보내줌 
		mv.addObject("report",report);//마찬가지

		log.info(">>>repid"+repid);
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView update(String repid) {
		log.info("@@@@@@@@@@@@@@@@ repid : " + repid);		
		ModelAndView mv = new ModelAndView("Report/update");
		Report report= rservice.detailReport(repid);
		mv.addObject("report", report);
		return mv;
	}
	
	@PostMapping("update")
	public String update(Report rep) {
		
		log.info("@@@@@@@@@@@@@@@ repid : " + rep);
		//rep.setF_rst(0);
		rep.setF_req("TaY1Q5AY");
		rservice.updateReport(rep);
		return "redirect:list";
	}
}