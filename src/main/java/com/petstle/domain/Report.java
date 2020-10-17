package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private String repid; // 리포트 id 무작위 문자열 8자
	private java.sql.Timestamp udate; // 등록 시간 연/월/일 시:분:초.00
	private String title; // 리포트 제목
	private String content; // 리포트 본문
	private boolean readed = false; // 읽음 [생략]
	
	private int f_rst = 0; // 보고 상태 id (참조)
	private String f_req; // 의뢰 id (참조)
	private String f_susr; // 시터 id (참조)
	private String f_rusr; // 고객 id (참조)
	
	private String status; // 보고 상태 문자열
	private String rname; // 고객 이름
	private String rid; // 
	private String sname; // 시터 이름
	private String sid; //
	private String f_pic;
	
	// 아래는 호출 이름을 위한 compensation 메서드
	
	public String getRep() {return this.repid;}
	public void setRep(String rep) {this.repid = rep;}
	public java.sql.Timestamp getDate() {return this.udate;}
	public void setDate(java.sql.Timestamp date) {this.udate = date;}
	
	public int getRst() {return this.f_rst;}
	public String getReq() {return this.f_req;}
	public String getSusr() {return this.f_susr;}
	public String getRusr() {return this.f_rusr;}
	public void setRst(int rst) {this.f_rst = rst;}
	public void setReq(String req) {this.f_req = req;}
	public void setSusr(String susr) {this.f_susr = susr;}
	public void setRusr(String rusr) {this.f_rusr = rusr;}
	public String getPicid() {return this.f_pic;}
	public void setPicid(String picid) {this.f_pic = picid;}
}
