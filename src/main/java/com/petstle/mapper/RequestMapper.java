package com.petstle.mapper;

import java.util.List;
import java.util.Map;

import com.petstle.domain.Pet;
import com.petstle.domain.Request;

public interface RequestMapper {
	public List<Request> listRequest();
	public List<Request> listRequestOnRuser(String rusrid);
	public Request detailRequest(String reqid);
	public List<Pet> listPetOnRequest(String reqid);
	public String newRequest(Request request);
	public void addPetOnRequest(Map<String, String> map);
	public void updateRequest(Request request);
	public void deleteRequest(String reqid);
}
