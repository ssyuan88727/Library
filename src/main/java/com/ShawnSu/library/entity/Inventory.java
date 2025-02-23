package com.ShawnSu.library.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Inventory")
public class Inventory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long inventoryId;
	@ManyToOne
	@JoinColumn(name = "isbn", nullable = false)
	private Book book;
	@Column(nullable = false)
	private LocalDateTime storeTime;
	@Column(nullable = false)
	private String status;

	public Inventory() {
	}

	public Inventory(Book book, LocalDateTime storeTime, String status) {
		this.book = book;
		this.storeTime = storeTime;
		this.status = status;
	}

	public Long getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(Long inventoryId) {
		this.inventoryId = inventoryId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public LocalDateTime getStoreTime() {
		return storeTime;
	}

	public void setStoreTime(LocalDateTime storeTime) {
		this.storeTime = storeTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
