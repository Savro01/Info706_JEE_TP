<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Suivi Colis</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="header.css">
	</head>
	<body>

		<div id="div_header">
			<a href="./" id="header_home">Accueil</a>
			<a href="add" id="header_add">Ajouter un colis</a>
			<a href="follow" id="header_follow">Voir les colis</a>
		</div>
    
		<div id="div_table">
			<h3 id=title>Liste des colis</h3>
			
			<c:choose>
				<c:when test="${ allColis == [] }">
						<p>Aucun colis</p>
				</c:when>    
				<c:otherwise>
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><a href="?">#</a></th>
								<th scope="col">Poids</th>
								<th scope="col">Valeur</th>
								<th scope="col">Origine</th>
								<th scope="col">Destination</th>
								<th scope="col">Position</th>
								<th scope="col">Emplacement</th>
								<th scope="col">Etat <a href="?sort=etat"><i class="fa fa-sort"></i></a></th>
								<th scope="col">Actions</th>
								<th scope="col"></th>
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
												<td>
													<a href="https://www.google.com/maps/place/${colis.latitude},${colis.longitude}" target="_blank">
														${colis.latitude}, ${colis.longitude}
													</a>
												</td>
												<td>${colis.emplacement}</td>
												<td>${colis.etat}</td>
												<td>
													<form method="get" action="show">
														<input name="id" type="hidden" value="${colis.id}">
														<button type="submit" class="btn btn-info">Modifier</button>
													</form>
												</td>
												<td>
													<form action="" id="${colis.id}">
														<button type="button" class="btn btn-danger deleteButton">Supprimer</button>
													</form>
												</td>
									</tr>
							</c:forEach>
					
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<footer>Adrien Raffort - Romain Savaete - Info 706</footer>
	</body>

	<style>
	
		body{
			background-color: #ecf0f1;
		}
	
		#title {
			margin-bottom: 30px;
		}
		
		#div_table{
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  	
	<script type="text/javascript">
	$(document).ready(function() {
		toastr.options.timeOut = 1500; // 1.5s
		
		$('#submitButton').click(function() {
			$.ajax({
						url: 'edit',
						method: 'POST',
						data : $('#formToEdit').serialize(),

						success: (s) => {
							toastr.success("SUCCÈS", "Le colis a bien été modifié !!!");

							setTimeout(function(){
										location.reload();
							}, 2000);
																
						},
						error: (e) => {
							toastr.error("ERREUR");	        	    		        	    
						}
				})
			});

		$('.deleteButton').click(function() {

				var form = $(this).parents('form:first');
				var colisID = form.attr("id");
		
			Swal.fire({
				title: "Êtes vous sur ?",
				text: "Voulez-vous vraiment supprimer le colis " + colisID + " ?",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: 'Oui, supprimer !',
				cancelButtonText: 'Non, annuler !',
				reverseButtons: true
			}).then((result) => {
				if (result.isConfirmed) {

					$.ajax({
									url: 'follow',
									method: 'DELETE',
									data : { 
							id: colisID
								},

									success: (s) => {
										toastr.success("SUCCÈS", "Le colis " + colisID + " a bien été supprimé.");

										setTimeout(function(){
													location.reload();
										}, 2000);
																			
									},
									error: (e) => {
										toastr.error("ERREUR");	        	    		        	    
									}
							})
							
				} else if ( result.dismiss === Swal.DismissReason.cancel) {
					Swal.fire(
						'Annulé',
						"Rien n'a été supprimé",
						'error'
					)
				}
			})

										
			});

	});

	
	</script>
  	
</html>



