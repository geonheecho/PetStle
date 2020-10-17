package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVo {

	private Integer cno;//댓글번호
	private String c_repid;//댓글이 달릴 해당게시글 참조
	private String content;//내용
	private String writerid;//댓글 작성자
	private java.sql.Timestamp c_udate;//댓글 작성시간 
	}
