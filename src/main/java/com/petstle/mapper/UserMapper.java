package com.petstle.mapper;

import java.util.Map;

import com.petstle.domain.User;

public interface UserMapper {
	public int checkUser(String email);
	public String getUserCipher(String email);
	public String getUserId(String email);
	
	public void newUser(String usrid);
	public void updateUser(User user);
	public void authUser(User user);
	public void setUserType(User user);
	public void setUserPw(Map<String, String> map);
	public void deleteUser(String usrid);
	
	public User detailUser(String usrid);
}
