<jsp:include page="topo.jsp"></jsp:include>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<h3 class="page-header">BUSCAR CLIENTE</h3>
	
	<div class="well">
		<form action="consultarcliente.html" method="post">
			<div class="form-group">
				Informe o CPF do usuário:
				<input type="text" name="cpf" value="${cpf}" class="form-control"> 
			</div>
			<input type="submit" value="BUSCAR" class="btn btn-info">
		</form>
		${msg}
	</div>
	
		
<jsp:include page="rodape.jsp"></jsp:include>