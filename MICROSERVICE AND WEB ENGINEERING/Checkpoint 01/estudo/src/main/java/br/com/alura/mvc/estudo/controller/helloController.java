package br.com.alura.mvc.estudo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class helloController {

	@GetMapping("/hello")
	public String hello(HttpServletRequest request) {
		request.setAttribute("nome", "mundo");
		return "hello";
	}

}
