package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private String usrid;
	private String email;
	private String id;
	private String phone;
	private String zip;
	private String address1;
	private String address2;
	private String name;
	private String gender;
	private String birth;
	private String unique_key;
	private String unique_in_site;
	private java.sql.Timestamp joindate;
	private String district;
	private String usertype;
	private int f_uds = 0;
	private int f_utp = 0;
	private String f_pic;
	
	private String picid;
	private String pext;
	
	public String getPicAddr() {return picid + pext;}
	
	public int getUdsid() {return this.f_uds;}
	public int getUtpid() {return this.f_utp;}
	public int getUds() {return this.f_uds;}
	public int getUtp() {return this.f_utp;}
	public void setUds(int uds) {this.f_uds = uds;}
	public void setUtp(int utp) {this.f_utp = utp;}
}
