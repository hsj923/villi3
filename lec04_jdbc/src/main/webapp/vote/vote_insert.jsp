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
</head>
<body>
	<!-- ===========header================ -->
	<header>
		<div class="container">
			<div class="row row-cols-auto">
				<!-- 로고 클릭시 뒤로가기  -->
				<div class="col">
					<button class="btn btn-outline-light" onclick="history.back()"
						style="border: 0;">
						<img src="../resources/images/logo.png" class="mt-3" alt="logo"
							width=90px height=90px>
					</button>
				</div>
				<div class="col">
					<h2 class="mt-4">(동네)"설문조사/투표"게시글</h2>
				</div>
			</div>
		</div>
	</header>



	<div class="container">
		<div
			class="border-bottom border-dark border-top border-dark mt-4 p-3 "
			align="center">
			<h4>"설문조사/투표"게시글 작성</h4>
		</div>
	</div>
	<form action="insertVote.do" method="post">
		<div class="container px-9">
			<div class="row gx-4">
				<div class="col mt-3">



					<!-- 			<div class="input-group mb-3"> -->
					<!--   				<span class="input-group-text"><i class="fas fa-user"></i></span> -->
					<!--   				<input type="text" class="form-control" name="writer" placeholder="글 작성자...."> -->
					<!-- 			</div> -->
					<div class="input-group mb-3">
						<span class="input-group-text"><i
							class="fas fa-address-book"></i></span> <input type="text"
							class="form-control" name="question" placeholder="질문">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text"><i
							class="fas fa-address-book"></i></span> <input type="text"
							class="form-control" name=item placeholder="item">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text"><i
							class="fas fa-address-book"></i></span> <input type="text"
							class="form-control" name="listnum" placeholder="리스트번호">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fas fa-clipboard"></i></span>
						<textarea class="form-control" name="itemnum" rows="20"
							placeholder="아이탬번호"></textarea>
					</div>

					<!-- 			<div class="input-group mb-3"> -->
					<!-- 			    <div class="input-group-text"><i class="fas fa-clipboard"></i></div> -->
					<!-- 				<input type="text" name="v_count1" class="form-control" id="v_count1" required placeholder="0" disabled> -->
					<!-- 			</div> -->
					<!-- 			<div class="input-group mb-3"> -->
					<!-- 			    <div class="input-group-text"><i class="fas fa-clipboard"></i></div> -->
					<!-- 				<input type="text" name="v_count2" class="form-control" id="v_count2" required placeholder="0" disabled> -->
					<!-- 			</div> -->
					<!-- 			<div class="input-group mb-3"> -->
					<!-- 			    <div class="input-group-text"><i class="fas fa-lock"></i></div> -->
					<!-- 				<input type="password" name="v_id" class="form-control" id="v_id" required placeholder="글번호를 입력해주세요"> -->
					<!-- 			</div> -->





					<div class="input-group input-group-lg mt-5 mb-5">
						<input type="submit" class="form-control btn btn-primary"
							onclick="insertVote()" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-lg" value=" 작성하기 ">
					</div>

				</div>
			</div>
		</div>
	</form>
</body>
</html>
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
</head>
<body>
                  <!-- ===========header================ -->
 <header>
  <div class="container">
    <div class="row row-cols-auto">
                        <!-- 로고 클릭시 뒤로가기  -->
       <div class="col"><button class="btn btn-outline-light" onclick="history.back()" style="border:0;"><img src="../resources/images/logo.png" class="mt-3" alt="logo" width=90px height=90px ></button></div> 
       <div class="col"><h2 class="mt-4">(동네)"설문조사/투표"게시글</h2></div>
    </div>
  </div>
</header>



	  <div class="container" >
		<div class="border-bottom border-dark border-top border-dark mt-4 p-3 " align="center">
			<h4>"설문조사/투표"게시글 작성</h4>	
		</div>
	</div> 
	<form action="insertVote.do" method="post">
		<div class="container px-9">
		  <div class="row gx-4">
		       <div class="col mt-3">
	     
			
			
<!-- 			<div class="input-group mb-3"> -->
<!--   				<span class="input-group-text"><i class="fas fa-user"></i></span> -->
<!--   				<input type="text" class="form-control" name="writer" placeholder="글 작성자...."> -->
<!-- 			</div> -->
			<div class="input-group mb-3">
  				<span class="input-group-text"><i class="fas fa-address-book"></i></span>
  				<input type="text" class="form-control" name="question" placeholder="질문">
			</div>
			<div class="input-group mb-3">
  				<span class="input-group-text"><i class="fas fa-address-book"></i></span>
  				<input type="text" class="form-control" name=item placeholder="item">
			</div>
			<div class="input-group mb-3">
  				<span class="input-group-text"><i class="fas fa-address-book"></i></span>
  				<input type="text" class="form-control" name="listnum" placeholder="리스트번호">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text"><i class="fas fa-clipboard"></i></span>
			  <textarea class="form-control"  name="itemnum" rows="20" placeholder="아이탬번호"></textarea>
			</div>			
			
<!-- 			<div class="input-group mb-3"> -->
<!-- 			    <div class="input-group-text"><i class="fas fa-clipboard"></i></div> -->
<!-- 				<input type="text" name="v_count1" class="form-control" id="v_count1" required placeholder="0" disabled> -->
<!-- 			</div> -->
<!-- 			<div class="input-group mb-3"> -->
<!-- 			    <div class="input-group-text"><i class="fas fa-clipboard"></i></div> -->
<!-- 				<input type="text" name="v_count2" class="form-control" id="v_count2" required placeholder="0" disabled> -->
<!-- 			</div> -->
<!-- 			<div class="input-group mb-3"> -->
<!-- 			    <div class="input-group-text"><i class="fas fa-lock"></i></div> -->
<!-- 				<input type="password" name="v_id" class="form-control" id="v_id" required placeholder="글번호를 입력해주세요"> -->
<!-- 			</div> -->
			
			
			
			
			
			 <div class="input-group input-group-lg mt-5 mb-5">
			  <input type="submit" class="form-control btn btn-primary"  onclick="insertVote()" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value=" 작성하기 ">
			</div>
	    
	      </div>
	     </div>
	   </div>
	</form>		
</body>
</html>   
>>>>>>> 72909dc2d47a506b7d761cf82dae607754d7efde
