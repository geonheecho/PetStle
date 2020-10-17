package com.petstle.service;

import com.petstle.domain.LogInfo;
import com.petstle.domain.User;
import com.petstle.domain.UserAuth;

public interface UserService {
	public boolean isLogged();
	public String getLoggedUsrid();
	public LogInfo getLogin();
	public void logout();
	
	public String login(String email, String pw);
	
	public boolean checkDupEmail(String email);
	public int joinUser(User user, String pw);
	public void updateUser(User user);
	public void updatePw(String usrid, String pw);
	public void deleteUser(String usrid);
	
	public User detailUser();
}
