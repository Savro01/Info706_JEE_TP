<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Page d'accueil</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="header.css">
		
	</head>
	<body>

		<div id="div_header">
			<a href="./" id="header_home">Accueil</a>
			<a href="add" id="header_add">Ajouter un colis</a>
			<a href="follow" id="header_follow">Voir les colis</a>
		</div>
		
		<div id="div_span">
			<span id="typed"></span>
		</div>
		
		
		<div id="div_suivi">
			<div class="form-group col-md-6">
				<label for="valeur"><h3>Entrez le numéro de suivi</h3></label>
				<input type="text" class="form-control" id="numero_suivi" name="valeur" placeholder="Ex : 197385628962">
			</div>
		</div>
		

	</body>

	<style>
		.space {
			margin:50px;
		}
		
		body {
			background-color: #ecf0f1;
		}
		
		#div_suivi{
			display: flex;
			width: 100vw;
			height: 60vh;
			justify-content: center;
			align-items: center;			
  		}
  		
  		#div_span {
  			text-align:center;
  			font-size: 30px;
  			font-weight: bold;
  		}
		
	</style>
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.12/typed.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
		        var typed = new Typed('#typed', {
		            strings: ['Bienvenue !', 'Welcome !', 'Bienvenido !', 'Willkommen !'],
		            backSpeed:10,
		            typeSpeed:100,
		            loop:true,
		            startDelay:1000
		        })
		    })

	</script>

</html>
