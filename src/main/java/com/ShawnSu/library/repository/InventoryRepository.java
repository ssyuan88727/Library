package com.ShawnSu.library.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.Inventory;

@Repository
public interface InventoryRepository extends JpaRepository<Inventory, Long> {
	public Optional<Inventory> findByBook_Isbn(String isbn);
}
