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
</style>
</head>
<body>
	<!-- ============search=============== -->
	<nav class="border-bottom border-dark sticky-top z-index-10">
		<div class="container" align="center">
			<div class="row p-3">
				<div class="col">

					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container-fluid">
							<a class="navbar-brand" href="../getBoardList.do">Villi</a>
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<!--================ nav bar ===================-->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
									<li class="nav-item">
										<!-- ================글작성버튼============= -->
										<div class="dropdown">
											<button class="btn dropdown-toggle" type="button"
												id="dropdownMenuButton2" data-bs-toggle="dropdown"
												aria-expanded="false">글작성</button>
											<ul class="dropdown-menu dropdown-menu-dark"
												aria-labelledby="dropdownMenuButton2">
												<li><a class="dropdown-item active"
													href="../board/board_insert.jsp">상품</a></li>
												<li><a class="dropdown-item"
													href="../board/board_sinsert.jsp">서비스</a></li>
												<li><a class="dropdown-item" href="#">동네생활</a></li>
											</ul>
										</div>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="../getQuestionList.do">우리동네질문</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="../getLostList.do">동네분실센터</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="../getMeetingList.do">동네모임</a></li>
									<li class="nav-item"><a class="nav-link"
										href="getVoteList.do">동네투표</a></li>
								</ul>
								<form action="getBoardList.do" method="post" id="boardForm">
									<input type="hidden" id="curPage" name="curPage"
										value="${searchVO.getCurPage()}"> <input type="hidden"
										id="rowSizePerPage" name="rowSizePerPage"
										value="${searchVO.getRowSizePerPage()}">
									<div class="container">
										<div class="row justify-content-md">
											<div class="col-md-auto">
												<select class="form-select" id="searchType"
													name="searchType">
													<option value="">검색</option>
													<option value="title"
														${searchVO.getSearchType()=="title" ? "selected" : ""}>제목</option>
													<option value="writer"
														${searchVO.getSearchType()=="writer" ? "selected" : "" }>작성자</option>
													<option value="cate2"
														${searchVO.getSearchType()=="cate2" ? "selected" : ""}>카테고리</option>
												</select>
											</div>
											<div class="col col-lg-6">
												<input class="form-control" name="searchWord" type="text" />
											</div>
											<div class="col col-lg-2">
												<button class="btn btn-outline-success" type="submit">Search</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</nav>
	<!-- ============================section================================ -->
	<section class="home-main-section" id="section1">
		<div class="container">
			<div class="row">
				<div class="col">
					<img class="img-fluid" alt="이웃과 함께하는 동네생활"
						src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/image-3-5fd6fb61d603ab919a45566b2ea6b505c83a93ec218f34ddcd5cb482543e2317.webp">
				</div>
				
				
				<div class="col align-self-center">
					<h1 class="home-main-title fw-bold">
						이웃과 함께 하는<br>동네생활
					</h1>
					<p class="text-m">우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
					<ul class="list-unstyled">
						<li class="home-story-list-item1">
							<div class="text-s text-bold mt-3 mb-2">
								<a href="../getQuestionList.do"
									class="btn btn-secondary rounded-pill">우리동네질문</a>
							</div>
							<div class="text-xs">궁금한 게 있을 땐 이웃에게 물어보세요.</div>
						</li>
						<li class="home-story-list-item2">
							<div class="text-s text-bold mt-3 mb-2">
								<a href="../getLostList.do"
									class="btn btn-secondary rounded-pill">동네분실센터</a>
							</div>
							<div class="text-xs">무언가를 잃어버렸을 때, 함께 찾을 수 있어요.</div>
						</li>
						<li class="home-story-list-item3">
							<div class="text-s text-bold mt-3 mb-2">
								<a href="../getMeetingList.do"
									class="btn btn-secondary rounded-pill">동네모임</a>
							</div>
							<div class="text-xs">관심사가 비슷한 이웃과 온오프라인으로 만나요.</div>
						</li>
						<li class="home-story-list-item4">
							<div class="text-s text-bold mt-3 mb-2">
								<a href="../getVoteList.do"
									class="btn btn-secondary rounded-pill">동네투표</a>
							</div>
							<div class="text-xs">동네 이웃들에게 물어보세요.</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>



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