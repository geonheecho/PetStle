package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private String revid; // 리뷰 id 무작위 문자열 8자
	private java.sql.Timestamp udate; // 등록 시간 연/월/일 시:분:초.00
	private String title; // 리뷰 제목
	private String content; // 리뷰 본문
	private int rate = 0; // 평점
	private float ravg = 0.0f; // 평점 평균, 시터 기준 집계시
	
	private String f_req; // 의뢰 id (참조)
	private String f_rusr; // 고객 id (참조)
	private String f_susr; // 시터 id (참조)
	
	private java.sql.Date startday; // 의뢰 시작일
	private java.sql.Date endday; // 의뢰 종료일
	private int amount = 0; // 의뢰 금액
	private String rname; // 고객 이름
	private String rid; // 
	private String sname; // 시터 이름
	private String sid; //
	
	// 아래는 호출 이름을 위한 compensation 메서드
	
	public String getRev() {return this.revid;}
	public void setRev(String rev) {this.revid = rev;}
	
	public java.sql.Timestamp getDate() {return this.udate;}
	public void setDate(java.sql.Timestamp date) {this.udate = date;}
	
	public String getReq() {return this.f_req;}
	public String getRusr() {return this.f_rusr;}
	public String getSusr() {return this.f_susr;}
	public void setReq(String req) {this.f_req = req;}
	public void setRusr(String rusr) {this.f_rusr = rusr;}
	public void setSusr(String susr) {this.f_susr = susr;}
}
