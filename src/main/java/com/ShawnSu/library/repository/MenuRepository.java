package com.ShawnSu.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.Menu;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {

}
