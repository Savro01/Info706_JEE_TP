<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="get" action="AddColisServlet">
	<p> Enregistrement d'un colis</p>
	<p> Poids : <input name="poids"  type="text"> </p>
	<p> Valeur : <input name="valeur"  type="text"> </p>
	<p> Origine : <input name="origine"  type="text"> </p>
	<p> Destination : <input name="destination"  type="text"> </p>
	<p> Emplacement de départ : <input name="emplacement"  type="text"> </p>
	<p> Latitude : <input name="latitude"  type="text"> </p>
	<p> Longitude : <input name="longitude"  type="text"> </p>
	<p> Etat : 
	
	<select>
    <c:forEach items="${etats}" var="etat">
        <option>${etat}</option>
    </c:forEach>
	</select> 
	</p>
	
	
	
	
	
	<p> <input type="submit" name="valider"  value="OK"> </p>
		
	  </form>

</body>
</html>