package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

// tells Hibernate to make a table out of this class
@Entity(name = "book")	
public class BookEntity {
	
	@Id
	private String isbn;
	private String title;
	private String authorFirst;
	private String authorLast;
	
	/* --- constructors ---- */
	public BookEntity() {}
	
	public BookEntity(String isbn, String title, String authorFirst, String authorLast) {
		this.isbn = isbn;
		this.title = title;
		this.authorFirst = authorFirst;
		this.authorLast = authorLast;
	}
	
	/* --- getters & setters --- */
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthorFirst() {
		return authorFirst;
	}
	public void setAuthorFirst(String authorFirst) {
		this.authorFirst = authorFirst;
	}
	
	public String getAuthorLast() {
		return authorLast;
	}
	public void setAuthorLast(String authorLast) {
		this.authorLast = authorLast;
	}
	
}
