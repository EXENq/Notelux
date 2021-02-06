package ru.exen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.exen.model.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByMessageId(Long id);
}
