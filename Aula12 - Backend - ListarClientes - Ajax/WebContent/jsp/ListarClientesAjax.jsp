<jsp:include page="topo.jsp"></jsp:include>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h3 class="page-header">LISTAR CLIENTES</h3>
	
	<div class="well">
		<form name="listar">
			Nome: <input type="text" name=nome id="nomePesquisa">
		</form>				
		<br><br>				
		<table border="1">
			<thead id="headTabela">
				<tr>					
					<th>Nome</th>
					<th>Email</th>
					<th>CPF</th>
				</tr>
			</thead>
			<tbody id="resultadoConsulta">		
			</tbody>			
		</table>
		<div id="mensagem">			
		</div>
		
	</div>
	
		
<jsp:include page="rodape.jsp"></jsp:include>