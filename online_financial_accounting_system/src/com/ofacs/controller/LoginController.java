package com.ofacs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {


	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	@RequestMapping("/acc_login")
	public String showAccLogin() {
		return "acc_login";
	}
	
	@RequestMapping("/ofacshome")
	public String showLoggedOut() {
		return "ofacshome";
	}
	
}
