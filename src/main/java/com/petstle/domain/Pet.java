package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pet {
	private String petid;
	private String uname;
	private java.sql.Timestamp udate;
	private String name;
	private int age = 0;
	private int weight = 0;
	private String gender;
	private String neutralization;
	private String breed;
	private String bowel;
	private String separation;
	private String handicap;
	private String aggrtomen;
	private String aggrtopet;
	private int dayprice = 0;
	private String f_usr;
	private String f_pic;
	private int f_gen = 0;
	private int f_neu = 0;
	private int f_brd = 0;
	private int f_bow = 0;
	private int f_sep = 0;
	private int f_han = 0;
	private int f_atm = 0;
	private int f_atp = 0;
	
	public String getId() {return this.petid;}
	public void setId(String id) {this.petid = id;}
	public String getPet() {return this.petid;}
	public void setPet(String pet) {this.petid = pet;}
	
	public String getUsrid() {return this.f_usr;}
	public void setUsrid(String usrid) {this.f_usr = usrid;}
	public String getPicid() {return this.f_pic;}
	public void setPicid(String picid) {this.f_pic = picid;}
	
	public void setGen(int gen) {this.f_gen = gen;}
	public void setNeu(int neu) {this.f_neu = neu;}
	public void setBrd(int brd) {this.f_brd = brd;}
	public void setBow(int bow) {this.f_bow = bow;}
	public void setSep(int sep) {this.f_sep = sep;}
	public void setHan(int han) {this.f_han = han;}
	public void setAtm(int atm) {this.f_atm = atm;}
	public void setAtp(int atp) {this.f_atp = atp;}
	public int getGen() {return this.f_gen;}
	public int getNeu() {return this.f_neu;}
	public int getBrd() {return this.f_brd;}
	public int getBow() {return this.f_bow;}
	public int getSep() {return this.f_sep;}
	public int getHan() {return this.f_han;}
	public int getAtm() {return this.f_atm;}
	public int getAtp() {return this.f_atp;}
}
