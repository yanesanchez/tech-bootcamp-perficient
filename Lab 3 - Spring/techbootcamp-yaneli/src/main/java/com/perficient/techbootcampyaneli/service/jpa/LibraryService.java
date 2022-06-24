package com.perficient.techbootcampyaneli.service.jpa;

import com.perficient.techbootcampyaneli.domain.Book;
import com.perficient.techbootcampyaneli.entity.BookEntity;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class LibraryService {
	@Autowired
	BookRepository bookRepository;

	
	public Book getBook(String isbn) {
		Optional<BookEntity> bookEntity = bookRepository.findById(isbn);
		
		if(bookEntity.isPresent()) {
			return map(bookEntity.get());
		} else {
			return null;
		}
	}

	public List<Book> getBooks() {
		Iterable<BookEntity> bookEntities = bookRepository.findAll();
		return StreamSupport.stream(bookEntities.spliterator(), false).map(be -> map(be)).collect(Collectors.toList());
	}
	
	/*
	private Book map(BookEntity bookEntity) {
		return null;
	}
	*/
	
}
