package ru.exen.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import ru.exen.model.Role;
import ru.exen.model.User;
import ru.exen.repository.UserRepository;
import ru.exen.service.UserService;

@Controller
public class RegistrationController {
	private final UserService userService;

	@Autowired
	public RegistrationController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(User user, Map<String, Object> model) {
		if(!userService.addUser(user)) {
			model.put("message", "User already exists!");
			return "registration";
		}
		
		return "redirect:/login";
	}

	@GetMapping("/activate/{code}")
	public String activate(Model model, @PathVariable String code){
		boolean isActivated = userService.activateUser(code);

		if (isActivated){
			model.addAttribute("message", "User successfully activated");
		} else {
			model.addAttribute("message", "Activation code is not found");
		}

		return "login";
	}
	
}
