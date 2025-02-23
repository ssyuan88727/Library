package com.ShawnSu.library.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ShawnSu.library.dto.UserDTO;
import com.ShawnSu.library.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService service;

	@GetMapping
	public String load(HttpSession session, Model model) {
		model.addAttribute("title", "Login 登入");
		session.removeAttribute("phoneNumber");
		session.removeAttribute("userName");
		return "login";
	}

	@PostMapping
	public ResponseEntity<HashMap<String, Object>> login(@ModelAttribute UserDTO dto, HttpSession session) {
		return ResponseEntity.ok(service.login(dto, session));
	}
}
