<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>Cadastro de Produtos</title>
</head>
<body>

	<form:form method="post" action="${spring:mvcUrl("PC#save").build()}" commandName="product">
		<div>
			<label for="title">Titulo</label>
			<input type="text" name="title" id="title" />
			<form:errors path="title"/>
		</div>
		<div>
			<label for="description">Descri��o</label>
			<form:textarea rows="10" cols="20" path="description"/>
		</div>
		<div>
			<label for="pages">N�mero de paginas</label>
			<input type="text" name="pages" id="pages" />
		</div>
		<div>
			<label for="releaseDate">Data de Lan�amento</label>
			<form:input name="releaseDate" type="date"/>
			<form:errors path="releaseDate"/>t
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
		</form:form>
		
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}" />
			</div>
		</c:forEach>
		
		<spring:hasBindErrors name="product">
			<ul>
			<c:forEach items="${errors.allErrors}" var="error">
				<li><spring:message code="${error.code}" text=""/></li>
			</c:forEach>
			</ul>
		</spring:hasBindErrors>
	

</body>
</html>