package ru.exen.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import ru.exen.model.Message;
import ru.exen.model.User;

public interface MessageRepository extends CrudRepository<Message, Long> {
	
	Page<Message> findAll(Pageable pageable);
	Page<Message> findByTag(String tag, Pageable pageable);
	Page<Message> findByAuthor(User user, Pageable pageable);
}
