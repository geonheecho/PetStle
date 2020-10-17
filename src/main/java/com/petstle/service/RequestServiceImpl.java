package com.petstle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petstle.domain.Pet;
import com.petstle.domain.Request;
import com.petstle.domain.Response;
import com.petstle.mapper.RequestMapper;
import com.petstle.mapper.ResponseMapper;

@Service
public class RequestServiceImpl implements RequestService {
	@Autowired
	private RequestMapper reqmapper;
	@Autowired
	private ResponseMapper resmapper;
	
	@Override
	public List<Request> listRequest() {
		return reqmapper.listRequest();
	}
	@Override
	public List<Request> listRequest(String usrid) {
		return reqmapper.listRequestOnRuser(usrid);
	}
	@Override
	public Request detailRequest(String reqid) {
		return reqmapper.detailRequest(reqid);
	}
	@Override
	public List<Pet> listPetOnRequest(String reqid) {
		return reqmapper.listPetOnRequest(reqid);
	}
	@Override
	@Transactional
	public boolean newRequest(Request req, List<String> petList) {
		String reqid = reqmapper.newRequest(req);
		for(String petid : petList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("reqid", reqid);
			map.put("petid", petid);
			reqmapper.addPetOnRequest(map);
		}
		return false;
	}
	@Override
	public boolean addPetOnRequest(String reqid, String petid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("reqid", reqid);
		map.put("petid", petid);
		reqmapper.addPetOnRequest(map);
		return false;
	}
	@Override
	public boolean updateRequest(Request request) {
		reqmapper.updateRequest(request);
		return false;
	}
	@Override
	public boolean deleteRequest(String reqid) {
		reqmapper.deleteRequest(reqid);
		return false;
	}

	@Override
	public List<Response> listResponseOnRequest(String reqid) {
		return resmapper.listResponseOnRequest(reqid);
	}
	@Override
	public boolean addResponse(Response res) {
		resmapper.newResponse(res);
		return false;
	}
	@Override
	public boolean deleteResponse(String resid) {
		resmapper.deleteResponse(resid);
		return false;
	}
	@Override
	public boolean selectResponse(String resid) {
		Response res = new Response();
		res.setResid(resid);
		resmapper.selectResponse(res);
		if(res.getResult() == 1)
			return true;
		return false;
	}
}
