package com.petstle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Picture {
	private String refid;
	private String picid;
	private String pext;
	private double size = 0;
	private java.sql.Timestamp udate;
	
	public String getPic() {return this.picid;}
	public String getExt() {return this.pext;}
	public java.sql.Timestamp getDate() {return this.udate;}
	
	public void setPic(String pic) {this.picid = pic;}
	public void setExt(String ext) {this.pext = ext;}
	public void setDate(java.sql.Timestamp date) {this.udate = date;}
}
