<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suivi Colis</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Poids</th>
      <th scope="col">Valeur</th>
      <th scope="col">Origine</th>
      <th scope="col">Destination</th>
      <th scope="col">Latitude</th>
      <th scope="col">Longitude</th>
      <th scope="col">Emplacement</th>
      <th scope="col">Etat</th>
    </tr>
  </thead>
  <tbody>

   <c:forEach items="${allColis}" var="colis">
         <tr>
              <th scope="row">${colis.id}</th>
              <td>${colis.poids}</td>
              <td>${colis.valeur}</td>
              <td>${colis.origine}</td>
              <td>${colis.destination}</td>
              <td>${colis.latitude}</td>
              <td>${colis.longitude}</td>
              <td>${colis.emplacement}</td>
              <td>${colis.etat}</td>
              <td>
                  <button type="button" class="btn btn-info">Modifier</button>
              </td>
              <td>
                  <button type="button" class="btn btn-danger">Supprimer</button>
              </td>
         </tr>
    </c:forEach>

  </tbody>
</table>

<a href="index.jsp">Retour</a>

</body>
</html>