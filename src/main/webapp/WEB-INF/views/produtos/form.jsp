<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Cadastro de Produtos</title>
</head>
<body>

	<form method="post" action="/casadocodigo/produtos">
		<div>
			<label for="title">Titulo</label>
			<input type="text" name="title" id="title" />
		</div>
		<div>
			<label for="description">Descri��o</label>
			<textarea rows="10" cols="20" name="description" id="description"> </textarea>
		</div>
		<div>
			<label for="pages">N�mero de paginas</label>
			<input type="text" name="pages" id="pages" />
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
		<c:forEach items="${types}" var="bookType" varStatus="status">
			<div>
				<label for="price_${bookType}">${bookType}</label>
				<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
				<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}" />
			</div>
		</c:forEach>
	</form>

</body>
</html>