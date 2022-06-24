package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

// tells Hibernate to make a table out of this class
@Entity(name = "book")	
public class BookEntity {
	
	@Id
	private String isbn;
	private String title;
	private String authorFirstName;
	private String authorLastName;
	
	
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
	
	public String getAuthorFirstName() {
		return authorFirstName;
	}
	public void setAuthorFirstName(String authorFirstName) {
		this.authorFirstName = authorFirstName;
	}
	
	public String getAuthorLastName() {
		return authorLastName;
	}
	public void setAuthorLastName(String authorLastName) {
		this.authorLastName = authorLastName;
	}
	
}
