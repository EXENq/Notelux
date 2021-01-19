package ru.exen.model.util;

import ru.exen.model.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author){
        return author != null ? author.getUsername() : "<none>";
    }
}
