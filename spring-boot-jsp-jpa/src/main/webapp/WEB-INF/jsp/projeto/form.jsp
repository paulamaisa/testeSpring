<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <title>Formulário Cadastro Projeto</title>
	    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
	</head>
	<body>
		<s:url value="/doSaveProjeto" var="evento" />
		
		<div class="container">
		<h3>Cadastro Projeto</h3>
		<sf:form method="post" modelAttribute="projeto" action="${evento}">
			<c:if test="${not empty projeto.id}">
				<sf:hidden path="id" />
			</c:if>
			
		  <div class="form-row">
		    <label for="inputAddress">Nome</label>
		    <sf:input path="nome" class="form-control" placeholder="Digite o nome do projeto"/>
		  </div>
		  
		  <div class="form-row">
		    <label for="inputAddress2">Data Início</label>
			<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
			${dateString}
		    <sf:input value="${dateString}" path="dataInicio" class="form-control data" placeholder="Ex.: dd/MM/yyyy"/>
		  </div>
		  
		 <div class="form-group">
			<label for="idade">Gerente Responsável</label>
			<sf:select path="pessoa.id">
				<sf:options items="${listaPessoa}" itemValue="id" itemLabel="nome"/>
			</sf:select>
		 </div>
		 
		  <div class="form-row">
		    <label for="inputAddress2">Data previsão de término</label>
			<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
			${dateString}
		    <sf:input value="${dateString}" path="dataPrevisaoFim" class="form-control data" placeholder="Ex.: dd/MM/yyyy"/>
		  </div>
		  
  		  <div class="form-row">
		    <label for="inputAddress2">Data de término</label>
			<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
			${dateString}
		    <sf:input value="${dateString}" path="dataFim" class="form-control data" placeholder="Ex.: dd/MM/yyyy"/>
		  </div>
		  
		  <div class="form-row">
		    <label for="inputAddress">Orçamento total</label>
		    <sf:input path="orcamento" class="form-control" placeholder="0,00"/>
		  </div>
		  
		  <div class="form-row">
		    <label for="inputAddress">Descrição</label>
		    <sf:input path="descricao" class="form-control" placeholder="Digite a descrição do projeto"/>
		  </div>
		  <br>
		  <div class="form-row">
		    
		    <div class="form-group col-md-4">
		    
		      <label for="inputState">Status do Projeto</label>
		      <sf:select path="status" class="form-control">
		        <sf:option value="${tipoDeStatus}" label="Selecione o status"/>
		        <sf:options items="${tipoStatus}" />
		      </sf:select>
		      
		    </div>
		    
 			<div class="form-group col-md-4">
		    
		      <label for="inputState">Risco</label>
		      <sf:select path="risco" class="form-control">
		        <sf:option value="${tipoDeRisco}" label="Selecione o tipo"/>
		        <sf:options items="${tipoDeRisco}" />
		      </sf:select>
		      
		   </div>
		    
		  </div>
		  <br><br>
	
		<button type="submit" class="btn btn-primary">Salvar</button>
		</sf:form>
		</div>
		
	<script src="<%=request.getContextPath()%>/static/lib/jquery-1.11.1.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
    <SCRIPT language="javascript">
	    $(document).ready(function () {
	        $('.data').mask('99/99/9999');
	        $('.cpf').mask('999.999.999-99');
	        return false;
	    });
    </SCRIPT>
		
	</body>
</html>

