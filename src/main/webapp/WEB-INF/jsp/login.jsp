<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
</head>
<body>
	<h1>Login</h1>
	<br><br>
	
	<form id="formLogin" method="post" action="/TWeb2_Exam//login">
		<table>
			<tr>
				<td>Identifiant</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>Mot de passe</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<br>
		<button type="submit" id="connexion">OK</button>
		</form>
		<br>
	<p>Pas encore enregistr&eacute; ? <a href="/TWeb2_Exam/createAccount.html">Cr&eacute;ez votre compte</a><p> 
</body>

<script type="text/javascript" src="${context}/js/jquery-2.2.3.min.js"></script>
<script type="text/javaScript">
	$(document).ready(function() {
		alert("ok")
	});
</script>
</html>