package com.ShawnSu.library.service;

import java.time.LocalDateTime;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.ShawnSu.library.dto.UserDTO;
import com.ShawnSu.library.entity.User;
import com.ShawnSu.library.repository.UserRepository;
import com.ShawnSu.library.util.encrypt;

@Service
public class RegisterService {
	private final UserRepository repos;

	public RegisterService(UserRepository repos) {
		this.repos = repos;
	}

	private User dtoToEntity(User user, UserDTO dto) {
		user.setUserId(dto.getUserId());
		user.setPhoneNumber(dto.getPhoneNumber());
		user.setPassword(dto.getPassword());
		user.setUserName(dto.getUserName());
		user.setRegistrationTime(dto.getRegistrationTime());
		user.setLastLoginTime(dto.getLastLoginTime());
		return user;
	}

	public HashMap<String, Object> register(UserDTO dto) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		boolean ok = false;
		String msg = "";
		try {
			String phoneNumber = dto.getPhoneNumber();
			if (repos.existsByPhoneNumber(phoneNumber)) {
				msg += "[手機號碼已註冊]";
			} else if (!phoneNumber.matches("^09\\d{8}$")) {
				msg += "[手機號碼格式錯誤]";
			}
			if (repos.existsByUserName(dto.getPhoneNumber()))
				msg += "[使用者名稱已註冊]";
			if (!msg.isEmpty())
				throw new Exception(msg);

			dto.setPassword(encrypt.saltHash(dto.getPassword()));
			dto.setRegistrationTime(LocalDateTime.now());
			repos.save(dtoToEntity(new User(), dto));

			ok = true;
			msg = "註冊成功!!";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		hm.put("ok", ok);
		hm.put("msg", msg);
		return hm;
	}
}
