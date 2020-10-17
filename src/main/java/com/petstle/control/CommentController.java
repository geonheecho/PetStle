package com.petstle.control;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petstle.domain.CommentVo;

import com.petstle.service.CommentService;
import com.petstle.verification.VerifyUser;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/Comment")
public class CommentController {
	
	@Autowired
	private CommentService cservice;

	@Autowired
	private HttpSession session;
		
	@Autowired
	private LoginController login; //�븘吏� �븞�벝嫄�
	
	@Autowired
	private VerifyUser vservice;

	@RequestMapping("/list")
	@ResponseBody
	private List<CommentVo> CommentList(CommentVo commentVo){
		log.info("@@@2c_repid : " +commentVo );
		log.info("listComment �샇異�2");
		//List<CommentVo> comment_list = cservice.listComment(commentVo.getC_repid());
		log.info("certpid" + commentVo);
		return cservice.listComment(commentVo.getC_repid());		
	}
	
	/*@RequestMapping("/list")
	public ModelAndView listComment() {
	
			ModelAndView mv=new ModelAndView();
			List<CommentVo> comment_list = cservice.listComment();
			log.info("listComment �샇異�2");			
			mv.addObject("clist",comment_list);
			return mv;			
		}*/
	
/*	@RequestMapping("/insert")
	@ResponseBody
	public ModelAndView commentinsertform() {
		ModelAndView mv= new ModelAndView("Comment/write");
			return mv;
	}*/
	
	@RequestMapping("/insert")
	@ResponseBody
	public int CommentInsert(CommentVo commentVo) {
		log.info("#>而⑦듃濡ㅻ윭 �샇異�1 ");
		log.info("#>commentVo : "+commentVo);
		return cservice.CommentInsert(commentVo);
	}
	
	
	/*
	 * @RequestMapping("/update")
	 * 
	 * @ResponseBody public ModelAndView detailComment(int cno) {
	 * 
	 * CommentVo commentVo = cservice.detailComment(cno); ModelAndView mv= new
	 * ModelAndView("Comment/update"); mv.addObject("commentVo"+ commentVo); return
	 * mv; }
	 */
	
	@RequestMapping("/update")
	@ResponseBody
	public int CommentUpdate (CommentVo commentVo ) {
		
		cservice.CommentUpdate(commentVo);
		return cservice.CommentUpdate(commentVo);	
	}
	
    @RequestMapping("/delete") //�뙎湲� �궘�젣  
    @ResponseBody
    public int CommentDelete(int cno) {
    	cservice.CommentDelete(cno);
        return cservice.CommentDelete(cno);
    }
}
