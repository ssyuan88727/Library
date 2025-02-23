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
import com.ShawnSu.library.entity.Book;
import com.ShawnSu.library.service.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/book")
public class BookController extends BaseController {
	@Autowired
	private BookService service;

	@GetMapping
	public String load(Model model) {
		initializeData(model);
		List<Book> data = service.findAll();
		model.addAttribute("title", "Book 書籍");
		model.addAttribute("hasData", (data != null && data.size() > 0));
		model.addAttribute("columns", Arrays.asList("功能", "國際標準書號", "書名", "作者", "書籍內容簡介"));
		model.addAttribute("data", data);
		return "book";
	}
	
	@PostMapping("/borrow/{isbn}")
	public ResponseEntity<HashMap<String, Object>> borrow(@PathVariable(name = "isbn") String isbn, HttpSession session) {
		return ResponseEntity.ok(service.borrow(isbn, session));
	}
}
