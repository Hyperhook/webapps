<jsp:include page="topo.jsp"></jsp:include>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h3 class="page-header">LISTAR CLIENTES</h3>
	
	<div class="well">
		<form action="listarclientes.html" method="get">
			<input type="submit" value="PESQUISAR" class="btn btn-info">
		</form>
		${msg}
		
		<table border="1">
			<tr>
				<th>email</th>
				<th>nome</th>
				<th>cpf</th>
			<tr>
			
			<c:forEach var="cliente" items="${lc}">
				<tr>
					<td>${cliente.email}</td>
					<td>${cliente.nome}</td>
					<td>${cliente.cpf}</td>
				</tr>
			</c:forEach>
			
			
		</table>
	</div>
	
		
<jsp:include page="rodape.jsp"></jsp:include>