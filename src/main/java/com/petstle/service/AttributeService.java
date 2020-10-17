package com.petstle.service;

import java.util.List;

import com.petstle.EntityConstants;
import com.petstle.domain.Attribute;

public interface AttributeService extends EntityConstants {
	public List<Attribute> getAttributeList(int entity);
}
