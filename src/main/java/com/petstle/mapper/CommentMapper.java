package com.petstle.mapper;

import java.util.List;


import com.petstle.domain.CommentVo;


public interface CommentMapper {
	 
	//��۰���
	public int commentCount();
	//��� ���
	public List<CommentVo> CommentList(String c_repid);
	//��� �ۼ�
	public int CommentInsert(CommentVo comentvo);
	//��ۼ���
	public int CommentUpdate(CommentVo commentVo);
	
	public CommentVo detailComment(int cno);
	//��ۻ���
	public int CommentDelete(int cno );
}
