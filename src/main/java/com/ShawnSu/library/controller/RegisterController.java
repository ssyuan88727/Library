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
import com.ShawnSu.library.service.RegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	private RegisterService service;

	@GetMapping
	public String load(Model model) {
		model.addAttribute("title", "Register 註冊");
		return "register";
	}

	@PostMapping
	public ResponseEntity<HashMap<String, Object>> register(@ModelAttribute UserDTO dto) {
		return ResponseEntity.ok(service.register(dto));
	}
}
