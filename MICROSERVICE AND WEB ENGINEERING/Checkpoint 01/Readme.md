# Checkpoint 01 - Spring e Maven


### Spring

Spring -  Framework java mais conhecido do mundo e utilizamos o padrão mvc para criação de aplicações web

https://start.spring.io/ - Spring Initializr - Aplicação que gera configurações default 

Configurações utilizadas na aula
![image](https://user-images.githubusercontent.com/82169520/227972728-3241db48-c263-4b9a-b425-5e2af6dbc2f3.png)

Dependências (Injeção de Dependência) - Auxilia na estruturação do códigos utilizando dependências (semelhantes a API) para reduzir o trabalho
Dependências usadas:
- Spring Web
- DevTools
- Thymeleaf
- Data JPA
- MySQL Driver
![image](https://user-images.githubusercontent.com/82169520/227974236-0a5a506f-9626-4fa4-b9f4-df7b4ce7ea0f.png)


Injeção de Dependência é um é um padrão de projeto usado para evitar o alto nível de acoplamento;
Vantagens: mais fácil manutenção e facilidade na implementação de testes.

### MVC

MVC - Model, View e Controller. Utilizamos essa padrão para a codificação em java
![image](https://user-images.githubusercontent.com/82169520/227969237-883757a0-570b-4826-9ae7-c89deccb5e77.png)

![image](https://user-images.githubusercontent.com/82169520/227970832-3a5fa43c-7ed6-494a-b737-be530287fd21.png)
Arquitetura MVC no projeto

Views - Interação com o usuario
Models - Definição das variáveis e getters and setters
Controller - Direcionamento do usuário pelas páginas, listagens.

Conexão com o MySQL
![image](https://user-images.githubusercontent.com/82169520/227973942-e6aa8366-2ea8-4b00-b1aa-b87db2d1cd43.png)

#### Thymeleaf 
	
	O Thymeleaf é uma template engine para projetos Java que facilita a criação de páginas HTML. Sendo assim, ele serve para gerar páginas HTML no lado servidor de forma dinâmica, permitindo a troca de informações entre o código Java e as página HTML, de tal maneira ele garante que o desenvolvedor consiga criar templates de forma mais fácil para suas aplicações.
	
	@GetMapping atende a uma requisição http
	Exemplos:
	
	@GetMapping("/hello")
	public String hello(HttpServletRequest request) {
		request.setAttribute("nome", "mundo");
		return "hello";
	}
	
	@GetMapping("/edit/{idade}")
	public String getById(Model model, @PathVariable("idade") Integer idIdade) {
		// model.addAttribute("")
		return "cliente/edit";

	}

Exemplo do index arquivo prof.

<p>
		Identificador para edição: <span th:text="${idade}"></span>.
	</p>
	
	th:text="${idade}" - Serve para passarmos uma variável para o html da página.
	
Código da controller para a váriavel idade utilizada acima

	@GetMapping("/edit/{idade}")
	public String getById(Model model, @PathVariable("idade") Integer idIdade) {
		// model.addAttribute("")
		return "cliente/edit";

	}
	
Exemplo site - https://www.treinaweb.com.br/blog/o-que-e-o-thymeleaf
![image](https://user-images.githubusercontent.com/82169520/228570304-b447a3f5-abf6-4589-a938-ab87c0e0d4d6.png)


#### Controller

Ex Produto
  
package br.com.fiap.exemplo.exemplo.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.fiap.exemplo.exemplo.models.Categoria;
import br.com.fiap.exemplo.exemplo.models.Produto;
import br.com.fiap.exemplo.exemplo.repositories.ProdutoRepository;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	private ProdutoRepository produtoRepository;

	@GetMapping("")
	public ModelAndView get() {
		ModelAndView model = new ModelAndView("produto/index");

		/*
		 * List<Produto> listaProduto = new ArrayList<Produto>();
		 * 
		 * Produto produtoUm = new Produto(); produtoUm.setId(new Long(1));
		 * produtoUm.setNome("Nike Lebron");
		 * 
		 * Produto produtoDois = new Produto(); produtoDois.setId(new Long(2));
		 * produtoDois.setNome("Nike do naldo");
		 * 
		 * listaProduto.add(produtoUm); listaProduto.add(produtoDois);
		 */

		List<Produto> listaProduto = produtoRepository.findAll();
		model.addObject("produtos", listaProduto);
		return model;
	}

	@GetMapping("/edit/{id}")
	public String getById(Model model, @PathVariable("id") Integer idProduto) {
		// model.addAttribute("")
		return "produto/edit";

	}

	@GetMapping("/create")
	public String create() {
		return "produto/create";
	}

	@PostMapping("/create")
	public String create(@ModelAttribute("produto") Produto objProduto) {
		produtoRepository.save(objProduto);

		/*
		 * // enviar para base de dados
		 * 
		 * System.out.println(objProduto.getId());
		 * System.out.println(objProduto.getNome());
		 */

		return "redirect:/produto";
	}

	@GetMapping("/categoria")
	@ResponseBody
	public Categoria getCategoria() {
		Categoria categoria = new Categoria();
		categoria.setDescricao("masculino");
		categoria.setId(1);

		return categoria;
	}

}

#### Model
Responspavel dentro do Controller de mandar informações para a view

public String home(Model model)
List<Pedido> pedidos = Arrays.asList(pedido);
		model.addAttribute("pedidos", pedido);



Exemplo produto model

package br.com.fiap.exemplo.exemplo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Produto {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.AUTO) // Auto incremenet

	private Long id;
	private String nome;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}

#### Repositories
Repositories do produto (banco de dados MySQL)

package br.com.fiap.exemplo.exemplo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.fiap.exemplo.exemplo.models.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	
	
}


