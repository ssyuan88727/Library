package com.ShawnSu.library.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.User;
import com.ShawnSu.library.repository.UserRepository;

@Service
public class UserService {
	private final UserRepository repos;

	public UserService(UserRepository repos) {
		this.repos = repos;
	}

	public List<User> findAll() {
		return repos.findAll();
	}

	public HashMap<String, Object> remove(Long id) {
		boolean ok = false;
		String msg = "";
		try {
			repos.deleteById(id);
			ok = true;
			msg = "刪除成功";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ok", ok);
		map.put("msg", msg);
		return map;
	}
}
