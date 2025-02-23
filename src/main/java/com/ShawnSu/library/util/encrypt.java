package com.ShawnSu.library.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class encrypt {
	private static final String mySalt = "HiThisIsShawnSuNiceToMeetYou";

	public static String saltHash(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hashBytes = md.digest((password + mySalt).getBytes());
		return Base64.getEncoder().encodeToString(hashBytes);
	}
}
