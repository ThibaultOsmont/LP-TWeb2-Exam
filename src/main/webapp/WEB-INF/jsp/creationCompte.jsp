<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Création de compte</title>
<link href="<c:url value="/css/main.css"/>" rel="stylesheet">
</head>
<body>
	<h1>Enregistrez vous</h1>
	
	<form id="formCreationCompte" method="post" action="/TWeb2_Exam/saveAccount" onsubmit="return verifChamps()">
		<table>
			<tr>
				<td>Identifiant</td>
				<td><input type="text" id="id" name="id" /> <span>*</span></td>
			</tr>
			<tr>
				<td>Mot de passe</td>
				<td><input type="password" id="password" name="password" /> <span>*</span></td>
			</tr>
			<tr>
				<td>Mot de passe (confirm)</td>
				<td><input type="password" id="pwd_confirm" name="pwd_confirm"/> <span>*</span></td>
			</tr>
			<tr>
				<td>Pr&eacute;nom</td>
				<td><input type="text" id="nom" name="nom"/> <span>*</span></td>
			</tr>
			<tr>
				<td>Nom de famille</td>
				<td><input type="text" id="prenom" name="prenom"/> <span>*</span></td>
			</tr>
			<tr>
				<td>Adresse</td>
				<td><input type="text" name="addr"/></td>
			</tr>
			<tr>
				<td>Code Postal</td>
				<td><input type="text" name="zipcode"/></td>
			</tr>
			<tr>
				<td>Ville</td>
				<td><input type="text" name="ville"/></td>
			</tr>
			<tr>
				<td>Pays</td>
				<td><select id="pays" name="pays">
					<c:forEach items="${lpays}" var="pays">
						<option value="${pays.code}">${pays.nom} (${pays.code})</option>
					</c:forEach>
				</select></td>
			</tr>
		</table>
		<button type="submit">Enregistrer</button>
		<br>
		<p>* Champs Obligatoire</p>
	</form>
	
	<script type="text/javaScript">
		function verifChamps() {
			var submit = true;
			
			if(document.getElementById("id").value == "") {
				document.getElementById("id").style.border = "2px solid red";
				submit = false;
			} 
			else {
				document.getElementById("id").style.border = "1px solid black";
				submit = true;
			}
			
			if(document.getElementById("password").value == "") {
				document.getElementById("password").style.border = "2px solid red";
				submit = false;
			} 
			else {
				document.getElementById("password").style.border = "1px solid black";
				submit = true;
			}
			
			if(document.getElementById("pwd_confirm").value == "") {
				document.getElementById("pwd_confirm").style.border = "2px solid red";
				submit = false;
			} 
			else if(document.getElementById("password").value != null && document.getElementById("pwd_confirm").value != null && document.getElementById("pwd_confirm").value == document.getElementById("password").value){
				document.getElementById("pwd_confirm").style.border = "1px solid black";
				submit = true;
			}
			
			if(document.getElementById("nom").value == "") {
				document.getElementById("nom").style.border = "2px solid red";
				submit = false;
			} 
			else {
				document.getElementById("nom").style.border = "1px solid black";
				submit = true;
			}
			
			if(document.getElementById("prenom").value == "") {
				document.getElementById("prenom").style.border = "2px solid red";
				submit = false;
			} 
			else {
				document.getElementById("prenom").style.border = "1px solid black";
				submit = true;
			}
		
			return submit;
		}
	</script>
</body>
</html>