<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Index</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.5-dist/css/bootstrap-theme.css"></link>
</head>
<body>
	<div class="container">

		<h3>Principal</h3>
		<br /> 
		<a href="<s:url value="/formProjeto" />"
			class="btn btn-default"> <span class="fa fa-plus"></span> 
			Novo Projeto
		</a> 
		<br /> 
		<a href="<s:url value="/formPessoa" />"
			class="btn btn-default"> <span class="fa fa-plus"></span>
			Adicionar Pessoa
		</a> 
		<br />

	</div>


	<c:if test="${not empty projetos}">
		<table id="credito-table"
			class="table table-striped table-bordered table-hover table-condensed small">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Data Início</th>
					<th>Gerente Responsável</th>
					<th>Data Previsao Termino</th>
					<th>Data Termino</th>
					<th>Orçamento</th>
					<th>Descrição</th>
					<th>Status</th>
					<th>Grau Risco</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaprojetos}" var="projeto" varStatus="c">
					<tr>
						<td>${projeto.nome}</td>
						<td>${projeto.dataInicio}</td>
						<td>${projeto.funcionario}</td>
						<td>${projeto.dataPrevisaoFim}</td>
						<td>${projeto.dataFim}</td>
						<td>
							<fmt:formatNumber value='${projeto.orcamento}' maxFractionDigits='2' minFractionDigits='2' />
						</td>
						<td>${projeto.descricao}</td>
						<td>
							${projeto.status}</td>
						<td>
							${projeto.risco} 
						</td>

						<td class="text-center">
							<a
								href="<s:url value="/doEditProjeto?idProjeto=${projeto.id}" />"
								class="btn btn-default btn-xs"
								title='<fmt:message key="button.edit"/>'> <span
								class="glyphicon glyphicon-pencil"></span> 
								<fmt:message key="button.edit" />
							</a>
							<a
								href="<s:url value="/doDeleteProjeto?idProjeto=${projeto.id}" />"
								class="btn btn-default btn-xs"
								title='<fmt:message key="button.delete"/>'> 
								<span class="glyphicon glyphicon-trash"></span> 
								<fmt:message key="button.delete" />
							</a>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>


</body>
</html>