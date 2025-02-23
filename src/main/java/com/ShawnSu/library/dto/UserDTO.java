package com.ShawnSu.library.dto;

import java.time.LocalDateTime;

import jakarta.validation.constraints.NotNull;

public class UserDTO {
	private Long userId;
	@NotNull
	private String phoneNumber;
	@NotNull
	private String password;
	@NotNull
	private String userName;
	@NotNull
	private LocalDateTime registrationTime;
	private LocalDateTime lastLoginTime;

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

	public void setRegistrationTime(LocalDateTime registationTime) {
		this.registrationTime = registationTime;
	}

	public LocalDateTime getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(LocalDateTime lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

}
