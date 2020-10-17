package com.petstle.filesetting;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petstle.domain.Report;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileUtils {
	
	public List<Map<String, Object>> parseInsertFileInfo(Report rep, MultipartHttpServletRequest mphsr)throws Exception{
		Iterator <String> iterator = mphsr.getFileNames();
		
		MultipartFile mpf=null;
		String ofname = null;
		String ofext =null;
		double fsize= 0;
		
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap= null;
		String repid=rep.getRepid();
		log.info("잘됨");
		
		while(iterator.hasNext()) {
			mpf=mphsr.getFile(iterator.next());
			if(mpf.isEmpty()== false)  {
			ofname = mpf.getOriginalFilename();
			ofext= ofname.substring(ofname.lastIndexOf("."));
			
			fsize=mpf.getSize();
			
			log.info("fsize" + fsize);
			listMap =new HashMap<String, Object>();
			listMap.put("repid",repid);
			listMap.put("size",fsize);
			listMap.put("pext",ofext);
			
			log.info("fsize" + ofext);
			list.add(listMap);
		}	
	}
		
		log.info(list);
	return list;
	}
	public void FileWrite(MultipartHttpServletRequest mphsr, String fileName)throws Exception{
		Iterator<String> iterator = mphsr.getFileNames();
		
		MultipartFile mpf=null;
		String ofname=null;
		String ofext=null;
		String storedFname=null;
		
		String root_path=mphsr.getSession().getServletContext().getRealPath("/");
		String attach_path= "uploads/pics/";//?경로?
		
		File file= new File(root_path+attach_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		while(iterator.hasNext()) {
			mpf=mphsr.getFile(iterator.next());
			if(mpf.isEmpty() == false) {
				ofname = mpf.getOriginalFilename();
				ofext = ofname.substring(ofname.lastIndexOf("."));
				storedFname= fileName+ofext;
				
				file= new File(root_path+attach_path+storedFname);
				mpf.transferTo(file);				
			}
		}
		System.out.print(root_path+attach_path+storedFname);
	}
}
