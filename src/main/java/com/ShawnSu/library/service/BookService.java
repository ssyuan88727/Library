package com.ShawnSu.library.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.Book;
import com.ShawnSu.library.entity.BorrowingRecord;
import com.ShawnSu.library.entity.Inventory;
import com.ShawnSu.library.repository.BookRepository;
import com.ShawnSu.library.repository.BorrowingRecordRepository;
import com.ShawnSu.library.repository.InventoryRepository;
import com.ShawnSu.library.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepos;
	@Autowired
	private InventoryRepository inventoryRepos;
	@Autowired
	private BorrowingRecordRepository borrowingRecordRepos;
	@Autowired
	private UserRepository userRepos;

	public List<Book> findAll() {
		return bookRepos.findAll();
	}

	public HashMap<String, Object> borrow(String isbn, HttpSession session) {
		boolean ok = false;
		String msg = "";

		try {
			Optional<Inventory> invOpt = inventoryRepos.findByBook_Isbn(isbn);
			Inventory inv = null;
			if (!invOpt.isPresent()) {
				msg = "此書籍無庫存!!";
			} else {
				inv = invOpt.get();
				if (!inv.getStatus().equals("在庫"))
					msg = "此書籍不可外借!!";
			}
			if (!msg.isEmpty())
				throw new Exception(msg);

			inv.setStatus("已借出");
			borrowingRecordRepos.save(
					new BorrowingRecord(userRepos.findByPhoneNumber((String) session.getAttribute("phoneNumber")).get(),
							inv, LocalDateTime.now(), null));

			ok = true;
			msg = "借出成功!!";
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
