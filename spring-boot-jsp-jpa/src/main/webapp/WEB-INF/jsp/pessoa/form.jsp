<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <title>Formulário Cadastro Pessoa</title>
	    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
	</head>
	<body>
		<s:url value="/doFormPessoa" var="evento" />
		
		<div class="container">
		<h3>Formulário Cadastro Pessoa</h3>
		<sf:form method="post" modelAttribute="pessoa" action="${evento}">
			<c:if test="${not empty pessoa.id}">
				<sf:hidden path="id" />
			</c:if>
			
		  <div class="form-row">
		    <label for="inputAddress">Nome</label>
		    <sf:input path="nome" class="form-control" placeholder="Digite o nome"/>
		  </div>
		  
		  <div class="form-row">
		    <label for="inputAddress2">Data Nascimento</label>
			<fmt:formatDate value="${data}" var="dateString" pattern="dd/MM/yyyy" />
			${dateString}
		    <sf:input value="${dateString}" path="datanascimento" class="form-control data" placeholder="Ex.: dd/MM/yyyy"/>
		  </div>
		  
  		  <div class="form-row">
		    <label for="inputAddress2">Cpf</label>
		    <sf:input path="cpf" class="form-control cpf" placeholder="Ex.: 000.000.000-00"/>
		  </div>
		  
		<div class="form-check">
			<label for="idade">É um funcionário?</label>
			<br/>
			Sim<sf:radiobutton path="funcionario" value="1"/>
			Não<sf:radiobutton path="funcionario" value="0"/>
		</div>
		
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


