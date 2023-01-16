<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>글 목록</title>
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

header {
	background-color: #FFFAFA;
}

nav {
	background-color: #FFFAFA;
}

#banner2 {
	background-color: #ebecf0;
}

</style>
</head>
<body>
	<!-- ===========header================ -->
	<header class="border-bottom border-white">
		<div class="container">
			<div class="row align-items-start p-3">
				<div class="col mt-2">
					<a href="#"><i class="fas fa-calendar fa-2x text-dark"></i></a>
				</div>
				<div class="col" align="center">
					<a href="getBoardList.do"><img src="resources/images/logo.png"
						alt="logo" width=70px height=70px></a>
				</div>

				<div class="col mt-2 text-end">
					<a href="#"><i class="fas fa-heart fa-2x text-dark"></i></a> <span
						class="mx-4"><a href="getUserList.do"><i
							class="fas fa-user fa-2x text-dark"></i></a></span> <span><a href="#"><i
							class="fas fa-search fa-2x text-dark"></i></a></span>
				</div>
			</div>
		</div>
	</header>
	<!-- ============banner=============== -->

	<div id="carouselExampleControls"
		class="carousel carousel-dark slide border-bottom border-dark"
		data-bs-ride="carousel" align="center">

		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleControls"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleControls"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleControls"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div
				class="carousel-item active embed-responsive embed-responsive-4by3"
				id="banner1">
				<img src="resources/images/1.png"
					class="d-block w-50 card-img-top embed-responsive-item"
					alt="banner1" width="300" height="600">
			</div>
			<div class="carousel-item embed-responsive embed-responsive-4by3"
				id="banner2">
				<img src="resources/images/2.png"
					class="d-block w-50 card-img-top embed-responsive-item"
					alt="banner2" width="300" height="600">
			</div>
			<div class="carousel-item embed-responsive embed-responsive-4by3"
				id="banner3">
				<img src="resources/images/3.png"
					class="d-block w-50 card-img-top embed-responsive-item"
					alt="banner3" width="300" height="600">
			</div>
		</div>
	</div>
	<!-- ============search=============== -->
	<nav class="border-bottom border-dark sticky-top z-index-10">
		<div class="container" align="center">
			<div class="row p-3">
				<div class="col">

					<nav class="navbar navbar-expand-lg navbar-light">
						<div class="container-fluid">
							<a class="navbar-brand" href="getBoardList.do">Villi</a>
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
													href="board/board_insert.jsp">상품</a></li>
												<li><a class="dropdown-item" href="#">서비스</a></li>
												<li><a class="dropdown-item" href="#">동네생활</a></li>
											</ul>
										</div>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getQuestionList.do">우리동네질문</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getLostList.do">동네분실센터</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getMeetingList.do">동네모임</a></li>
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




	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>


	<!-- =========상품보기=============== -->
	<!-- ======================LIST========================= -->

	<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<div class="container mt-1">
		<div class="col" align="center">
			<table>
				<c:choose>
					<c:when test="${boardList != null && fn:length(boardList) > 0 }">
						<c:forEach items="${boardList}" var="board">
							<c:if test="{i%j == 0}">
								<tr>
							</c:if>

							<!-- 사진이 있으면 -->
							<c:if test="${ !empty  board.fileName1}">
								<td align="center"><img
									src="resources/images/${ board.fileName1 }"
									class="d-block w-50 card-img-top embed-responsive-item border border-dark mt-3"
									alt="img" width="350" height="350">
							</c:if>
							<!-- 사진이 없으면 -->
							<c:if test="${ empty  board.fileName1}">
								<td align="center"><img src="resources/images/noimg.png"
									class="d-block w-50 card-img-top embed-responsive-item border border-dark mt-3"
									alt="img" width="350" height="350">
							</c:if>

							<div class="badge text-wrap" style="width: 20rem;">
								<a href="getBoard.do?seq=${board.seq}"
									style="text-decoration: none">
									<p class="fs-4">(${board.cate})${board.title}</p>
								</a>
							</div>
							<div class="container">
								<div class="row justify-content-md-center">
									<div class="col-md-auto">작성자 : ${board.writer}</div>

									<div class="col-md-auto bg-success text-white">
										${board.status}</div>
								</div>
							</div>
							<p class="fs-6">등록일 : ${board.regDate}</p>
							</td>
							<c:if test="${i%j == j-1}">
								</tr>
							</c:if>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>


	<!-- =======================LIST 끝========================== -->


	<!--====== admin일경우 사용자관리 및 신고글관리============  -->
	<c:if test="${ sessionScope.isAdmin }">
		<a href="getUserList.do" class="btn btn-primary">사용자관리</a>
	</c:if>

	<c:if test="${ sessionScope.isAdmin }">
		<a href="getReportList.do" class="btn btn-primary">신고글관리</a>
	</c:if>



	<!-- ==================페이징============== -->

	<div class="row align-items-start mt-3">
		<ul class="col pagination justify-content-center">

			<c:set var="cp" value="${searchVO.getCurPage()}" />
			<c:set var="rp" value="${searchVO.getRowSizePerPage()}" />
			<c:set var="fp" value="${searchVO.getFirstPage()}" />
			<c:set var="lp" value="${searchVO.getLastPage()}" />
			<c:set var="ps" value="${searchVO.getPageSize()}" />
			<c:set var="tp" value="${searchVO.getTotalPageCount()}" />
			<c:set var="sc" value="${searchVO.getSearchCategory()}" />
			<c:set var="st" value="${searchVO.getSearchType()}" />
			<c:set var="sw" value="${searchVO.getSearchWord()}" />

			<c:if test="${ fp != 1 }">
				<li class="page-item"><a
					href="getBoardList.do?curPage=1&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
					class="page-link"><i class="fas fa-fast-backward"></i></a></li>
				<li class="page-item"><a
					href="getBoardList.do?curPage=${fp-1}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
					class="page-link"><i class="fas fa-backward"></i></a></li>
			</c:if>

			<c:forEach var="page" begin="${fp}" end="${lp}">
				<li class="page-item ${cp==page ? 'active' : ''}"><a
					href="getBoardList.do?curPage=${page}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
					class="page-link">${page}</a></li>
			</c:forEach>

			<c:if test="${ lp < tp }">
				<li class="page-item "><a
					href="getBoardList.do?curPage=${lp+ps}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
					class="page-link"><i class="fas fa-forward"></i></a></li>
				<li class="page-item"><a
					href="getBoardList.do?curPage=${tp}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}"
					class="page-link"><i class="fas fa-fast-forward"></i></a></li>
			</c:if>
		</ul>
		<!-- pagination -->
	</div>
	<!-- 페이징 -->
</body>
</html>