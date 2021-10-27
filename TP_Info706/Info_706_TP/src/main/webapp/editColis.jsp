<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Colis ${colis.id}</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="header.css">
	</head>

	<body>
		<div id="div_header">
			<a href="./" id="header_home">Accueil</a>
			<a href="add" id="header_add">Ajouter un colis</a>
			<a href="follow" id="header_follow">Voir les colis</a>
		</div>
    
		<div id="div_edit">
			<h4 class="title">Edition du colis n° ${colis.id}</h4>
			
			<form id="formToEdit" class="">
			
				<input type="hidden" name="id" value="${colis.id}">
				
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="poids">Poids</label>
							<input type="text" class="form-control" id="poids" name="poids" value="${colis.poids}" disabled>
						</div>
						<div class="form-group col-md-6">
							<label for="valeur">Valeur</label>
							<input type="text" class="form-control" id="valeur" name="valeur" value="${colis.valeur}" disabled>
						</div>
					</div>
						
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="origine">Origine</label>
							<input type="text" class="form-control" id="origine" name="origine" value="${colis.origine}" disabled>
						</div>
						<div class="form-group col-md-6">
							<label for="destination">Destination</label>
							<input type="text" class="form-control" id="destination" name="destination" value="${colis.destination}" disabled>
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="emplacement">Emplacement</label>
								<input type="text" class="form-control" id="emplacement" name="emplacement" placeholder="Ancien : ${colis.emplacement}">
						</div>
					</div>
						
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="latitude">Latitude</label>
							<input type="text" class="form-control" id="latitude" name="latitude" placeholder="Ancien : ${colis.latitude}">
						</div>
						<div class="form-group col-md-6">
							<label for="longitude">Longitude</label>
							<input type="text" class="form-control" id="longitude" name="longitude" placeholder="Ancien : ${colis.longitude}">
						</div>
				</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="etat">Nouvel etat</label>
							<select name="etat" class="form-control">
									<option selected disabled>Choisir un nouvel état</option>
								<c:forEach items="${etats}" var="etat">
										<option>${etat}</option>
								</c:forEach>
							</select> 
						</div>
						
						<div class="form-group col-md-6">
							<button type="button" id="submitButton" class="btn btn-info btn-lg btn-block">Modifier le colis</button>
						</div>
				</div>
					
					
			
				
				
				
			
			</form>
		</div>

		<div id="div_historic">
			<h4 class="title">Historique du colis</h4>

			<table class="table">
				<thead>
					<tr>
						<th scope="col">Date</th>
						<th scope="col">Position</th>
						<th scope="col">Emplacement</th>
						<th scope="col">Etat</th>
					</tr>
				</thead>
				<tbody>
			
				<c:forEach items="${history}" var="h">
							<tr>
										<th scope="row">${h.date}</th>
										<td>
											<a href="https://www.google.com/maps/place/${h.latitude},${h.longitude}" target="_blank">
													${h.latitude}, ${h.longitude}
										</a>
									</td>
										<td>${h.emplacement}</td>
										<td>${h.etat}</td>
							</tr>
					</c:forEach>
			
				</tbody>
			</table>
		</div>
	</body>

	<footer>Adrien Raffort - Romain Savaete - Info 706</footer>

	<style>
	
		body{			
			background-color: #ecf0f1;
		}
		
		.title {
			margin-bottom: 30px;
		}
		
		#submitButton{
			margin-top:30px;
		}

		#div_edit, #div_historic {
			background-color: white;
			padding : 20px;
			box-shadow: 5px 5px 5px #bdc3c7;
			margin-bottom : 50px;
			
			margin-left: 150px;
			margin-right: 150px;
		}
	
	</style>



	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
  	
  <script type="text/javascript">
	  $(document).ready(function() {
	    toastr.options.timeOut = 1500;

	    $('#submitButton').click(function() {
	    	$.ajax({
	            url: 'edit',
	            method: 'POST',
	            data : $('#formToEdit').serialize(),

	            success: (s) => {
	        	    toastr.success("SUCCES", "Le colis à bien été modifié !!!");

	        	    setTimeout(function(){
	                    location.reload();
	        	    }, 2000);
	        	    		        	    
	            },
	            error: (e) => {
	        	    toastr.error("ERREUR");	        	    		        	    
	            }
	        })
	     });
	
	  });
  </script>

</html>