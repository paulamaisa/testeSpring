package br.com.biblioteca.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexRest {

	
	@RequestMapping("/indexRest")
	public String  index() {
		return"index";
	}
	
}
