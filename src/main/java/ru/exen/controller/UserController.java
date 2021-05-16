package ru.exen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import ru.exen.model.Role;
import ru.exen.model.User;
import ru.exen.service.UserService;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping
	public String userList(Model model) {
		model.addAttribute("users", userService.findAll());
		return "userList";
	}

	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping("{user}")
	public String userEditForm(@PathVariable User user, Model model) {
		model.addAttribute("user", user);
		model.addAttribute("roles", Role.values());
		return "userEdit";
	}

	@PreAuthorize("hasAuthority('ADMIN')")
	@PostMapping
	public String userSave(
			@RequestParam String username,
			@RequestParam Map<String, String> form,
			@RequestParam("userId") User user
	) {
		userService.saveUser(user, username, form);

		return "redirect:/user";
	}

	@GetMapping("profile")
	public String getProfile(Model model, @AuthenticationPrincipal User user){
		model.addAttribute("username", user.getUsername());
		model.addAttribute("email", user.getEmail());

		return "profile";
	}

	@PostMapping("profile")
	public String updateProfile(
			@AuthenticationPrincipal User user,
			Model model,
			@RequestParam("password") String password,
			@RequestParam("email") String email

	){
		if (password.isEmpty() || email.isEmpty()) {
			Map<String, String> errorsMap = new HashMap<String, String>();

			if (password.isEmpty()){
				errorsMap.put("passwordError", "Password cannot be empty");
			}

			if (email.isEmpty()){
				errorsMap.put("emailError", "Email cannot be empty");
			}

			model.addAttribute("errorsMap", errorsMap);
		} else {
			userService.updateProfile(user, password, email);
		}

		model.addAttribute("username", user.getUsername());
		model.addAttribute("email", user.getEmail());

		return "profile";
	}

	@GetMapping("/subscribe/{user}")
	public String subscribe(
			@AuthenticationPrincipal User currentUser,
			@PathVariable User user
	){
		userService.subscribe(currentUser, user);

		return "redirect:/user-messages/" + user.getId();
	}

	@GetMapping("/unsubscribe/{user}")
	public String unsubscribe(
			@AuthenticationPrincipal User currentUser,
			@PathVariable User user
	){
		userService.unsubscribe(currentUser, user);

		return "redirect:/user-messages/" + user.getId();
	}

	@GetMapping("{type}/{user}/list")
	public String list(
			Model model,
			@PathVariable User user,
			@PathVariable String type
	){
		model.addAttribute("userChannel", user);
		model.addAttribute("type", type);

		if ("subscriptions".equals(type)){
			model.addAttribute("users", user.getSubscriptions());
		} else {
			model.addAttribute("users", user.getSubscribers());
		}

		return "subscriptions";
	}

	@GetMapping("delete/{id}")
	public String deleteUser(@PathVariable("id") Long id){
		userService.deleteUser(id);
		return "redirect:/user";
	}
}
