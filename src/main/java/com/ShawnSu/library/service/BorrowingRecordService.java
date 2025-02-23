package com.ShawnSu.library.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.BorrowingRecord;
import com.ShawnSu.library.repository.BorrowingRecordRepository;

@Service
public class BorrowingRecordService {
	@Autowired
	private BorrowingRecordRepository borrowingRecordRepos;

	public List<BorrowingRecord> findByUserPhoneNumber(String phoneNumber) {
		return borrowingRecordRepos.findByUserPhoneNumber(phoneNumber);
	}

	public HashMap<String, Object> returnBook(String recordId) {
		boolean ok = false;
		String msg = "";

		try {
			Optional<BorrowingRecord> brOpt = borrowingRecordRepos
					.findByRecordIdAndReturnDateTimeIsNull(Long.parseLong(recordId));
			if (!brOpt.isPresent())
				throw new Exception("此書已歸還!!");

			BorrowingRecord br = brOpt.get();
			br.getInventory().setStatus("在庫");
			br.setReturnDateTime(LocalDateTime.now());
			borrowingRecordRepos.save(br);

			ok = true;
			msg = "還書成功!!";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("ok", ok);
		hm.put("msg", msg);
		return hm;
	}
}
