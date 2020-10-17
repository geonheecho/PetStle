package com.petstle.verification;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petstle.domain.LogInfo;
import com.petstle.mapper.VerifyUserMapper;

@Service
public class VerifyUser implements VerifyUserService {
	@Autowired
	private VerifyUserMapper vmapper;
	@Autowired
	private HttpSession session;

	@Override
	public boolean verify(String id, int type) {
		switch(type) {
		case PET:
			return verifyUserPet(id);
		case REQUEST_RUSER:
			return verifyRuserRequest(id);
		case REQUEST_SUSER:
			return verifySuserRequest(id);
		case RESPONSE_SUSER:
			return verifySuserResponse(id);
		case RESPONSE_RUSER:
			return verifyRuserRequestOfResponse(id);
		case REPORT_RUSER:
			return verifyRuserReport(id);
		case REPORT_SUSER:
			return verifySuserReport(id);
		case REVIEW_RUSER:
			return verifyRuserReview(id);
		case REVIEW_SUSER:
			return verifySuserReview(id);
		}
		return false;
	}
	public boolean verifyUserPet(String petid) {
		String eusr = vmapper.petUser(petid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifyRuserRequest(String reqid) {
		String eusr = vmapper.reqRuser(reqid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifySuserRequest(String reqid) {
		String eusr = vmapper.reqSuser(reqid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifySuserResponse(String resid) {
		String eusr = vmapper.resSuser(resid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifyRuserRequestOfResponse(String resid) {
		String eusr = vmapper.reqResRuser(resid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifyRuserReport(String repid) {
		String eusr = vmapper.repRuser(repid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifySuserReport(String repid) {
		String eusr = vmapper.repSuser(repid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifyRuserReview(String revid) {
		String eusr = vmapper.revRuser(revid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
	public boolean verifySuserReview(String revid) {
		String eusr = vmapper.revSuser(revid);
		LogInfo login = (LogInfo)session.getAttribute("login");
		String usr = login.getUsrid();
		return eusr.equals(usr);
	}
}
