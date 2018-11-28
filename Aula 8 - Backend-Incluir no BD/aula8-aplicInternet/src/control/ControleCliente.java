package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.Cliente;
import model.persistence.ClienteDao;
import model.persistence.UtilsBanco;

/**
 * Servlet implementation class ControleCliente
 */
//Servlet 3.0 aceita tanto com anotação quanto pelo web.xml.
@WebServlet({"/ControleCliente", "/jsp/cadcliente.html", 
		"/jsp/consultarcliente.html", "/jsp/altcliente.html"})
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
	
    /*Método criado em sala  - direcionar a requisição para o método adequado*/
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//Pegar a URL que foi executada
			String url = request.getServletPath();
	        /*switch case só funciona a partir do Java 7*/
			if(url.equalsIgnoreCase("/jsp/cadcliente.html")){
				cadastrar(request, response);
			}else if(url.equalsIgnoreCase("/jsp/consultarcliente.html")){
				System.out.println("CHAMAR O MÉTODO CONSULTAR");
			}else if(url.equalsIgnoreCase("/jsp/altcliente.html")){
				System.out.println("CHAMAR O MÉTODO ALTERAR");
			}else{
				response.sendRedirect("/");
			}
		}catch(Exception e){ //tratar melhor ?????
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
				/*setar a mensagem de sucesso no request*/
				request.setAttribute("msg", 
				"<div class='alert alert-success'>Cliente cadastrado com sucesso</div>");
			}else{
				/*setar a mensagem de erro no request*/
				request.setAttribute("msg", 
				"<div class='alert alert-danger'>Cliente já possui possui um cadastro no sistema</div>");
			}
		}catch(Exception e){
			e.printStackTrace();
			/*setar a mensagem de erro no request*/
			request.setAttribute("msg", 
					"<div class='alert alert-danger'>Funcionario não cadastrado</div>");
		}finally{
			request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
		}
		
}

//Faltam os métodos para ALTERAR E CONSULTAR um cliente

	
}
