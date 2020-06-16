<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>


<title>Movies</title>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />

<link rel="shortcut icon" href="${images}/favicon.ico" type="image/x-icon"/>

<c:set value="${pageContext.request.contextPath}" var="contextPath" />

<link href="${css}/bootstrap.css" rel="stylesheet">
<link href="${css}/small-business.css" rel="stylesheet">

</head>
<body class="color-fundo">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	<li>
                		<img src="${images}/logo.png" alt="..." class="img-responsive-logo-nav">
                	</li>
                    <li>
                        <a href="${contextPath}/filme">Home Page</a>
                    </li>
                    <li>
                    <a href="${contextPath}/filme/form?page=filme-novo">Adicionar Filme</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
       
    <div class="container-pessoal">
        <div class="row">
            <div class="col-md-12">
				
				<h1 class="img-to-center"><img src="${images}/logo.png" alt="..." class="img-responsive-logo"></h1>
				
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>
				
				<table class="table table-striped table-condensed">
					<thead>
						<tr>
							<th data-field="name">Filmes</th>
							<th data-field="name">Data de lançamento</th>
							<th data-field="name">Ações</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${filmes}" var="filme">
						<tr>
							<td>		
							<a class="teste-letra" href="${contextPath}/filme/${filme.id}">
								<img src="${images}/${filme.id}.jpg" alt="..." class="img-responsive-pessoal img-rounded ">
							</a>
							
							<a class="teste-letra" href="${contextPath}/filme/${filme.id}">${filme.nome}</a></td>
							
							<td>${filme.dataLancamento}</td>
							
							<td class="actions">
							
								<form:form action="${contextPath}/filme/${filme.id}" method="delete">
									<a class="btn btn-success-pessoal btn-xs" href="${contextPath}/filme/${filme.id}">Detalhes</a>
									<a class="btn btn-warning-pessoal btn-xs" href="${contextPath}/filme/form?page=filme-editar&id=${filme.id}">Editar</a>
									<input type="submit" value="Excluir" class="btn btn-danger-pessoal btn-xs">
								</form:form>	
									
							</td>
						</tr>
					</c:forEach>			
                    </tbody>
				</table>
            </div>
        </div>
		<hr>
    </div>

	<footer class="panel-footer">
	<div class="container">
		<p class="teste-letra">
		<a class= "teste-letra" href="${contextPath}/filme">Back to Top</a>
		</p>
	</div>
	</footer>
	
    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>