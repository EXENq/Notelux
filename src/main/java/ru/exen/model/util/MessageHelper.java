package ru.exen.model.util;

import ru.exen.model.Comment;
import ru.exen.model.User;

import java.util.List;

public abstract class MessageHelper {

    public static String getAuthorName(User author){
        return author != null ? author.getUsername() : "<none>";
    }

    public static int getCommentsCount(List<Comment> comments){ return comments != null ? comments.size() : 0; }
}
