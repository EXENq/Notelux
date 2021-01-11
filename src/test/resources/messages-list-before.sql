delete from message;

insert into message(id, text, tag, user_id) values
(1, 'first message', 'first tag', 1),
(2, 'second message', 'second tag', 1),
(3, 'third message', 'third tag', 1),
(4, 'fourth message', 'fourth tag', 1);

alter sequence hibernate_sequence restart with 10;