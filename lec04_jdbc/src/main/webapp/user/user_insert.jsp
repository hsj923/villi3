<<<<<<< HEAD
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Spring Framework</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
=======
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
>>>>>>> 72909dc2d47a506b7d761cf82dae607754d7efde
</head>
<body>
	<div class="container" align="center">
		<div class="mt-4 p-5 bg-primary text-white rounded">
			<h3>???????????????</h3>
			<p>????????????.................</p>
		</div>
	</div>
<<<<<<< HEAD

	<div class="container mt-5">
		<form action="insertUser.do" method="post">

			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h1 class="motal-title fs-5" id="staticBackdropLabel">?????????????????????</h1>
				</div>
				<!-- modal-header -->

				<div class="modal-body">
					<div class="input-group mb-3">
						<div class="input-group-text">
							<i class="fas fa-user"></i>
						</div>
						<input type="text" name="id" class="form-control" id="id" required
							placeholder="User Id(email)....">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-text">
							<i class="fas fa-lock"></i>
						</div>
						<input type="password" name="password" class="form-control"
							id="password" required placeholder="Password....">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-text">
							<i class="fas fa-address-book"></i>
						</div>
						<input type="text" name="name" class="form-control" id="name"
							required placeholder="User Name....">
					</div>
					<div class="input-group mb-3">
						<input type="checkbox" name="role" class="input-group-text"
							id="role"> <label class="form-check-label ms-sm-2"
							for="role">?????????</label>
					</div>
				</div>
				<!-- modal-body -->

				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="history.go(-1)">Close</button>
					<button type="submit" class="btn btn-primary">Add User</button>
				</div>
				<!-- modal-footer -->
			</div>
			<!-- modal-content -->
		</form>
	</div>

</body>
</html>
=======
	
	<div class="container mt-5">
			<form action="insertUser.do" method="post">
			
				<div class="modal-content">				
					<div class="modal-header bg-primary text-white">
						<h1 class="motal-title fs-5" id="staticBackdropLabel">?????????????????????</h1>
					</div> <!-- modal-header -->
					
					<div class="modal-body">
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-user"></i></div>
							<input type="text" name="id" class="form-control" id="id" required placeholder="User Id(email)....">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-lock"></i></div>
							<input type="password" name="password" class="form-control" id="password" required placeholder="Password....">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fas fa-address-book"></i></div>
							<input type="text" name="name" class="form-control" id="name" required placeholder="User Name....">
						</div>
						<div class="input-group mb-3">
							<input type="checkbox" name="role" class="input-group-text" id="role">
							<label class="form-check-label ms-sm-2" for="role">?????????</label>
						</div>
					</div> <!-- modal-body -->
 					
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="history.go(-1)">Close</button>
						<button type="submit" class="btn btn-primary">Add User</button>
					</div> <!-- modal-footer -->
				</div> <!-- modal-content -->
			</form>	
	</div>
		
</body>
</html>		
>>>>>>> 72909dc2d47a506b7d761cf82dae607754d7efde
