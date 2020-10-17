package com.petstle.mapper;

import java.util.List;

import com.petstle.domain.Attribute;

public interface AttributeMapper {
	public List<Attribute> userDistrict();
	public List<Attribute> userType();
	public List<Attribute> reportStatus();
}
