package ru.exen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.exen.model.Comment;
import ru.exen.model.Message;
import ru.exen.model.User;
import ru.exen.repository.CommentRepository;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepo;

    public List<Comment> findByMessageId(Long id) {
        return commentRepo.findByMessageId(id);
    }

    public Comment create(Comment comment, User user, Message message){
        comment.setAuthor(user);
        comment.setMessage(message);
        Comment commentFromDb = commentRepo.save(comment);

        return commentFromDb;
    }
}
