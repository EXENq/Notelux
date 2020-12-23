package ru.exen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.exen.model.Role;
import ru.exen.model.User;
import ru.exen.repository.UserRepository;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
	
	private final UserRepository userRepo;
	private final MailSender mailSender;
	
	@Autowired
	public UserService(UserRepository userRepo, MailSender mailSender) {
		this.userRepo = userRepo;
		this.mailSender = mailSender;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userRepo.findByUsername(username);
	}

	public boolean addUser(User user){
		User userFromDb = userRepo.findByUsername(user.getUsername());

		if(userFromDb != null){
			return false;
		}

		user.setActive(false);
		user.setRoles(Collections.singleton(Role.USER));
		user.setActivationCode(UUID.randomUUID().toString());

		userRepo.save(user);

		if (StringUtils.isEmpty(user.getEmail())){
			String message = String.format(
					"Hello, %s! \n" +
							"Welcome! Please, visit next link for activation your account: http://localhost:8080/activate/%s",
					user.getUsername(),
					user.getActivationCode()
			);

			mailSender.send(user.getEmail(), "Activation code", message);
		}

		return true;
	}

	public boolean activateUser(String code) {
		User user = userRepo.findByActivationCode(code);

		if (user == null){
			return false;
		}

		user.setActivationCode(null);
		user.setActive(true);
		userRepo.save(user);

		return true;
	}
}
