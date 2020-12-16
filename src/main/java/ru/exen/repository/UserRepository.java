package ru.exen.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ru.exen.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
