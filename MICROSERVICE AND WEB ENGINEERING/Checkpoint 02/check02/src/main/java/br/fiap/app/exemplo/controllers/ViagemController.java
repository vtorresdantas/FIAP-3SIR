package br.fiap.app.exemplo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.fiap.app.exemplo.models.Viagem;
import br.fiap.app.exemplo.repositories.ViagemRepository;
import jakarta.validation.Valid;

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
	public String getById(Model model, @PathVariable("id") Long id) {
		Viagem viagem = viagemRepository.findById(id).orElse(null);
		if (viagem == null) {
			// Tratar a situação em que a viagem não foi encontrada
		}

		model.addAttribute("viagem", viagem);
		return "viagem/edit";
	}

	@PutMapping("/edit/{id}")
	public ResponseEntity<Viagem> atualizarViagem(@PathVariable Long id, @Valid @RequestBody Viagem viagemAtualizada) {
		Viagem viagem = viagemRepository.findById(id).orElse(null);
		if (viagem == null) {
			// Tratar a situação em que a viagem não foi encontrada
		}

		viagem.setDtoDecolagem(viagemAtualizada.getDtoDecolagem());
		viagem.setEstadia(viagemAtualizada.getEstadia());
		viagem.setAssentos(viagemAtualizada.getAssentos());
		viagem.setModeloNave(viagemAtualizada.getModeloNave());
		viagem.setPrimeiroComandante(viagemAtualizada.getPrimeiroComandante());
		viagem.setMatriculaPrimeiro(viagemAtualizada.getMatriculaPrimeiro());
		viagem.setSegundoComandante(viagemAtualizada.getSegundoComandante());
		viagem.setMatriculaSegundo(viagemAtualizada.getMatriculaSegundo());
		viagem.setDtoRetorno(viagemAtualizada.getDtoRetorno());

		final Viagem viagemAtualizadaBD = viagemRepository.save(viagem);

		return ResponseEntity.ok(viagemAtualizadaBD);
	}

	@PostMapping("/edit/{id}")
	public String create(@PathVariable("id") Long id, @ModelAttribute("viagem") Viagem objViagem, Model model) {
		Viagem viagem = viagemRepository.findById(id).orElse(null);
		if (viagem == null) {
			// Tratar a situação em que a viagem não foi encontrada
		}

		viagem.setDtoDecolagem(objViagem.getDtoDecolagem());
		viagem.setEstadia(objViagem.getEstadia());
		viagem.setAssentos(objViagem.getAssentos());
		viagem.setModeloNave(objViagem.getModeloNave());
		viagem.setPrimeiroComandante(objViagem.getPrimeiroComandante());
		viagem.setMatriculaPrimeiro(objViagem.getMatriculaPrimeiro());
		viagem.setSegundoComandante(objViagem.getSegundoComandante());
		viagem.setMatriculaSegundo(objViagem.getMatriculaSegundo());
		viagem.setDtoRetorno(objViagem.getDtoRetorno());

		viagemRepository.save(viagem);

		model.addAttribute("viagem", viagem);

		return "redirect:/";
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
		Viagem viagem = new Viagem();
		viagem.setDtoDecolagem(objViagem.getDtoDecolagem());
		viagem.setEstadia(objViagem.getEstadia());
		viagem.setAssentos(objViagem.getAssentos());
		viagem.setModeloNave(objViagem.getModeloNave());
		viagem.setPrimeiroComandante(objViagem.getPrimeiroComandante());
		viagem.setMatriculaPrimeiro(objViagem.getMatriculaPrimeiro());
		viagem.setSegundoComandante(objViagem.getSegundoComandante());
		viagem.setMatriculaSegundo(objViagem.getMatriculaSegundo());
		viagem.setDtoRetorno(objViagem.getDtoRetorno());

		viagemRepository.save(viagem);

		return "redirect:/";
	}

}
