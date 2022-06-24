package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "book_classification")
public class BookClassificationEntity {
	
	@Id
	private String isbn;
	private Integer mainClass;
	private Integer division;
	private Integer section;
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public Integer getMainClass() {
		return mainClass;
	}
	public void setMainClass(Integer mainClass) {
		this.mainClass = mainClass;
	}
	
	public Integer getDivision() {
		return division;
	}
	public void setDivision(Integer division) {
		this.division = division;
	}
	
	public Integer getSection() {
		return section;
	}
	public void setSection(Integer section) {
		this.section = section;
	}

}
