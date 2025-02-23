package com.ShawnSu.library.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	boolean existsByPhoneNumber(String phoneNumber);

	boolean existsByUserName(String userName);

	boolean existsByUserNameAndPassword(String userName, String password);

	Optional<User> findByPhoneNumber(String phoneNumber);

	Optional<User> findByUserName(String userName);

	Optional<User> findByPhoneNumberAndPassword(String userName, String password);
}
