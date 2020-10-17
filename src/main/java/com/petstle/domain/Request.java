package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Request {
	private String reqid;
	private java.sql.Timestamp reqdate;
	private java.sql.Date startday;
	private java.sql.Date endday;
	private int amount = 0;
	private String rid;
	private String sid;
	private String rusr;
	private String susr;
	private String bill;
	
	public java.sql.Timestamp getDate() {return this.reqdate;}
	public void setDate(java.sql.Timestamp date) {this.reqdate = date;}
}
