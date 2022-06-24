package com.perficient.techbootcampyaneli.entity;

import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Embeddable
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
	
	@Override
	public int hashCode() {
		return Objects.hash(division, isbn, mainClass, section);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookClassificationEntity other = (BookClassificationEntity) obj;
		return Objects.equals(division, other.division) && Objects.equals(isbn, other.isbn)
				&& Objects.equals(mainClass, other.mainClass) && Objects.equals(section, other.section);
	}

	
}
