package com.petstle.service;

import java.util.List;

import com.petstle.domain.Pet;
import com.petstle.domain.Request;
import com.petstle.domain.Response;

public interface RequestService {
	public List<Request> listRequest();
	public List<Request> listRequest(String usrid);
	public Request detailRequest(String reqid);
	public List<Pet> listPetOnRequest(String reqid);
	public boolean newRequest(Request req, List<String> petList);
	public boolean addPetOnRequest(String reqid, String petid);
	public boolean updateRequest(Request request);
	public boolean deleteRequest(String reqid);
	public boolean addResponse(Response res);
	
	public List<Response> listResponseOnRequest(String reqid);
	public boolean deleteResponse(String resid);
	
	public boolean selectResponse(String resid);
}
