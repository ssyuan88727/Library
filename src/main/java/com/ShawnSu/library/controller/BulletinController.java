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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ShawnSu.library.BaseController;
import com.ShawnSu.library.entity.Bulletin;
import com.ShawnSu.library.service.BulletinService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/bulletin")
public class BulletinController extends BaseController {
	@Autowired
	private BulletinService service;

	@GetMapping
	public String load(Model model) {
		initializeData(model);
		List<Bulletin> data = service.findAll();
		model.addAttribute("title", "Bulletin Board 公布欄");
		model.addAttribute("hasData", (data.size() > 0));
		model.addAttribute("columns", Arrays.asList("功能", "公告標題", "發佈者", "發佈日期", "截止日期"));
		model.addAttribute("data", data);
		return "bulletin";
	}

	@GetMapping("/add")
	public String add(Model model) {
		model.addAttribute("title", "Bulletin Board 公布欄");
		model.addAttribute("hasData", false);
		return "bulletinBody";
	}

	@GetMapping("/edit/{id}")
	public String goEdit(@PathVariable(name = "id") String id, Model model) {
		Bulletin data = service.findById(id).get();
		model.addAttribute("title", "Bulletin Board 公布欄");
		model.addAttribute("hasData", true);
		model.addAttribute("data", data);
		return "bulletinBody";
	}
	
	@PostMapping("/save")
	public ResponseEntity<HashMap<String, Object>> save(@ModelAttribute Bulletin bulletin, HttpSession session) {
		return ResponseEntity.ok(service.save(bulletin, session));
	}

	@DeleteMapping("/remove/{id}")
	public ResponseEntity<HashMap<String, Object>> remove(@PathVariable(name = "id") String id) {
		return ResponseEntity.ok(service.remove(id));
	}
}
