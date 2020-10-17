package com.petstle.mapper;

import java.util.List;

import com.petstle.domain.Response;

public interface ResponseMapper {
	public List<Response> listResponseOnRequest(String reqid);
	public void newResponse(Response res);
	public void selectResponse(Response res);
	public void deleteResponse(String resid);
}
