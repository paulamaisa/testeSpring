package br.com.biblioteca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.repository.ProjetoRepository;
import ch.qos.logback.core.filter.Filter;

@Controller
public class IndexController {
	
	@Autowired
	ProjetoRepository repositorioProjeto;

	@RequestMapping(value="/index")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView("/index");
		List<Projeto> projetos = repositorioProjeto.findAll();
		mav.addObject("projetos",projetos);
		
		return mav;
	}
	
}
