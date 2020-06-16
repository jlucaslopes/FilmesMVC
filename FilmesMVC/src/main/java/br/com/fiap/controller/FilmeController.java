package br.com.fiap.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.fiap.model.*;
import br.com.fiap.repository.FilmeRepository;

@Controller
@RequestMapping("/filme")
public class FilmeController {
	
	@Autowired
	public FilmeRepository repository;
	
	@GetMapping("/form")
	public String open(@RequestParam String page, 
					   @RequestParam(required = false) Long id,
					   @ModelAttribute("filmeModel") FilmeModel filmeModel, 
					   Model model) {
		
		if("filme-editar".equals(page)) {
			model.addAttribute("filmeModel", repository.findById(id));
		}
		
		return page;
	}

	@GetMapping()
	public String findAll(Model model) {

		model.addAttribute("filmes", repository.findAll());
		return "filmes";
	}

	@GetMapping("/{id}")
	public String findById(@PathVariable("id") long id, Model model) {
		
		model.addAttribute("filme", repository.findById(id));
		return "filme-detalhe";
	}
	
	@PostMapping()
	public String save(@Valid FilmeModel filmeModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return "filme-novo";
		}
		
		repository.save(filmeModel);
		redirectAttributes.addFlashAttribute("messages", "Filme cadastrado com sucesso!");
		
		return "redirect:/filme";
	}
	
	@GetMapping("/new")
	public String openSave(@ModelAttribute("filmeModel") FilmeModel filmeModel) {
		return "filme-novo";
	}
	
	@PutMapping("/{id}")
	public String update(@PathVariable("id") long id, @Valid FilmeModel filmeModel, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if(bindingResult.hasErrors()) {
			return "filme-editar";
		}
		
		filmeModel.setId(id);
		repository.update(filmeModel);
		redirectAttributes.addFlashAttribute("messages", "Filme alterado com sucesso!");
		
		return "redirect:/filme";
	}
	
	@DeleteMapping("/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		
		repository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Filme excluído com sucesso!");

		return "redirect:/filme";
	}


}
