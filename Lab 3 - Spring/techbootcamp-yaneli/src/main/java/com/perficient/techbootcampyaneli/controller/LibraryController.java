package com.perficient.techbootcampyaneli.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LibraryController {

	/* provides "routing" information
	 * tells Spring that any HTTP request with the / path should be mapped to this method
	 * the @RestController above tells Spring to render resulting string back to caller
	 */
	@RequestMapping("/")
	String home() {
		return "Hello World!";
	}
	
	
}
