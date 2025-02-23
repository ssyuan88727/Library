package com.ShawnSu.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ShawnSu.library.entity.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {
}
