package com.petstle.service;

import javax.annotation.Resource;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.petstle.domain.Report;
import com.petstle.filesetting.FileUtils;



public class FileUploadServiceImpl  implements FileUploadService{

		@Resource(name="fileUtils")
		private FileUtils fileUtils;
		
		@Override
		public String addReportImg(Report rep, MultipartHttpServletRequest files)throws Exception {
			fileUtils.parseInsertFileInfo(rep, files);
			return null;
		}
}
