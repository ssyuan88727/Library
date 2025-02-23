package com.ShawnSu.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.Bulletin;

@Repository
public interface BulletinRepository extends JpaRepository<Bulletin, Long> {

}
