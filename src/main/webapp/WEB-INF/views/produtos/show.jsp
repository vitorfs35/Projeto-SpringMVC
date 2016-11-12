<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<title>${product.title}</title>
</head>
<body class="product">
	<header id="product-highlight" class="clearfix">
		<div id="product-overview" class="container">
			<ul class="clearfix">
				<li><a href="" rel="nofollow">
					Seu carrinho(${sessionScope['scopeTarget.shoppingCart'].quantity})
				</a></li>
			</ul>
			<img itemprop="image" width="280px" height="395px" src=''
				class="product-featured-image" alt="${product.title}">
			<h1 class="product-title" itemprop="name">${product.title}</h1>
			<p class="product-author">
				<span class="product-author-link"> ${product.title} </span>
			</p>
			<p itemprop="description" class="book-description">
				${product.description} Veja o <a
					href="<c:url value='/${product.summaryPath}'/>" target="_blank">sumário</a>
				completo do livro!
			</p>
		</div>
	</header>

	<section class="buy-options clearfix">
		<form:form servletRelativeAction="/shopping" method="post" cssClass="container">
			<input type="hidden" value="${product.id}" name="productId" />
			<ul id="variants" class="clearfix">
				<c:forEach items="${product.prices}" var="price">
					<li class="buy-option">
						<input type="radio" name="bookType" class="variant-radio" id="${product.id}-${price.bookType}" value="${price.bookType}" ${price.bookType.name()=='COMBO'?'checked':''}>
						<label class="variant-label" for="${product.id}-${price.bookType}">
							${price.bookType} 
						</label>
						<p class="variant-price">
							${price.value}
						</p>
					</li>
				</c:forEach>
			</ul>
			
			<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar" />
		</form:form>
	</section>

</body>
</html>