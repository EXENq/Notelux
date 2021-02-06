package ru.exen.model;

import org.hibernate.validator.constraints.Length;
import ru.exen.model.util.MessageHelper;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the comment")
    @Length(max = 2048, message = "Comment too long (more than 2kB)")
    private String text;

    @ManyToOne
    @JoinColumn(name = "message_id")
    private Message message;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;

    public Comment(){ }

    public Comment(String text, Message message, User author) {
        this.text = text;
        this.message = message;
        this.author = author;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
