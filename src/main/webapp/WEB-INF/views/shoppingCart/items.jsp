<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>
<fmt:message key="shoppingCart.title" var="title" />
<customTags:page bodyClass="cart" title="${title}">
	<jsp:attribute name="extraScripts">
<script>
	$(function() {
		$('#checkout').click(function() {
			_gaq.push([ '_trackPageview', '/checkout/finalizaCompra' ]);
		});
		$('.book-suggest').click(function() {
			var book = $(this).data('book');
			_gaq.push([ '_trackEvent', 'Recomendação', 'Livro', book ]);
		});
	});
</script>
<script>
	$(function() {
		$('a[href^="http"]').not('.dont-track').filter(function(index) {
			var ccb = $(this).attr('href').indexOf("casadocodigo.com.br");
			if (ccb == -1)
				ccb = $(this).attr('href').indexOf("localhost");
			return ccb != 7 && ccb != 11;
		}).click(function(event) {
			var domain = this.href;
			domain = domain.substring(7);
			domain = domain.substring(0, domain.indexOf('/'));
			if (domain.substring(0, 4) == 'www.')
				domain = domain.substring(4);
			_gaq.push([ '_trackPageview', '/LinkExterno/' + this.href ]);
		});
	});
</script>
</jsp:attribute>
	<jsp:body>
<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
		<table id="cart-table">
			<colgroup>
				<col class="item-col">
				<col class="item-price-col">
				<col class="item-quantity-col">
				<col class="line-price-col">
				<col class="delete-col">
			</colgroup>
			<thead>
				<tr>
					<th class="cart-img-col"></th>
					<th width="65%">Item</th>
					<th width="10%">Preço</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
			</thead>
	<tbody>
	<c:forEach items="${shoppingCart.list}" var="item">
		<tr>
			<td class="cart-img-col"><img src="" alt="${item.product.title}" />
			</td>
			<td class="item-title">${item.product.title}- ${item.bookType}</td>
			<td class="numeric-cell">${item.price}</td>
			<td class="quantity-input-cell"><input type="number" min="0"
								readonly="readonly" value="${shoppingCart.getQuantity(item)}">
			</td>
			<td class="numeric-cell">${shoppingCart.getTotal(item)}</td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
	<tr>
		<td colspan="2">
			<form action="${spring:mvcUrl('PC#checkout').build()}" method="post">
				<input type="submit" class="checkout" name="checkout"
									value="Finalizar compra " id="checkout" />
			</form>
		</td>
		<td class="numeric-cell">${shoppingCart.total}</td>
		<td></td>
	</tr>
</tfoot>
</table>
</section>
</jsp:body>
</customTags:page>
</html>