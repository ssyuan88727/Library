package com.ShawnSu.library.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.BorrowingRecord;

@Repository
public interface BorrowingRecordRepository extends JpaRepository<BorrowingRecord, Long> {
	List<BorrowingRecord> findByUserPhoneNumber(String phoneNumber);

	Optional<BorrowingRecord> findByRecordIdAndReturnDateTimeIsNull(Long recordId);
}
