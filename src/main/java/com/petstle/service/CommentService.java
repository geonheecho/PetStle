package com.petstle.service;

import java.util.List;

import com.petstle.domain.CommentVo;



public interface CommentService {
	
	public List<CommentVo> listComment(String c_repid);
	public int CommentInsert(CommentVo commentVo);
	public CommentVo detailComment(int cno);//11 12번 
	public int CommentUpdate(CommentVo commentVo);
	public int CommentDelete(int cno);
	
		
}
