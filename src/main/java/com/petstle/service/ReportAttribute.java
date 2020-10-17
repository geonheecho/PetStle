package com.petstle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petstle.domain.Attribute;
import com.petstle.mapper.AttributeMapper;

@Service("ReportAttribute")
public class ReportAttribute implements AttributeService {
	@Autowired
	private AttributeMapper mapper;
	
	@Override
	public List<Attribute> getAttributeList(int entity) {
		switch(entity) {
		case REPORT_STATUS:
			return getReportStatus();
		}
		return null;
	}
	
	public List<Attribute> getReportStatus() {
		return mapper.reportStatus();
	}

	
}
