<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Filmes - Detalhe</title>
    
    <spring:url value="/resources/css" var="css"/>
    <spring:url value="/sresources/js" var="js"/>
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
        <div class="row">
            <div class="col-lg-12">
                <div class="well">
					
					<h2>${filme.nome}</h2>
					                      
                        <div class="form-group">
							<label class="control-label" for="sinopse">Sinopse:</label>
							<b>${filme.sinopse}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="genero">Gênero:</label>
							<b>${filme.genero}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="dataLancamento">Data de Lançamento:</label>
							<b>${filme.dataLancamento}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="produtora">Produtora:</label>
							<b>${filme.produtora}</b>
                        </div>
                        	
						<a class="btn btn-default btn-lg" href="${contextPath}/filme">Voltar</a>
                            
                        <br>
                        <br>
					
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