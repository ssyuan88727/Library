package com.ShawnSu.library.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ShawnSu.library.dto.UserDTO;
import com.ShawnSu.library.entity.User;
import com.ShawnSu.library.repository.UserRepository;
import com.ShawnSu.library.util.encrypt;

import jakarta.servlet.http.HttpSession;

@Service
public class LoginService {
	private final UserRepository repos;

	public LoginService(UserRepository repos) {
		this.repos = repos;
	}

	public HashMap<String, Object> login(UserDTO dto, HttpSession session) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		boolean ok = false;
		String msg = "";

		try {
			String phoneNumber = dto.getPhoneNumber();
			dto.setPassword(encrypt.saltHash(dto.getPassword()));
			Optional<User> userOpt = repos.findByPhoneNumberAndPassword(phoneNumber, dto.getPassword());
			if (!phoneNumber.matches("^09\\d{8}$")) {
				msg += "手機號碼格式錯誤!!";
			} else if (!repos.existsByPhoneNumber(phoneNumber)) {
				msg += "手機號碼尚未註冊!!";
			} else if (!userOpt.isPresent()) {
				msg += "密碼錯誤!!";
			}
			if (!msg.isEmpty())
				throw new Exception(msg);

			User user = userOpt.get();
			user.setLastLoginTime(LocalDateTime.now());
			repos.save(user);
			
			session.setAttribute("phoneNumber", user.getPhoneNumber());
			session.setAttribute("userName", user.getUserName());
			ok = true;
			msg = "登入成功!!";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		hm.put("ok", ok);
		hm.put("msg", msg);
		return hm;
	}
}
