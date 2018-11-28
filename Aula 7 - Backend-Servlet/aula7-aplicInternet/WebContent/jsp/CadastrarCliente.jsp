<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	</div>
<hr>

<h1>Cadastro de Cliente</h1>

<form name="formcliente" id="formcliente" role="form" action="" method="post">

	<fieldset>
		<legend class="control-label">Dados do Cliente</legend>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">email*:</label> <!-- USANDO HTML 5.0 para o tipo email - problema para personalizar mensagens de erro -->
				<input type="email" class="form-control"name="email" maxlength="30" size="30" placeholder="usuario@meudominio.com"
				required pattern=“[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$” title="Informe um e-mail válido"
				/>
			</div>
		</div>		
		
		<div class="row">
			<div class="form-group col-md-4">
				<label for="inputdefault">Senha*:</label>
				<input type="password" id="senha" class="form-control" name="senha" 
				maxlength="8" size="8" />					
			</div>
			
			<div class="form-group col-md-4">
				<label for="inputdefault">Confirmar Senha*:</label>
				<input type="password" id="confirmasenha" class="form-control" name="confirmasenha"
				 maxlength="8" size="8" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">	
				<label for="inputdefault">Nome Completo*:</label>
				<input type="text" class="form-control" name="nome" 
				maxlength="50" size="50" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Sexo*:</label><br>
				<input type="radio" name="rbsexo" value="M" />Masculino		
				<input type="radio" name="rbsexo" value="F" />Feminino
			</div>			
		
			<div class="form-group col-md-3">
				<label for="inputdefault">CPF*:</label>
				<input type="text" id="cpf" class="form-control" name="cpf" 
				maxlength="14" size="14" />
			</div>	
		
			<div class="form-group col-md-2">
				<label for="inputdefault">Data de Nascimento*:</label>
				<input type="text" class="data form-control" name="dtnasc"
				 maxlength="10" size="10" />
				<!-- USANDO HTML 5.0 para exibir um calendário 
				<label>Data de Nascimento*:</label>
				<input type="date" name="dtnasc" maxlength="10" size="10" />-->
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-4">		
				<label>Telefone para Contato*:</label>
				<input type="text" id="telefone" class="form-control" name="telefone"
				 maxlength="14" size="14" />
			</div>
		
			<div class="form-group col-md-4">
				<label for="inputdefault">Celular(opcional):</label>
				<input type="text" id="celular" class="form-control" name="celular"
				maxlength="15" size="15" />
			</div>		
		</div>			
		
		<div class="row">
			<div class="form-group col-md-4">	
				<label for="inputdefault">Tipo de Endereço*:</label> 
				<select name="cbocategoria" id=cbocategoria class="form-control">
					<option value="0"> </option>
					<option value="1">Casa</option>
					<option value="2">Apartamento</option>
					<option value="3">Comercial</option>
					<option value="4">Outros</option>						
				</select>				
			</div>
			<div class="form-group col-md-4">			
				<label for="inputdefault">CEP*:</label>
				<input type="text" id="cep" class="form-control" name="cep"
				 maxlength="10" size="10" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-6">
				<label for="inputdefault">Endereço*:</label>
				<input type="text" class="form-control" name="endereco"
				maxlength="50" size="50" />
			</div>
		
			<div class="form-group col-md-2">
				<label for="inputdefault">Número*:</label>
				<input type="text" class="form-control sonums" name="numero"
				maxlength="6" size="5" />
			</div>
		</div>	

		<div class="row">
			<div class="form-group col-md-8">				
				<label for="inputdefault">Complemento(opcional):</label>
				<input type="text" class="form-control" name="complemento"
				maxlength="50" size="50" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Bairro*:</label>
				<input type="text" class="form-control" name="bairro"
				 maxlength="25" size="25" />										
			</div>
		
			<div class="form-group col-md-4">
				<label for="inputdefault">Cidade*:</label>
				<input type="text" class="form-control" name="cidade"
				 maxlength="25" size="25" />
			</div>
		
			<div class="form-group col-md-1">
				<label for="inputdefault">Estado*:</label> 
				<select name="cboestado" id="cboestado" class="form-control">
					<option value="" ></option>
					<option value="rj">RJ</option>
					<option value="mg">MG</option>
					<option value="sp">SP</option>
					<option value="es">ES</option>						
				</select>				
			</div>	
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">Informações de Referência*:</label>
				<input type="text" class="form-control" name="inforef"
				 maxlength="50" size="50" />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-8">
				<input type="submit" id="btenviarcliente" value="Enviar" class="btn btn-primary" />	
				<input type="button" class="btn btn-default btlimpar" value="Limpar" />				
				<input type="button" class="btn btn-default btvoltar" value="Voltar" />
			</div>		
		</div>
		
	</fieldset>	
</form>	
<hr>
	
</div> <!-- CONTAINER BS -->

</body>
</html>