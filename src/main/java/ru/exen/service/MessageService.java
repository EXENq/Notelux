package ru.exen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.exen.model.User;
import ru.exen.model.dto.MessageDto;
import ru.exen.repository.MessageRepository;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepo;

    public Page<MessageDto> messageList(Pageable pageable, String filter, User user){
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, pageable, user);
        } else {
            return messageRepo.findAll(pageable, user);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        if (currentUser.equals(author)) {
            return messageRepo.findByUser(pageable, author);
        } else {
            return messageRepo.findByUser(pageable, author, currentUser);
        }
    }
}
