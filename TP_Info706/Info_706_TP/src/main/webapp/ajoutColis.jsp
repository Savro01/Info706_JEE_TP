<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajout colis</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="header.css">
	</head>

	<body>

		<div id="div_header">
			<a href="./" id="header_home">Accueil</a>
			<a href="add" id="header_add">Ajouter un colis</a>
			<a href="follow" id="header_follow">Voir les colis</a>
		</div>

		<div id=div_add>
			<h2 id="title"> Enregistrement d'un colis</h2>
			
			<form id="formToAdd">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="poids">Poids</label>
							<input type="text" class="form-control" id="poids" name="poids" placeholder="Poids en kg">
						</div>
						<div class="form-group col-md-6">
							<label for="valeur">Valeur</label>
							<input type="text" class="form-control" id="valeur" name="valeur" placeholder="Valeur en €">
						</div>
					</div>
						
					
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="origine">Origine</label>
							<input type="text" class="form-control" id="origine" name="origine" placeholder="Ex: Le Bourget-Du-Lac">
						</div>
						<div class="form-group col-md-6">
							<label for="destination">Destination</label>
							<input type="text" class="form-control" id="destination" name="destination" placeholder="Ex: Paris">
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="emplacement">Emplacement</label>
								<input type="text" class="form-control" id="emplacement" name="emplacement" placeholder="Ex: Entrepôt">
						</div>
					</div>
					
					
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="latitude">Latitude</label>
							<input type="text" class="form-control" id="latitude" name="latitude" placeholder="Ex: 46.382">
						</div>
						<div class="form-group col-md-6">
							<label for="longitude">Longitude</label>
							<input type="text" class="form-control" id="longitude" name="longitude" placeholder="Ex: 54.827">
						</div>
				</div>
					
					
			
				
				
				<button id="submitButton" type="button" class="btn btn-info btn-lg btn-block">Valider</button>
				
			
			</form>
		</div>


		<footer>Adrien Raffort - Romain Savaete - Info 706</footer>

	</body>

	<style>
		
		#title {
			margin-bottom: 30px;
		}
		
		body{
			background-color: #ecf0f1;
		}
		
		#div_add{
			margin-left: 150px;
			margin-right: 150px;
			background-color: white;
			padding : 20px;
			box-shadow: 5px 5px 5px #bdc3c7;
			margin-bottom : 50px;
		}
		
		#submitButton {
			margin-top: 20px;
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
							url: 'addPost',
							method: 'POST',
							data : $('#formToAdd').serialize(),

							success: (s) => {
								toastr.success("SUCCES", "Le colis à bien été ajouté !!!");

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


