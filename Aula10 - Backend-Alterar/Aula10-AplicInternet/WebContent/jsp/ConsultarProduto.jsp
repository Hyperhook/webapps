<jsp:include page="topo.jsp"></jsp:include>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<h3 class="page-header">BUSCAR PRODUTO</h3>
	
	<div class="well">
		<form action="consultarproduto.html" method="post">
			<div class="form-group">
				Informe o código do Produto:
				<input type="text" name="codconsulta" value="${codconsulta}" class="form-control"> 
			</div>
			<input type="submit" value="BUSCAR" class="btn btn-info">
		</form>
		${msg}
	</div>
	
		
<jsp:include page="rodape.jsp"></jsp:include>