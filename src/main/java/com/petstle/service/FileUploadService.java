package com.petstle.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petstle.domain.Picture;
import com.petstle.domain.Report;

public interface FileUploadService {
	
	public String addReportImg(Report rep, MultipartHttpServletRequest files) throws Exception;

}
