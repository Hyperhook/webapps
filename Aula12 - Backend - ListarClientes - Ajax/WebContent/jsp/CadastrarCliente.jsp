<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ****** Incluído para a tela de consulta ******* -->
<%@ page import="view.UtilsTela" %>   
<!-- *********************************************** -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Carrinho de Compras - Cadastro de Cliente</title>
	
	<!-- LINK PARA O ARQUIVO DE ESTILOS -->
	<!-- <link rel="stylesheet" href="CSS/estilo.css" type="text/css" /> -->
		
	<!-- LINK PARA A BIBLIOTECA JQUERY -->	
	<script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
	
	<!--LINK PARA O JQUERY MASKED INPUT -->
    <script src="../js/jquery-maskedinput/src/jquery.maskedinput.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY VALIDATION -->
    <script src="../js/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY MASK MONEY -->
    <script src="../js/jquery-maskmoney/jquery.maskmoney.js" type="text/javascript"></script>
    
    <!--LINK PARA O JQUERY-UI - CALENDÁRIO - Fonte: https://jqueryui.com/ -->    
    <link rel="stylesheet" href="js/jquery-ui-1.11.4.custom/jquery-ui.css">
    <script src="../js/jquery-ui-1.11.4.custom/jquery-ui.min.js" type="text/javascript"></script>
  	<script src="../js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script>
  	
  	<!-- LINK PARA O BOOTSTRAP -->
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
	<script src="../bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    
    <!-- http://webdevacademy.com.br/tutoriais/crud-com-bootstrap-3-parte2/ Boa ref -->
  	
    <!-- LINK PARA O ARQUIVO JAVA SCRIPT DO PROJETO -->
	<script src="../js/lojaonlineJQ.js"></script>	
	
</head>
<body>

<div id="main" class="container"> <!-- CONTAINER BS -->

<hr>
	<div id="mensagens">
	${msg } <!-- INSERIDO NA AULA DE BACKEND -->	
	</div>
<hr>

<!-- ************************ JSTL -tela de consulta***************** -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- Não usado -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- Não usado -->
<!-- **************************************************************** -->

<!-- **** adaptar form de cadastro para a alteraçao ******************-->
<c:set var="url" value="cadcliente.html" />
<c:set var="btenviar" value="Enviar" />

<c:if test="${op eq 'C'}">
	<c:set var="url" value="altcliente.html" />
	<c:set var="btenviar" value="Alterar Cliente" />
</c:if>
<!-- ***************************************************************** -->

<h1>Cadastro de Cliente</h1>

<form name="formcliente" id="formcliente" role="form" action="${url}" method="post">

	<fieldset>
		<legend class="control-label">Dados do Cliente</legend>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">email*:</label> <!-- USANDO HTML 5.0 para o tipo email - problema para personalizar mensagens de erro -->
				<input type="email" class="form-control"name="email" maxlength="30" size="30" placeholder="usuario@meudominio.com"
				required pattern=“[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$” title="Informe um e-mail válido"
				value="${c.email}" />
			</div>
		</div>		
		
		<div class="row">
			<div class="form-group col-md-4">
				<label for="inputdefault">Senha*:</label>
				<input type="password" id="senha" class="form-control" name="senha" 
				maxlength="8" size="8" value="${c.senha}" />					
			</div>
			
			<div class="form-group col-md-4">
				<label for="inputdefault">Confirmar Senha*:</label>
				<input type="password" id="confirmasenha" class="form-control" name="confirmasenha"
				 maxlength="8" size="8" value="${c.senha}" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">	
				<label for="inputdefault">Nome Completo*:</label>
				<input type="text" class="form-control" name="nome" 
				maxlength="50" size="50" value="${c.nome}"/>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Sexo*:</label><br>
				<input type="radio" name="rbsexo" value="M"
					<c:if test= "${(c.sexo eq 'M')}">
   						checked="checked"	
   					</c:if>
   				/>Masculino		
				<input type="radio" name="rbsexo" value="F" 
					<c:if test="${(c.sexo eq 'F')}">
   						checked="checked"	
   					</c:if>
				/>Feminino
			</div>			
		
			<div class="form-group col-md-3">
				<label for="inputdefault">CPF*:</label>
				<input type="text" id="cpf" class="form-control" name="cpf" 
				maxlength="14" size="14" value="${c.cpf}" />
			</div>	
		
			<div class="form-group col-md-2">
				<label for="inputdefault">Data de Nascimento*:</label>
				<input type="text" class="data form-control" name="dtnasc"
				 maxlength="10" size="10" 
				 <c:choose>
    				<c:when test="${c.dtNasc != null }">
                      	value="${UtilsTela.ConverterDataToTela(c.dtNasc)}"
         			</c:when>
         			<c:otherwise>
                        value="";
        			</c:otherwise>
				</c:choose>
				/>
				<!-- USANDO HTML 5.0 para exibir um calendário 
				<label>Data de Nascimento*:</label>
				<input type="date" name="dtnasc" maxlength="10" size="10" />-->
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-4">		
				<label>Telefone para Contato*:</label>
				<input type="text" id="telefone" class="form-control" name="telefone"
				 maxlength="14" size="14" value="${c.telefone}"/>
			</div>
		
			<div class="form-group col-md-4">
				<label for="inputdefault">Celular(opcional):</label>
				<input type="text" id="celular" class="form-control" name="celular"
				maxlength="15" size="15" value="${c.celular}"/>
			</div>		
		</div>			
		
		<div class="row">
			<div class="form-group col-md-4">	
				<label for="inputdefault">Tipo de Endereço*:</label> 
				<select name="cbocategoria" id=cbocategoria class="form-control">
					<option value="0"> </option>
					<option value="1" <c:if test= "${(c.tpEndereco eq '1')}">selected</c:if>>Casa</option>
					<option value="2" <c:if test= "${(c.tpEndereco eq '2')}">selected</c:if>>Apartamento</option>
					<option value="3" <c:if test= "${(c.tpEndereco eq '3')}">selected</c:if>>Comercial</option>
					<option value="4" <c:if test= "${(c.tpEndereco eq '4')}">selected</c:if>>Outros</option>						
				</select>				
			</div>
			<div class="form-group col-md-4">			
				<label for="inputdefault">CEP*:</label>
				<input type="text" id="cep" class="form-control" name="cep"
				 maxlength="10" size="10" value="${c.cep}"/>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-6">
				<label for="inputdefault">Endereço*:</label>
				<input type="text" class="form-control" name="endereco"
				maxlength="50" size="50" value="${c.endereco}" />
			</div>
		
			<div class="form-group col-md-2">
				<label for="inputdefault">Número*:</label>
				<input type="text" class="form-control sonums" name="numero"
				maxlength="6" size="5" value="${c.numero}" />
			</div>
		</div>	

		<div class="row">
			<div class="form-group col-md-8">				
				<label for="inputdefault">Complemento(opcional):</label>
				<input type="text" class="form-control" name="complemento"
				maxlength="50" size="50" value="${c.complemento}" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Bairro*:</label>
				<input type="text" class="form-control" name="bairro"
				 maxlength="25" size="25" value="${c.bairro}" />										
			</div>
		
			<div class="form-group col-md-4">
				<label for="inputdefault">Cidade*:</label>
				<input type="text" class="form-control" name="cidade"
				 maxlength="25" size="25" value="${c.cidade}"/>
			</div>
		
			<div class="form-group col-md-1">
				<label for="inputdefault">Estado*:</label> 
				<select name="cboestado" id="cboestado" class="form-control">
					<option value="" <c:if test= "${(c.estado eq '')}">selected</c:if>></option>
					<option value="rj" <c:if test= "${(c.estado eq 'rj')}">selected</c:if>>RJ</option>
					<option value="mg" <c:if test= "${(c.estado eq 'mg')}">selected</c:if>>MG</option>
					<option value="sp" <c:if test= "${(c.estado eq 'sp')}">selected</c:if>>SP</option>
					<option value="es" <c:if test= "${(c.estado eq 'es')}">selected</c:if>>ES</option>						
				</select>				
			</div>	
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">Informações de Referência*:</label>
				<input type="text" class="form-control" name="inforef"
				 maxlength="50" size="50" value="${c.infref}" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-8">
				<input type="submit" id="btenviarcliente" value="${btenviar}" class="btn btn-primary" />	
				
				<input type="button" class="btn btn-default btlimpar" value="Limpar" />
				
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
	
<!-- OBS: O submarino não deixa CEP errado, mas aqui vamos deixar e o usuário terá que preencher -->

</div> <!-- CONTAINER BS -->

</body>
</html>