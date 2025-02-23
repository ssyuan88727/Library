package com.ShawnSu.library.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ShawnSu.library.BaseController;
import com.ShawnSu.library.entity.BorrowingRecord;
import com.ShawnSu.library.service.BorrowingRecordService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/borrowingRecord")
public class BorrowingRecordController extends BaseController {
	@Autowired
	private BorrowingRecordService service;
	
	@GetMapping
	public String load(Model model, HttpSession session) {
		initializeData(model);
		List<BorrowingRecord> data = service.findByUserPhoneNumber((String) session.getAttribute("phoneNumber"));
		model.addAttribute("title", "Borrowing Record 借閱紀錄");
		model.addAttribute("hasData", (data != null && data.size() > 0));
		model.addAttribute("columns", Arrays.asList("功能", "借用者", "國際標準書號", "書名", "借出日期時間", "歸還日期時間"));
		model.addAttribute("data", data);
		return "borrowingRecord";
	}
	
	@PostMapping("/returnBook/{recordId}")
	public ResponseEntity<HashMap<String, Object>> returnBook(@PathVariable(name = "recordId") String recordId) {
		return ResponseEntity.ok(service.returnBook(recordId));
	}
}
