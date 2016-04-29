<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<tag:header/>
	
	<h1>Votre commande</h1>
	
	<br>
	
	
	<c:choose>
		<c:when test="${empty articles}">
			<h2>Vous n'avez command&eacute; aucun article pour le moment.</h2>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>Code</th>
					<th>Nom</th>
					<th>Prix</th>
				</tr>
				<tr>
					<c:forEach items="${articles}" var="art">
						<tr>
							<td>${art.code}</td>
							<td>${art.nom}</td>
							<td>${art.prix	}</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	
	<br>
	
	<a href="/TWeb2_Exam/annuler_commande">Annuler la commande</a>
</body>
</html>