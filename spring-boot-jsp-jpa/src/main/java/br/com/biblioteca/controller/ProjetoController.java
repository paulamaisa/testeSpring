package br.com.biblioteca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.biblioteca.model.Pessoa;
import br.com.biblioteca.model.Projeto;
import br.com.biblioteca.repository.PessoaRepository;
import br.com.biblioteca.repository.ProjetoRepository;


@Controller
public class ProjetoController<ErrorPageFilter> {
	

	@Autowired
	ProjetoRepository projetoRepository;
	
	@Autowired
	PessoaRepository pessoaRepository;
	
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView mdv = new ModelAndView("/index");
		List<Projeto> projetos = projetoRepository.findAll();
		mdv.addObject("projetos",projetos);
		
		return mdv;
	}

	
	@RequestMapping(value = "/formProjeto", method = RequestMethod.GET)
	public ModelAndView form() {
		
		ModelAndView mdv = new ModelAndView("projeto/form");
		
		try {
			Projeto projeto = new Projeto();
			List<Pessoa> listaPessoa = pessoaRepository.findByFuncionario(true);
			
			mdv.addObject("listaPessoa", listaPessoa);
			mdv.addObject("projeto", projeto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mdv;
	}
	
	@RequestMapping(value = "/doSaveProjeto", method = RequestMethod.POST)
	public RedirectView salvarProjeto(Projeto projeto, BindingResult result) {
		
		try {
			projetoRepository.save(projeto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new RedirectView("/index", true); 
		
	}
	
	
	@RequestMapping(value = "/doEditProjeto" ,method = RequestMethod.GET)
	public ModelAndView editarProjeto(Long idProjeto, Projeto projeto) {
		ModelAndView mav = new ModelAndView("projeto/form");
		List<Projeto> listaprojetos;
		if(projetoRepository.exists(idProjeto)) {
			 projetoRepository.save(projeto);
		}
		listaprojetos = projetoRepository.findAll();
		 mav.addObject("listaprojetos",listaprojetos);
		
		return mav;
	}
	
	@RequestMapping(value = "/doDeleteProjeto" ,method = RequestMethod.POST)
	public RedirectView excluirProjeto(@RequestParam Long idProjeto, Projeto projeto) {
			
			ModelAndView mav = new ModelAndView("projeto/form");
			Projeto projetoBD = projetoRepository.findOne(idProjeto);
			switch (projetoBD.getStatus()) {
			case INICIADO:
				//mensagem de erro
				projeto = projetoBD;
				break;
			case  EM_ANDAMENTO:
				projeto = projetoBD;
			break;
			case ENCERRADO :
				projeto = projetoBD;
				break;
			default:
				projetoRepository.delete(idProjeto);
			}
			
			return new RedirectView("/index",true);
		}
	}

