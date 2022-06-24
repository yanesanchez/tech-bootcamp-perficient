package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

// Dewey Decimal Hundred Division = Second Summary

@Entity(name = "ddc_hundred_division")
public class HundredDivisionEntity {
	
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
