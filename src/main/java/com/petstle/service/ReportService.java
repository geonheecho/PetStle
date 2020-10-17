package com.petstle.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petstle.domain.Picture;
import com.petstle.domain.Report;
import com.petstle.domain.Request;


@Service
public interface ReportService {

	public List<Report> listReportOnRequest();
	public List<Report> listReportOnUser(@Param("susr") String susr, @Param("rusr") String rusr);
	
	public Report detailReport(String repid);//content
	
	public String newReport(Report rep, MultipartHttpServletRequest files)throws Exception;//insert
	
	
	public void updateReport(Report rep);//update
	
	public void deleteReport(String repid);//delete
	
	public void attachPictureOnReport(Picture pic);
	
	public Request getRequest(String repid);
	
	//public boolean checkwrite(Report rep);
	
	/*
	ReportListResult getReportListResult(int page, int pageSize);
	Report getReport(String  repid);
	ReportListResult getReportListResultByKeyword(String keyword, int page, int pageSize);
	*/

}
