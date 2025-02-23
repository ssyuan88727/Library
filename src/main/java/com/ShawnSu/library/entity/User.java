package com.ShawnSu.library.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "[USER]")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userId;
	@Column(nullable = false, unique = true)
	private String phoneNumber;
	@Column(nullable = false)
	private String password;
	@Column(columnDefinition = "NVARCHAR(20)", nullable = false)
	private String userName;
	@Column(nullable = false)
	private LocalDateTime registrationTime;
	@Column
	private LocalDateTime lastLoginTime;

	public User() {
	}

	public User(String phoneNumber, String password, String userName, LocalDateTime registrationTime, LocalDateTime lastLoginTime) {
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.userName = userName;
		this.registrationTime = registrationTime;
		this.lastLoginTime = lastLoginTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDateTime getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(LocalDateTime registrationTime) {
		this.registrationTime = registrationTime;
	}

	public LocalDateTime getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(LocalDateTime lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

}
