package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

// Dewey Decimal Main Class = First Summary

//@Embeddable ?
@Entity(name = "ddc_main_class")
public class MainClassEntity {
	
	@Id
	private Integer num;
	private String heading;
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	
	
}
