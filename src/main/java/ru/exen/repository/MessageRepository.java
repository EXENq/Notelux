package ru.exen.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import ru.exen.model.Message;

public interface MessageRepository extends CrudRepository<Message, Long> {
	
	List<Message> findByTag(String tag);

}
