package com.perficient.techbootcampyaneli.service.jpa;

import com.perficient.techbootcampyaneli.entity.BookEntity;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

public interface BookRepository extends CrudRepository<BookEntity, String>, QueryByExampleExecutor<BookEntity> {
	
}
