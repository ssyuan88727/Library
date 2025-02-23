package com.ShawnSu.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ShawnSu.library.entity.Bulletin;
import com.ShawnSu.library.repository.BulletinRepository;
import com.ShawnSu.library.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class BulletinService {
	@Autowired
	private BulletinRepository bulletinRepos;
	@Autowired
	private UserRepository userRepos;

	public List<Bulletin> findAll() {
		return bulletinRepos.findAll();
	}

	public Optional<Bulletin> findById(String id) {
		return bulletinRepos.findById(Long.parseLong(id));
	}

	public HashMap<String, Object> save(Bulletin bulletin, HttpSession session) {
		boolean ok = false;
		String msg = "";

		try {
			if (bulletin.getId() == null) {
				msg = "新增";
				bulletin.setPoster(userRepos.findByPhoneNumber((String) session.getAttribute("phoneNumber")).get());
			} else if (bulletin.getPoster() == null) {
				msg = "修改";
				bulletin.setPoster(bulletinRepos.findById(bulletin.getId()).get().getPoster());
			}
			bulletinRepos.save(bulletin);

			ok = true;
			msg += "成功!!";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("ok", ok);
		hm.put("msg", msg);
		return hm;
	}

	public HashMap<String, Object> edit(Bulletin bulletin) {
		boolean ok = false;
		String msg = "";

		try {
			bulletinRepos.save(bulletin);

			ok = false;
			msg = "修改成功!!";
		} catch (Exception e) {
			ok = false;
			msg = e.getMessage();
		}

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("ok", ok);
		hm.put("msg", msg);
		return hm;
	}

	public HashMap<String, Object> remove(String id) {
		boolean ok = false;
		String msg = "";

		try {
			bulletinRepos.deleteById(Long.parseLong(id));

			ok = true;
			msg = "刪除成功!!";
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
