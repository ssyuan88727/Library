package com.ShawnSu.library.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ShawnSu.library.BaseController;
import com.ShawnSu.library.entity.Inventory;
import com.ShawnSu.library.service.InventoryService;

@Controller
@RequestMapping("/inventory")
public class InventoryController extends BaseController {
	@Autowired
	private InventoryService service;

	@GetMapping
	public String load(Model model) {
		initializeData(model);
		List<Inventory> data = service.findAll();
		model.addAttribute("title", "Inventory 庫存");
		model.addAttribute("hasData", (data.size() > 0));
		model.addAttribute("columns", Arrays.asList("國際標準書號", "書名", "書籍入庫(購買)日期時間", "書籍狀態"));
		model.addAttribute("data", data);
		return "inventory";
	}
}
