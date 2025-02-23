package com.ShawnSu.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.Inventory;
import com.ShawnSu.library.repository.InventoryRepository;

@Service
public class InventoryService {
	@Autowired
	private InventoryRepository repos;
	
	public List<Inventory> findAll() {
		return repos.findAll();
	}
}
