package com.ShawnSu.library.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "bulletin")
public class Bulletin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private Long id;

	@Column(columnDefinition = "NVARCHAR(50)", nullable = false)
	private String title;

	@ManyToOne
	@JoinColumn(name = "userId", nullable = false)
	private User poster;

	@Column(columnDefinition = "NTEXT")
	private String content;

	@Column(nullable = false)
	private Date postDate;

	@Column(nullable = false)
	private Date stopDate;

	public Bulletin() {
	}

	public Bulletin(String title, String content, Date postDate, Date stopDate) {
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.stopDate = stopDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getPoster() {
		return poster;
	}

	public void setPoster(User poster) {
		this.poster = poster;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

}
