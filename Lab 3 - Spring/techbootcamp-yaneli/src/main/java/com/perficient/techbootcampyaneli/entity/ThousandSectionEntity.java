package com.perficient.techbootcampyaneli.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

// Dewey Decimal Thousand Section = Third Summary

//@Embeddable ?
@Entity(name = "ddc_thousand_section")
public class ThousandSectionEntity {
	
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
