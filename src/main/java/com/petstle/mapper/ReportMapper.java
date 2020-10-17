package com.petstle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petstle.domain.Picture;
import com.petstle.domain.Report;
import com.petstle.domain.Request;

public interface ReportMapper {
	public List<Report> listReportOnRequest();
	public List<Report> listReportOnUser(@Param("susr") String susr, @Param("rusr") String rusr);
	public Report detailReport(String repid);
	
	public void newReport(Report rep);
	public void attachPictureOnReport(Picture pic);
	public void updateReport(Report rep);
	public void deleteReport(String repid);
	public Request getRequest(String repid);
}
/*
xml
	<insert id="" parameterType="hashmap">
		inesrt TEST values(#{susr.sdadds}, #{susr.sadasd},#{rusr.asdasd}, #{rusr.sadas},#{rusr.asdasds}) 

1. @Parm

2. HashMap / Map
<Mapper.java>
public List<Report> listReportOnUser(HashMap<String, Object> query)
<Service>
--����ó��
--mapper ȣ�� ��
	HashMap<String, Object> query = new HashMap<String, Object>();
	Pet pet;
	Picture pic;
	query.put("susr", pet);
	query.put("rusr", pic);
	List<Report> list = mapper.listReportOnUser(query);
*/
