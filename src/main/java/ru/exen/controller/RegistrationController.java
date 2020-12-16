package ru.exen.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ru.exen.model.Role;
import ru.exen.model.User;
import ru.exen.repository.UserRepository;

@Controller
public class RegistrationController {
	@Autowired
	private UserRepository userRepo;
	
	@GetMapping("/registration")
	public String registrtion() {
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(User user, Map<String, Object> model) {
		User userFromDb = userRepo.findByUsername(user.getUsername());
		
		if(userFromDb != null) {
			model.put("message", "User already exists!");
			return "registration";
		}
		
		user.setActive(true);
		user.setRoles(Collections.singleton(Role.USER));
		userRepo.save(user);
		
		return "redirect:/login";
	}
	
}
