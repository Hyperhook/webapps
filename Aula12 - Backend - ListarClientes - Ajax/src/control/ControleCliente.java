package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Cliente;
import persistence.ClienteDao;
import persistence.UtilsBanco;

/**
 * Servlet implementation class ControleCliente
 */
//Servlet 3.0 aceita tanto com anotação quanto pelo web.xml.
@WebServlet({"/ControleCliente", "/jsp/cadcliente.html", 
		"/jsp/consultarcliente.html", "/jsp/altcliente.html", "/jsp/listarclientes.html",
		"/jsp/listarclientesAjax.html"})
public class ControleCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControleCliente() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response); /* incluído na aula em substituição a: 
		response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response); /* incluído na aula em substituição a: doGet(request, response);*/
	}
	
	/* método "execute" inserido na aula 
	 * Objetivo: ????????????
	 * */
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//Pegar a URL que foi executada
			String url = request.getServletPath();
	        /*switch case só funciona a partir do Java 7*/
			if(url.equalsIgnoreCase("/jsp/cadcliente.html")){
				cadastrar(request, response);
			}else if(url.equalsIgnoreCase("/jsp/consultarcliente.html")){
				consultar(request, response);
			}else if(url.equalsIgnoreCase("/jsp/altcliente.html")){
				alterar(request, response);
			}else if(url.equalsIgnoreCase("/jsp/listarclientes.html")){
				listar(request, response);
			}else if(url.equalsIgnoreCase("/jsp/listarclientesAjax.html")){
				listarAjax(request, response);	
			}else{
				response.sendRedirect("/");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

protected void cadastrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			/* Resgatar os dados do formulario: formCliente*/
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String nome = request.getParameter("nome");
			String sexo = request.getParameter("rbsexo");
			String cpf = request.getParameter("cpf");
			String dtnasc = request.getParameter("dtnasc");
			String telefone = request.getParameter("telefone");
			String celular = request.getParameter("celular");
			String tpendereco = request.getParameter("cbocategoria");
			String cep = request.getParameter("cep");
			String endereco = request.getParameter("endereco");
			String numero = request.getParameter("numero");
			String complemento = request.getParameter("complemento");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("cboestado");
			String infref = request.getParameter("inforef");
			
			Cliente cliente = new Cliente();
			
			/* Hospedar os dados do Cliente na Bean Cliente*/
			cliente.setEmail(email);
			cliente.setSenha(senha);
			cliente.setNome(nome);
			cliente.setSexo(sexo);
			cpf = cpf.replaceAll("\\.", "");
			cpf = cpf.replaceAll("\\-", "");
			Long cpfNum = new Long(cpf); 
			cliente.setCpf(cpfNum);
			cliente.setDtNasc(UtilsBanco.converterData(dtnasc));
			cliente.setTelefone(telefone);
			cliente.setCelular(celular);
			cliente.setTpEndereco(new Integer(tpendereco));
			cliente.setCep(cep);
			cliente.setEndereco(endereco);
			cliente.setNumero(new Integer(numero));
			cliente.setComplemento(complemento);
			cliente.setBairro(bairro);
			cliente.setCidade(cidade);
			cliente.setEstado(estado);
			cliente.setInfref(infref);
			
			if(new ClienteDao().cadastrar(cliente)){
				request.setAttribute("msg", 
				"<div class='alert alert-success'>Cliente cadastrado com sucesso</div>");
			}else{
				request.setAttribute("msg", 
				"<div class='alert alert-danger'>Cliente já possui possui um cadastro no sistema</div>");
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", 
					"<div class='alert alert-danger'>Funcionario não cadastrado</div>");
		}finally{
			request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
		}
		
}

/* Consultar os dados de um Cliente */
protected void consultar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
		/* Pegar o cpf digitado na tela */			
		Long cpf = new Long(request.getParameter("cpf"));
		/* Instanciar a classe DaoCliente */
		ClienteDao cd = new ClienteDao();
		/* Acionar o método da classe Dao Cliente que retorna os dados de um cliente a 
		 * partir do CPF do cliente*/
		Cliente cliente = cd.buscarPorCpf(cpf);
	
		if(cliente == null){ //Cliente não encontrado
			request.setAttribute("msg", "<div class='alert alert-warning'>Cliente "
					+ " nao existente</div>");
			request.getRequestDispatcher("ConsultarClienteBS.jsp").forward(request, response);
		}else{
			request.setAttribute("c", cliente);
			request.setAttribute("op", "C"); //operação = consulta
			request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

/* listar os Clientes */
protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
		/* Instanciar a classe DaoCliente */
		ClienteDao cd = new ClienteDao();
		List<Cliente> listaClientes = cd.listarClientes();
	
		if(listaClientes.size() == 0){ //Cliente não encontrado
			request.setAttribute("msg", "<div class='alert alert-warning'>Nenhum "
					+ " clienteEncontrado</div>");
			request.getRequestDispatcher("ListarClientes.jsp").forward(request, response);
		}else{
			request.setAttribute("lc",listaClientes);
			request.getRequestDispatcher("ListarClientes.jsp").forward(request, response);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

protected void listarAjax(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
		String nome = request.getParameter("nome");
		/* Instanciar a classe DaoCliente */		
		ClienteDao cd = new ClienteDao();
		List<Cliente> listaClientes = cd.listarClientesAjax(nome);
	
		if(listaClientes.size() == 0){ //Cliente não encontrado
			response.getWriter().println("<div class='alert alert-danger'>Nenhum clienteEncontrado</div>");
		}else{
			//request.setAttribute("lc",listaClientes);
			String lcStr = "";
			for(Cliente c:listaClientes){
				lcStr += 
						"<tr>"+
							"<td>"+c.getNome()+"</td>"+
							"<td>"+c.getEmail()+"</td>"+							
							"<td>"+c.getCpf()+"</td>"+
						"</tr>";
			}
			response.getWriter().println(lcStr);			
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}


protected void alterar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try{
		/* Resgatar os dados do formulario: formCliente*/
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String nome = request.getParameter("nome");
		String sexo = request.getParameter("rbsexo");
		String cpf = request.getParameter("cpf");
		String dtnasc = request.getParameter("dtnasc");
		String telefone = request.getParameter("telefone");
		String celular = request.getParameter("celular");
		String tpendereco = request.getParameter("cbocategoria");
		String cep = request.getParameter("cep");
		String endereco = request.getParameter("endereco");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("cboestado");
		String infref = request.getParameter("inforef");
		
		Cliente cliente = new Cliente();
		
		/* Hospedar os dados do Cliente na Bean Cliente*/
		cliente.setEmail(email);
		cliente.setSenha(senha);
		cliente.setNome(nome);
		cliente.setSexo(sexo);
		cpf = cpf.replaceAll("\\.", "");
		cpf = cpf.replaceAll("\\-", "");
		Long cpfNum = new Long(cpf); 
		cliente.setCpf(cpfNum);
		cliente.setDtNasc(UtilsBanco.converterData(dtnasc));
		cliente.setTelefone(telefone);
		cliente.setCelular(celular);
		cliente.setTpEndereco(new Integer(tpendereco));
		cliente.setCep(cep);
		cliente.setEndereco(endereco);
		cliente.setNumero(new Integer(numero));
		cliente.setComplemento(complemento);
		cliente.setBairro(bairro);
		cliente.setCidade(cidade);
		cliente.setEstado(estado);
		cliente.setInfref(infref);
		
		if(new ClienteDao().alterar(cliente)){
			request.setAttribute("msg", 
			"<div class='alert alert-success'>Cliente alterado com sucesso</div>");
			/*Setar os dados no request para parmanecer com as informações na tela após o update*/
			request.setAttribute("c", cliente);
			request.setAttribute("op", "C");
		}else{
			request.setAttribute("msg", 
			"<div class='alert alert-danger'>CPF informado está associado a outro cliente.</div>");
		}
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("msg", 
				"<div class='alert alert-danger'>Funcionario não cadastrado</div>");
	}finally{
		request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
	}
	
}

	
}
