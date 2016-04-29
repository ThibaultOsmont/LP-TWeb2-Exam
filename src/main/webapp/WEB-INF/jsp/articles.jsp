<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des articles</title>
</head>
<body>
	<tag:header/>
	
	<h1>Catalogue des articles</h1>
	
	<table border=1>
		<tr>
			<th>Code</th>
			<th>Nom</th>
			<th>Prix</th>
			<th>Stock</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${articles}" var="art">
			<tr>
				<td>${art.code}</td>
				<td>${art.nom}</td>
				<td>${art.prix}</td>
				<td>${art.stock}</td>
				<td> <a href="/TWeb2_Exam/commanderArticle?art=${art.code}">Commander</a> </td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<a href="/TWeb2_Exam/consulter_commande.html">Consulter votre commandes</a>
</body>
</html>