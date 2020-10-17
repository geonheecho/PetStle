package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Response {
	private String resid;
	private java.sql.Timestamp applydate;
	private int status = 0;
	private String f_req;
	private String f_susr;
	private String sid;
	private int result = 0;
	
	public String getRes() {return this.resid;}
	public java.sql.Timestamp getDate() {return this.applydate;}
	public String getReq() {return this.f_req;}
	public String getSusr() {return this.f_susr;}
	
	public void setRes(String res) {this.resid = res;}
	public void setDate(java.sql.Timestamp date) {this.applydate = date;}
	public void setReq(String req) {this.f_req = req;}
	public void setSusr(String susr) {this.f_susr = susr;}
}
