package br.com.biblioteca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.repository.PessoaRepository;

//@RestController
@Controller
public class PessoaController {

	@Autowired
	PessoaRepository repositorio;
	
//	@RequestMapping(value = "indexPessoas",method = RequestMethod.GET)
//	public List<Pessoa> index() {
//	return repositorio.findAll();
//	}
	
	@RequestMapping(value = "/formPessoa", method = RequestMethod.GET)
	public ModelAndView form() {
		
		ModelAndView mdv = new ModelAndView("pessoa/form");
		
		try {
			Pessoa pessoa = new Pessoa();
			mdv.addObject("pessoa",pessoa);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mdv;
	}
	
	@RequestMapping(value = "/doFormPessoa", method = RequestMethod.POST)
	public RedirectView salvar(Pessoa pessoa, BindingResult result) {
		try {
			repositorio.save(pessoa);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RedirectView("/index", true);
	}

	
	
}
