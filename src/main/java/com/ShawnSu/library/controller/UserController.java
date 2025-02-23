package com.ShawnSu.library.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ShawnSu.library.BaseController;
import com.ShawnSu.library.entity.User;
import com.ShawnSu.library.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Autowired
	private UserService service;

	@GetMapping
	public String load(Model model) {
		initializeData(model);
		List<User> data = service.findAll();
		model.addAttribute("title", "User 使用者");
		model.addAttribute("hasData", (data != null && data.size() > 0));
		model.addAttribute("columns", Arrays.asList("功能", "使用者名稱", "手機", "密碼", "註冊日期時間", "最後登入日期時間"));
		model.addAttribute("data", data);
		return "user";
	}

	@DeleteMapping("/remove/{id}")
	public ResponseEntity<HashMap<String, Object>> remove(@PathVariable(name = "id") Long id) {
		return ResponseEntity.ok(service.remove(id));
	}

}
