<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>동네생활</title>
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

<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

nav {
	background-color: #FFFAFA;
}

#section1 {
	background-color: #ECECEC;
}

#section2 {
	background-color: #FFFAFA;
}

#section3 {
	background-color: #F6FAF3;
}

.r_menu a {
	text-decoration: none;
	color: black;
	.
	card
	{
	margin-bottom
	:
	1rem;
}

.card-mtext {width =10px;height =10px;
	
}
</style>
</head>
<body>
	<!-- ===========header================ -->
	<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
				<div class="col mt-3">
					<a href="#"><i class="fas fa-calendar fa-2x text-dark"></i></a>
				</div>
				<div class="col" align="center">
					<a href="getBoardList.do"><img src="resources/images/test.png"
						alt="logo" width=70px height=70px></a>
				</div>

				<div class="col mt-3 text-end r_menu">
					<a href="#">좋아요</a> <span class="mx-4"><a href="login.do"
						class="btn btn-primary">로그인</a></span>
				</div>
			</div>
		</div>
	</header>



	<section class="home-main-section1" id="section2">
		<div class="container">
			<div class="row">

				<div class="col align-self-center">
					<h1 class="home-main-title fw-bold">
						어디서 빌리,지?<br>빌리
					</h1>
					<p class="text-m">
						대여 거래부터 동네 정보까지, 이웃과 함께해요.<br>가깝고 따뜻한 당신의 장소를 만들어요.
					</p>
					<div class="home-buttons">
						<p>빌리 동네가게 찾기</p>
					</div>
				</div>
				<div class="col">
					<img class="img-fluid" alt="이웃과의 거래, 동네생활 질문글과 동네가게"
						src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-2-f286322ab98acedf914a05bf77e84c67dcb897c8ccb543e66f6afea9d366d06d.png">
				</div>

			</div>
		</div>
	</section>


	<section class="home-main-section" id="section3">
		<div class="container">
			<div class="row">

				<div class="col">
					<img class="img-fluid" alt="이웃과의 거래, 동네생활 질문글과 동네가게"
						src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-2-f286322ab98acedf914a05bf77e84c67dcb897c8ccb543e66f6afea9d366d06d.png">
				</div>

				<div class="col align-self-center">
					<h1 class="home-main-title fw-bold">
						내 근처에서 찾는<br>동네가게
					</h1>
					<p class="text-m">
						우리 동네 가게를 찾고 있나요?<br>동네 주민이 남긴 진짜 후기를 함께 확인해보세요!
					</p>
					<div class="home-buttons">
						<p>빌리 동네가게 찾기</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>