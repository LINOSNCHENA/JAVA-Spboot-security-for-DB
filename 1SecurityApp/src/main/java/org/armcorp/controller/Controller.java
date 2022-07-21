package org.armcorp.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.armcorp.model.legitUser;

@RestController
public class Controller {
	@Autowired
	private JdbcUserDetailsManager jdbcUserDetailsManager;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostMapping(value = "/register")
	public String regiter(@RequestBody legitUser User1) {
		List<GrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority(User1.getRoles()));
		String encodededPassword = passwordEncoder.encode(User1.getPassword());
		User user = new User(User1.getUserName(), encodededPassword, authorities);
		jdbcUserDetailsManager.createUser(user);
		return "User created for Pemba Data:)";
	}

	@GetMapping(value = "/admin")
	public String admin() {
		return "<h3>Welcome Lusaka Admin :)</h3>";
	}

	@GetMapping(value = "/user")
	public String user() {
		return "<h3>Hello Monze User :)</h3>";
	}

	@GetMapping(value = "/")
	public String welcome() {
		return "<h3> Welcome to everyone patient  :)</h3>";
	}
}
