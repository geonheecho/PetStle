package com.petstle.verification;

import com.petstle.EntityConstants;

public interface VerifyUserService extends EntityConstants {
	public boolean verify(String id, int type);
}
