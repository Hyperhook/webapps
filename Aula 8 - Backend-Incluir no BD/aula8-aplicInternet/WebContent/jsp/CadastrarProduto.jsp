<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
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
    
    <!-- LINK PARA O ARQUIVO JAVA SCRIPT DO PROJETO -->
	<script src="../js/lojaonlineJQ.js"></script>	
		
   
</head>
<body>

<div id="main" class="container"> <!-- CONTAINER BS -->

<hr>
	<div id="mensagens">
	</div>
<hr>

<h1>Cadastro de Produto</h1>

<form name="formproduto" id="formproduto" role="form" action="" method="post">

	<fieldset>	
		<legend class="control-label">Dados do Produto</legend>		
		
		<div class="row">
			<div class="form-group col-md-4">
				<label for="inputdefault">Código:</label>
				<input type="text" name="codproduto" class="form-control" maxlength="8" size="8" />
				<!-- O código será por geração automática -->									
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-8">
				<label for="inputdefault">Descrição*:</label>				
				<input type="text" name="descrproduto" class="form-control" maxlength="100" size="100" />							
			</div>
		</div>					
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Categoria do Produto*:</label> 
				<select id=cbocategoria class="form-control" name="cbocategoria">
					<option value="0"> </option>
					<option value="1">Camisa</option>			
					<option value="2">Calça</option>
					<option value="3">Short</option>
					<option value="4">Bermuda</option>
					<option value="5">Saia</option>
					<option value="6">Calçado</option>
				</select>
			</div>			
			<div class="form-group col-md-5">
				<label for="inputdefault">Marca*:</label>
				<input type="text" name="marca" class="form-control" maxlength="40" size="40" />
			</div>
		</div>
		
		<div class="row">	
			<div id="cbotamanhoroupa" class="form-group col-md-2">
				<label for="inputdefault">Tamanho roupa*:</label>
				<select name="cbotamanhoroupa" id="idtamroupa" class="form-control">
					<option value=""></option>
					<option value="PP">PP</option>
					<option value="P">P</option>
					<option value="M">M</option>
					<option value="G">G</option>
					<option value="GG">GG</option>
					<option value="EXG">EXG</option>			
				</select>
			</div>							
						
			<div id="tamanhonum" class="form-group col-md-3">
				<label for="inputdefault">Tamanho roupa*:</label> 
				<input type="text" name="tamanhonum" id="idtamnum" class="form-control 2dignum" 
				maxlength="2" size="2" />
			</div>
					
			<div id="tamanhocalcado" class="form-group col-md-3">
				<label for="inputdefault">Tamanho Sapato* (BR):</label>
				<input type="text" name="tamanhocalcado" id="idtamcalcado" class="form-control 2dignum" 
				maxlength="2" size="2" />
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-3">
				<label for="inputdefault">Valor*:</label>
				<input type="text" class="form-control dinheiro" name="valorproduto" maxlength="14"
				size="14" />
			</div>
							
			<div class="form-group col-md-2">
				<label for="inputdefault">Percentual Desconto:</label>
				<input type="text" class="form-control percentual" name="percdesconto" maxlength="4"
				size="4" />
			</div>
			
			<div class="form-group col-md-3">				
					<label for="inputdefault">Admite pagamento parcelado?*:</label><br>
					<input type="radio" name="pagtoparcelado" value="S"	/>Sim		
					<input type="radio" name="pagtoparcelado" value="N"	/>Não
			</div>
		</div>
		
		<div class="row">	
			<div class="form-group col-md-2">
				<label for="inputdefault">Produto em Destaque?:</label><br>
				<input type="radio" name="proddestaque" value="S" />Sim		
				<input type="radio" name="proddestaque" value="N" checked="checked"	/>Não				
			</div>
			
			<div class="form-group col-md-3">
				<label for="inputdefault">Data de início da comerc. produto*:</label>
				<input type="text" class="form-control data" name="dataproduto" id="dataproduto"
				maxlength="10" size="10" />				
			</div>
			
			<div class="form-group col-md-3">
				<label for="inputdefault">Quantidade em estoque*:</label>
				<input type="text" class="form-control sonums" name="qtdestoque" maxlength="10"
				size="10" />
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
		
		<!-- BOTÕES -->
		
		<div class="row">
			<div class="col-md-8">
				<input type="submit" value="Enviar" class="btn btn-primary" />
				<input type="button" class="btlimpar" value="Limpar" class="btn btn-default" />
				<input type="button" class="btn btn-default btvoltar" value="Voltar" />	
			</div>
		</div>
							
		
	</fieldset>
</form>
<hr>

</div>

</body>
</html>

