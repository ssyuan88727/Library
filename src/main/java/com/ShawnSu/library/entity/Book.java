package com.ShawnSu.library.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Book")
public class Book {
	@Id
	private String isbn;
	@Column(columnDefinition = "NVARCHAR(100)", nullable = false)
	private String name;
	@Column(columnDefinition = "NVARCHAR(50)", nullable = false)
	private String author;
	@Column(columnDefinition = "NTEXT")
	private String introduction;

	public Book() {
	}

	public Book(String isbn, String name, String author, String introduction) {
		this.isbn = isbn;
		this.name = name;
		this.author = author;
		this.introduction = introduction;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}
