package ru.exen.repository;

import org.springframework.data.repository.CrudRepository;
import ru.exen.model.Message;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {
	
	List<Message> findByTag(String tag);

}
