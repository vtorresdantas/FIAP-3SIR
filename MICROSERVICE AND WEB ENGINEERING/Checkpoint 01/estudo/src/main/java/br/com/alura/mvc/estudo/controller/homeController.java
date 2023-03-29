package br.com.alura.mvc.estudo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import br.com.alura.mvc.estudo.model.Pedido;
import br.com.alura.mvc.estudo.repositories.PedidoRepository;

@Controller
public class homeController {

	@Autowired // Pedir para o string que quer uma instância de pedidos repository
	private PedidoRepository repository;

	@GetMapping("/home")
	public String home(Model model) {

		/*
		 * Pedido pedido = new Pedido(); pedido.setNome("Xiaomi"); pedido.setUrlImagem(
		 * "https://files.tecnoblog.net/wp-content/uploads/2022/04/xiaomi-redmi-note-11-16.jpg"
		 * ); pedido.setUrlProduto(
		 * "https://www.magazineluiza.com.br/redmi-note-11-4gb-ram-128gb-preto-xiaomi" +
		 * "/p/bdffk9234a/te/tcsp/?&seller_id=rcellcomercio&utm" +
		 * "_source=google&utm_medium=pla&utm_campaign=&partner_" +
		 * "id=69994&gclid=Cj0KCQjww4-hBhCtARIsAC9gR3bJ5FqhIGpZZCxwOt1cyd_" +
		 * "t7smjof_9Zx7O1JvAzLYRInXbpoIR-HQaAnl7EALw_wcB&gclsrc=aw.ds");
		 * pedido.setDescricao("Xiaomi celular");
		 * 
		 * List<Pedido> pedidos = Arrays.asList(pedido);
		 */

		List<Pedido> pedidos = repository.findAll();
		model.addAttribute("pedidos", pedidos);

		return "home";
	}
}
