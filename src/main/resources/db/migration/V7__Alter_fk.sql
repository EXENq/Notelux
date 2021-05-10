alter table if exists message
    drop constraint message_user_fk,
    add constraint message_user_fk
    foreign key (user_id) references usr on delete cascade;

alter table if exists user_role
    drop constraint user_role_user_fk,
    add constraint user_role_user_fk
    foreign key (user_id) references usr on delete cascade;

alter table if exists message_likes
    drop constraint message_likes_message_id_fkey,
    add constraint message_likes_message_id_fkey
    foreign key (message_id) references message on delete cascade;