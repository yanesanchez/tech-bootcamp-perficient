package com.perficient.techbootcampyaneli.domain;

import java.util.Collections;
import java.util.List;

public class Book {
	private String isbn;
	private String title;
	private String authorFirst;
	private String authorLast;
	private List<BookClassification> classification;

	public Book() {
		this.classification = Collections.emptyList();
	}

	public Book(String isbn, String title, String authorFirst, String authorLast) {
		this.isbn = isbn;
		this.title = title;
		this.authorFirst = authorFirst;
		this.authorLast = authorLast;
		this.classification = Collections.emptyList();
	}
	
	public Book(String isbn, String title, String authorFirst, String authorLast,
			List<BookClassification> classification) {
		this.isbn = isbn;
		this.title = title;
		this.authorFirst = authorFirst;
		this.authorLast = authorLast;
		this.classification = classification;
	}

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
