package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Controller
@Transactional
@RequestMapping("/produtos")
public class ProductsController {
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(method=RequestMethod.POST)
	public String save(Product product,RedirectAttributes redirectAttributes){
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastedo com sucesso");
		return "redirect:produtos";
	}
	
	
	@RequestMapping("/form")
	public String form(){
		return "products/form";
	}
	
	
	@RequestMapping("/form")
	public ModelAndView form(){
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView("produtos/list");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}
}
