<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- local para trocar o encoding no eclipse - windows -> preference -> Web -> JSPFile -->    

<!-- ****** Incluído para a tela de consulta ******* -->
<%@ page import="view.UtilsTela" %>   
<!-- *********************************************** -->    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Carrinho de Compras - Cadastro de Produto</title>
	
	<!-- LINK PARA O ARQUIVO DE ESTILOS -->
	<!--  <link rel="stylesheet" href="../CSS/estilo.css" type="text/css" />-->
		
	<!-- LINK PARA A BIBLIOTECA JQUERY -->	
	<script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
	
	<!--LINK PARA O JQUERY MASKED INPUT -->
    <script src="../js/jquery-maskedinput/src/jquery.maskedinput.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY VALIDATION -->
    <script src="../js/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY MASK MONEY -->
    <script src="../js/jquery-maskmoney/jquery.maskmoney.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY-UI - CALENDÁRIO - Fonte: https://jqueryui.com/ -->    
    <link rel="stylesheet" href="../js/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="../js/jquery-ui-1.11.4.custom/jquery-ui.min.js" type="text/javascript"></script>
  	<script src="../js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script>
    
    <!-- LINK PARA O BOOTSTRAP -->
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    
    <!-- http://webdevacademy.com.br/tutoriais/crud-com-bootstrap-3-parte2/
    Boa ref -->
    
    <!-- LINK PARA O ARQUIVO JAVA SCRIPT DO PROJETO -->
	<script src="../js/lojaonlineJQ.js"></script>	
		
   
</head>
<body>

<div id="main" class="container"> <!-- CONTAINER BS -->

<hr>
	<div id="mensagens">
	${msg} <!-- INSERIDO NA AULA DE BACKEND -->	
	</div>
<hr>

<!-- ************************ JSTL -tela de consulta***************** -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- Não usado -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- Não usado -->
<!-- **************************************************************** -->

<!-- **** adaptar form de cadastro para a alteraçao ******************-->
<c:set var="url" value="cadproduto.html" />
<c:set var="btenviar" value="Enviar" />

<c:if test="${op eq 'C'}">
	<c:set var="url" value="altproduto.html" />
	<c:set var="btenviar" value="Alterar Produto" />
</c:if>
<!-- ***************************************************************** -->

<h1>Cadastro de Produto</h1>

<form name="formproduto" id="formproduto" role="form" action="${url}" method="post">

	<fieldset>	
		<legend class="control-label">Dados do Produto</legend>		
		
		<div class="row">
			<div class="form-group col-md-4">
				<label for="inputdefault">Código:</label>
				<input type="text" name="codproduto" class="form-control" maxlength="8" size="8"
				value="${p.codigo}"
				/>
				<!-- O código será por geração automática -->									
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">Descrição*:</label>				
				<input type="text" name="descrproduto" class="form-control" maxlength="100" size="100"
				value="${p.descricao}" />							
			</div>
		</div>					
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Categoria do Produto*:</label> 
				<select id=cbocategoria class="form-control" name="cbocategoria">
					<option value="0"> </option>
					<option value="1" <c:if test= "${(p.categoriaProduto eq '1')}">selected</c:if>>Camisa</option>			
					<option value="2" <c:if test= "${(p.categoriaProduto eq '2')}">selected</c:if>>Calça</option>
					<option value="3" <c:if test= "${(p.categoriaProduto eq '3')}">selected</c:if>>Short</option>
					<option value="4" <c:if test= "${(p.categoriaProduto eq '4')}">selected</c:if>>Bermuda</option>
					<option value="5" <c:if test= "${(p.categoriaProduto eq '5')}">selected</c:if>>Saia</option>
					<option value="6" <c:if test= "${(p.categoriaProduto eq '4')}">selected</c:if>>Calçado</option>
				</select>
			</div>			
			<div class="form-group col-md-5">
				<label for="inputdefault">Marca*:</label>
				<input type="text" name="marca" class="form-control" maxlength="40" size="40"
				value="${p.marca}" />
			</div>
		</div>
		
		<div class="row">	
			<div id="cbotamanhoroupa" class="form-group col-md-2">
				<label for="inputdefault">Tamanho roupa*:</label>
				<select name="cbotamanhoroupa" id="idtamroupa" class="form-control">
					<option value=""></option>
					<option value="PP" <c:if test= "${(p.tamroupa1 eq 'PP')}">selected</c:if>>PP</option>
					<option value="P" <c:if test= "${(p.tamroupa1 eq 'P')}">selected</c:if>>P</option>
					<option value="M" <c:if test= "${(p.tamroupa1 eq 'M')}">selected</c:if>>M</option>
					<option value="G" <c:if test= "${(p.tamroupa1 eq 'G')}">selected</c:if>>G</option>
					<option value="GG" <c:if test= "${(p.tamroupa1 eq 'GG')}">selected</c:if>>GG</option>
					<option value="EXG" <c:if test= "${(p.tamroupa1 eq 'EXG')}">selected</c:if>>EXG</option>			
				</select>
			</div>							
						
			<div id="tamanhonum" class="form-group col-md-3">
				<label for="inputdefault">Tamanho roupa*:</label> 
				<input type="text" name="tamanhonum" id="idtamnum" class="form-control 2dignum" maxlength="2" size="2"
				value="${p.tamroupa2}" />
			</div>
					
			<div id="tamanhocalcado" class="form-group col-md-3">
				<label for="inputdefault">Tamanho Sapato* (BR):</label>
				<input type="text" name="tamanhocalcado" id="idtamcalcado" class="form-control 2dignum" maxlength="2" size="2"
				value="${p.tamCalcado}" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Valor*:</label>
				<input type="text" class="form-control dinheiro" name="valorproduto" maxlength="14" size="14"
				value="${p.valor}" />
			</div>
							
			<div class="form-group col-md-2">
				<label for="inputdefault">Percentual Desconto:</label>
				<input type="text" class="form-control percentual" name="percdesconto" maxlength="4"
				size="4" value="${p.percentualDesconto}" />
			</div>
			
			<div class="form-group col-md-3">				
					<label for="inputdefault">Admite pagamento parcelado?*:</label><br>
					<input type="radio" name="pagtoparcelado" value="S"
						<c:if test= "${(p.parcelamento eq 'S')}">
   							checked="checked"	
   						</c:if>
					/>Sim		
					<input type="radio" name="pagtoparcelado" value="N"
						<c:if test= "${(p.parcelamento eq 'N')}">
   							checked="checked"	
   						</c:if>
					/>Não
			</div>
		</div>
		
		<div class="row">	
			<div class="form-group col-md-2">
				<label for="inputdefault">Produto em Destaque?:</label><br>
				<input type="radio" name="proddestaque" value="S"
						<c:if test= "${(p.destaque eq 'S')}">
   							checked="checked"	
   						</c:if>
				/>Sim		
				<input type="radio" name="proddestaque" value="N" checked="checked"
						<c:if test= "${(p.destaque eq 'N')}">
   							checked="checked"	
   						</c:if>
				/>Não				
			</div>
			
			<div class="form-group col-md-3">
				<label for="inputdefault">Data de início da comerc. produto*:</label>
				<input type="text" class="form-control data" name="dataproduto" id="dataproduto"
				maxlength="10" size="10" 
				<c:choose>
    				<c:when test="${p.dataInicioComercializacao != null }">
                      	value="${UtilsTela.ConverterDataToTela(p.dataInicioComercializacao)}"
         			</c:when>
         			<c:otherwise>
                        value="";
        			</c:otherwise>
				</c:choose>
				/>				
			</div>
			
			<div class="form-group col-md-3">
				<label for="inputdefault">Quantidade em estoque*:</label>
				<input type="text" class="form-control sonums" name="qtdestoque" maxlength="10"
				size="10" value="${p.qtdEstoque}" />
			</div>
		</div>
		
		<!-- FOTOS DO PRODUTO -->
		<div id="row">						
			<div class="form-group col-md-8">
				<input type="file" class="form-control" id="foto1" name="foto1" />
				<input type="file" class="form-control" id="foto2" name="foto2" />
				<input type="file" class="form-control" id="foto3" name="foto3" />
				<input type="file" class="form-control" id="foto4" name="foto4" />
			</div>
		</div>
		
		<!-- <input type="hidden" name="idconsulta" value="${p.codigo}">  -->
		<!-- BOTÕES -->
		
		<div class="row">
			<div class="col-md-8">
				<input type="submit" value="${btenviar}" class="btn btn-primary" />
				
				<c:if test="${op eq 'C'}">
					<a href="excluirproduto.html?codigo=${codconsulta}" 
						onclick="return confirm('Deseja excluir este Produto?')" 
								class="btn btn-danger">Excluir</a>
				</c:if>
				
				<input type="button" class="btlimpar" value="Limpar" class="btn btn-default" />
				
				<c:choose>
    				<c:when test="${op eq 'C' }">
                      	<input type="button" class="btn btn-default btvoltarcons" value="Voltar" />
         			</c:when>
         			<c:otherwise>
                    	<input type="button" class="btn btn-default btvoltar" value="Voltar" />
					</c:otherwise>
				</c:choose>
					
			</div>
		</div>
							
	</fieldset>
</form>
<hr>

</div>

</body>
</html>