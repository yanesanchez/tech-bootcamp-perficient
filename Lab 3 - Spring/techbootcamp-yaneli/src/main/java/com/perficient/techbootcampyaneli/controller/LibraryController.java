package com.perficient.techbootcampyaneli.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.perficient.techbootcampyaneli.service.jpa.LibraryService;
import com.perficient.techbootcampyaneli.domain.Book;
import com.perficient.techbootcampyaneli.entity.BookEntity;
import com.perficient.techbootcampyaneli.service.jpa.BookRepository;

@RestController
public class LibraryController {
	
	private static final Logger LOGGER = LogManager.getLogger(LibraryController.class);
	
	@Autowired	// get the bean called bookRepository
	private BookRepository bookRepository;
	@Autowired	// get the bean called libraryService
	private LibraryService libraryService;
	
	
	/* provides "routing" information
	 * tells Spring that any HTTP request with the / path should be mapped to this method
	 * the @RestController above tells Spring to render resulting string back to caller
	 */
	@RequestMapping("/")
	String home() {
		return "Hello World!";
	}
	
	
	@GetMapping(path="/all")
	  public @ResponseBody Iterable<BookEntity> getAllBooks() {
	    // This returns a JSON or XML with the users
	    return bookRepository.findAll();
	  }
	
	
}
