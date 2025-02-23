package com.ShawnSu.library;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.ShawnSu.library.service.MenuService;

@Controller
public class BaseController {
	@Autowired
	private MenuService menuService;

	public void initializeData(Model model) {
		model.addAttribute("menus", menuService.findAll());
	}
}
