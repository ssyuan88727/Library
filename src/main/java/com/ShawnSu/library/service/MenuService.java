package com.ShawnSu.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.Menu;
import com.ShawnSu.library.repository.MenuRepository;

@Service
public class MenuService {
	@Autowired
	private MenuRepository repos;
	
	public List<Menu> findAll() {
		return repos.findAll();
	}
}
