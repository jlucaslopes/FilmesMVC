<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>

    <title>Filmes - Editar</title>
    
    <spring:url value="/resources/css" var="css"/>
    <spring:url value="/resources/js" var="js"/>
     <spring:url value="/resources/images" var="images" />
     
     <link rel="shortcut icon" href="${images}/favicon.ico" type="image/x-icon"/>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
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
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container">

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well">
					
					<h2>Filme</h2>
					
					<form:form modelAttribute="filmeModel" action="${contextPath}/filme/${filmeModel.id}" method="put">
					
						<spring:hasBindErrors name="filmeModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<form:input type="hidden" path="id" id="id" />                    
                        </div>
						
						<div class="form-group">
							<label class="control-label" for="nome">Nome:</label>
							<form:input type="text" path="nome" id="nome" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="nome"/></font><br/>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="sinopse">Sinopse:</label>
							<form:input type="text" path="sinopse" id="sinopse" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="sinopse"/></font><br/>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="genero">Gênero</label>
							<form:input type="text" path="genero" id="genero" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="genero"/></font><br/>
                        </div>

						<div class="form-group">
							<label class="control-label" for="dataLancamento">Data:</label>
							<form:input type="text" path="dataLancamento" id="dataLancamento" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="dataLancamento"/></font><br/>
                        </div>
                                              
                        <div class="form-group">
							<label class="control-label" for="produtora">Produtora:</label>
							<form:input type="text" path="produtora" id="produtora" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="produtora"/></font><br/>
                        </div>
						
						<hr>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/filme">Cancelar</a>
						<button type="submit" class="btn btn-primary-pessoal btn-lg">Editar</button>
                            
                        <br>
                        <br>
					</form:form>
					
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${js}/bootstrap.min.js"></script>

</body>
</html>