delete from user_role;
delete from usr;

insert into usr(id, active, password, username) values
(1, true, '$2a$08$5O/FROF2atODeS8X1n1Y4ObBq15if8q8tJv0dJpF678OKWdQP66Hy', 'admin'),
(2, true, '$2a$08$zBxcJrFlnILRV6WlKlPmeesu6DpwzDTStQGQAlj02PMxBfjv3zWDa', 'mail');

insert into user_role(user_id, roles) values
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');