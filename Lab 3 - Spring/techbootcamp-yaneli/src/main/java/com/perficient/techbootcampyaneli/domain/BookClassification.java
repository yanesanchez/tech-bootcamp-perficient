package com.perficient.techbootcampyaneli.domain;

public class BookClassification {
	private String isbn;
	private Integer mainClass;
	private Integer division;
	private Integer section;
	
	public BookClassification() {
		super();
	}

	public BookClassification(String isbn, Integer mainClass, Integer division, Integer section) {
		super();
		this.isbn = isbn;
		this.mainClass = mainClass;
		this.division = division;
		this.section = section;
	}

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
