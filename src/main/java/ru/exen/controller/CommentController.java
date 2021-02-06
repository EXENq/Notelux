package ru.exen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.exen.model.Comment;
import ru.exen.model.Message;
import ru.exen.model.User;
import ru.exen.repository.MessageRepository;
import ru.exen.service.CommentService;

import javax.validation.Valid;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private MessageRepository messageRepo;

    @GetMapping("/comment/{id}")
    public String commentList(@PathVariable("id") Long id, Model model) {
        model.addAttribute("comments", commentService.findByMessageId(id));
        return "commentList";
    }

    @PostMapping("/comment/{id}")
    public String addComment(
            @AuthenticationPrincipal User user,
            @Valid Comment comment,
            @PathVariable("id") Long id
    ){
        Message commentMessage = messageRepo.getOne(id);
        commentService.create(comment, user, commentMessage);
        return "redirect:/comment/" + commentMessage.getId();
    }


}
