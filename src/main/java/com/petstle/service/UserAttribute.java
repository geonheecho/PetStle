package com.petstle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petstle.domain.Attribute;
import com.petstle.mapper.AttributeMapper;

@Service("UserAttribute")
public class UserAttribute implements AttributeService {
	@Autowired
	private AttributeMapper mapper;
	
	@Override
	public List<Attribute> getAttributeList(int entity) {
		switch(entity) {
		case USER_DISTRICT:
			return getUserDistrict();
		case USER_TYPE:
			return getUserType();
		}
		return null;
	}
	
	private List<Attribute> getUserDistrict() {
		return mapper.userDistrict();
	}
	private List<Attribute> getUserType() {
		return mapper.userType();
	}
}
