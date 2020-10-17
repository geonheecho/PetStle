package com.petstle.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petstle.domain.Pet;
import com.petstle.domain.Picture;
import com.petstle.domain.Report;
//import com.petstle.domain.ReportListResult;
//import com.petstle.domain.ReportVo;
import com.petstle.domain.Request;
import com.petstle.filesetting.FileUtils;
import com.petstle.mapper.FileMapper;
import com.petstle.mapper.ReportMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReportServiceImpl implements ReportService {
	
		@Autowired
		private ReportMapper rmapper;
		//추가한 부분
		@Autowired
		private FileMapper fmapper;
		
		//추가한 부분
		@Resource(name="fileUtils")
		private FileUtils fileUtils;
		
		
		@Override
		public List<Report> listReportOnRequest() {
			
			return rmapper.listReportOnRequest();
		}
		@Override
		public List<Report> listReportOnUser(@Param("susr") String susr, @Param("rusr") String rusr){
			log.info("#> susr : "+susr);
			return rmapper.listReportOnUser(susr,rusr);
		}
		
		@Override
		public Report detailReport(String repid) {
			log.info(">>>impl@@@ repid : "+ repid);
			return rmapper.detailReport(repid);
		}
	
		@Override
		@Transactional
		public String newReport(Report rep, MultipartHttpServletRequest files) throws Exception {		
			rmapper.newReport(rep);
			log.info("^**"+rep);
			List<Map<String, Object>> list= new ArrayList<Map<String ,Object>>();
			Map<String,Object> map = new HashMap<String, Object>();
			list = fileUtils.parseInsertFileInfo(rep, files);
			log.info("^!@#@!#!@#!@**"+list);
			map=list.get(0);
			log.info("map 비어있음");
			double fsize=0;
			String pext=null;
			pext = (String) map.get("pext");
			fsize = (Double)map.get("size");
			Picture pic=new Picture();
			pic.setPext(pext);
			pic.setSize(fsize);
			
			System.out.println(pext);
			System.out.println(fsize);
			fmapper.uploadReportImg(pic);
			rep.setF_pic(pic.getPicid());
			System.out.println(pic.getPicid());
			
			fileUtils.FileWrite(files, pic.getPic());
			rmapper.attachPictureOnReport(pic);
			rmapper.updateReport(rep);
			
	
				return null;
		}
		

		@Override
		public void updateReport(Report rep) {
			
			rmapper.updateReport(rep);
			
		}
		@Override
		public void deleteReport(String repid) {
			rmapper.deleteReport(repid);
			
		}
		@Override
		public void attachPictureOnReport(Picture pic) {
			// TODO Auto-generated method stub
			
		}
		@Override
		public Request getRequest(String repid) {
			return rmapper.getRequest(repid);
			
		}
		/*
		 * @Override public boolean checkwrite(Report rep) {
		 * 
		 * return false; }
		 */

}