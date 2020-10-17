package com.petstle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petstle.domain.CommentVo;
import com.petstle.domain.Report;
import com.petstle.mapper.CommentMapper;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {
	
	private CommentMapper cmapper;
	
	
	@Override
	public List<CommentVo> listComment(String c_repid){
		log.info("#> c_repid : "+ c_repid);
		
	return cmapper.CommentList(c_repid);
	}
	@Override
	public int CommentInsert(CommentVo commentVo) {
		return cmapper.CommentInsert(commentVo);
	}
	@Override
	public int CommentUpdate(CommentVo commentVo) {
		return cmapper.CommentUpdate(commentVo);
	}
	
	@Override
	public CommentVo detailComment(int cno) {
		return cmapper.detailComment(cno);
	}
	@Override
	public int CommentDelete(int cno) {
		//return cmapper.CommnetDelete(cno);
		return 0;
	}
}
