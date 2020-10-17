package com.petstle.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petstle.StatusConstants;
import com.petstle.domain.LogInfo;
import com.petstle.domain.User;
import com.petstle.domain.UserAuth;
import com.petstle.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService, StatusConstants {
	@Autowired
	private UserMapper lmapper;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean isLogged() {
		LogInfo login = (LogInfo)session.getAttribute("login");
		if(login == null)
			return false;
		if(login.getUsrid() == null)
			return false;
		if(login.getUsrid().isEmpty())
			return false;
		return true;
	}

	@Override
	public String getLoggedUsrid() {
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usrid = login.getUsrid();
		return usrid;
	}

	@Override
	public LogInfo getLogin() {
		LogInfo login = (LogInfo)session.getAttribute("login");
		return login;
	}

	@Override
	public void logout() {
		session.invalidate();
	}

	@Override
	public String login(String email, String pw) {
		if(isLogged())
			return null;
		logout();
		try {
			Thread.sleep(new Random().nextInt(200));
		}catch(InterruptedException ie) {
			
		}
		String cipher = lmapper.getUserCipher(email);
		if(cipher == null || cipher.isEmpty())
			return null;
		if(!BCrypt.checkpw(pw, cipher))
			return null;
		String usrid = lmapper.getUserId(email);
		return usrid;
	}

	@Override
	public boolean checkDupEmail(String email) {
		if(lmapper.checkUser(email) == 0)
			return false;
		else
			return true;
	}

	@Override
	public int joinUser(User user, String pw) {
		if(checkDupEmail(user.getEmail()))
			return DUPLICATE;
		String usrid = null;
		lmapper.newUser(usrid);
		user.setUsrid(usrid);
		lmapper.authUser(user);
		updateUser(user);
		updatePw(usrid, pw);
		lmapper.setUserType(user); 
		return SUCCESS;
	}

	@Override
	public void updateUser(User user) {
		lmapper.updateUser(user);
	}

	@Override
	public void updatePw(String usrid, String pw) {
		String cipher = BCrypt.hashpw(pw, BCrypt.gensalt(12));
		Map<String, String> map = new HashMap<String, String>();
		map.put("usrid", usrid);
		map.put("pw", cipher);
		lmapper.setUserPw(map);
	}

	@Override
	public void deleteUser(String usrid) {
		if(getLoggedUsrid().equals(usrid))
			lmapper.deleteUser(usrid);
	}

	@Override
	public User detailUser() {
		String usrid = getLoggedUsrid();
		return lmapper.detailUser(usrid);
	}
}
