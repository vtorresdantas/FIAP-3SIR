package br.fiap.app.exemplo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.fiap.app.exemplo.models.Viagem;
import br.fiap.app.exemplo.repositories.ViagemRepository;

@Controller
@RequestMapping("/viagem")
public class ViagemController {

	@Autowired
	private ViagemRepository viagemRepository;

	@GetMapping("/index")
	public ModelAndView get() {
		ModelAndView model = new ModelAndView("viagem/index");

		List<Viagem> listaViagem = viagemRepository.findAll();
		model.addObject("viagens", listaViagem);

		return model;

	}

	@GetMapping("/edit/{id}")
	public String getById(Model model, @PathVariable("id") Integer idProduto) {
		model.addAttribute("id", idProduto);
		return "viagem/index";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		viagemRepository.deleteById(id);
		return "redirect:/";
	}

	@GetMapping("/create")
	public String create() {
		return "viagem/create";
	}

	@PostMapping("/create")
	public String create(@ModelAttribute("viagem") Viagem objViagem) {
		viagemRepository.save(objViagem);

		return "redirect:/";
	}

}
