/*package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class ReportVo {
	String keyword;//for 검색을 위해서 !
	
	private int page;//페이지 번호
	private int pageSize;//페이지사이즈!
	
	public int getStartRow() {
		return (page-1)*pageSize;
	}
	public int getEndRow() {
		return page*pageSize;
	}
	
}
*/