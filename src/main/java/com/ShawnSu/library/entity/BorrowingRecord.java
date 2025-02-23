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
@Table(name = "BorrowingRecord")
public class BorrowingRecord {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long recordId;
	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	private User user;
	@ManyToOne
	@JoinColumn(name = "inventoryId", nullable = false)
	private Inventory inventory;
	@Column(nullable = false)
	private LocalDateTime borrowingTime;
	@Column
	private LocalDateTime returnDateTime;

	public BorrowingRecord() {
	}

	public BorrowingRecord(User user, Inventory inventory, LocalDateTime borrowingTime, LocalDateTime returnDateTime) {
		this.user = user;
		this.inventory = inventory;
		this.borrowingTime = borrowingTime;
		this.returnDateTime = returnDateTime;
	}

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public LocalDateTime getBorrowingTime() {
		return borrowingTime;
	}

	public void setBorrowingTime(LocalDateTime borrowingTime) {
		this.borrowingTime = borrowingTime;
	}

	public LocalDateTime getReturnDateTime() {
		return returnDateTime;
	}

	public void setReturnDateTime(LocalDateTime returnDateTime) {
		this.returnDateTime = returnDateTime;
	}

}
