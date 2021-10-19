<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<form method="get" action="AddColisServlet">
	<p> Enregistrement d'un colis</p>
	
	<div class="form-group row">
    	<label for="poids" class="col-sm-2 col-form-label">Poids :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="poids" name="poids">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="valeur" class="col-sm-2 col-form-label">Valeur :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="valeur" name="valeur">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="origine" class="col-sm-2 col-form-label">Origine :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="origine" name="origine">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="destination" class="col-sm-2 col-form-label">Destination :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="destination" name="destination">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="emplacement" class="col-sm-2 col-form-label">Emplacement :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="emplacement" name="emplacement">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="latitude" class="col-sm-2 col-form-label">Latitude :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="latitude" name="latitude">
    	</div>
  	</div>
  	
  	<div class="form-group row">
    	<label for="longitude" class="col-sm-2 col-form-label">Longitude :</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="longitude" name="longitude">
    	</div>
  	</div>	
 
	<p> Etat : 
	<select name="etat">
    <c:forEach items="${etats}" var="etat">
        <option>${etat}</option>
    </c:forEach>
	</select> 
	</p>
	

	
<p> <input type="submit" name="valider"  value="OK"> </p>
</form>

<a href="index.jsp">Annuler</a>

</body>
</html>