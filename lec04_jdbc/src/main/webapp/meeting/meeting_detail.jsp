<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>동네모임 상세보기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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

</style>
</head>
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
											<li><a class="dropdown-item active" href="#">상품</a></li>
											<li><a class="dropdown-item"
												href="../board/board_sinsert.jsp">서비스</a></li>
											<li><a class="dropdown-item"
												href="../dongnae/dongnae_main.jsp">동네생활</a></li>
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
							<form action="getMeetingList.do" method="post" id="meetingForm">
								<input type="hidden" id="curPage" name="curPage"
									value="${searchVO.getCurPage()}"> <input type="hidden"
									id="rowSizePerPage" name="rowSizePerPage"
									value="${searchVO.getRowSizePerPage()}">
								<div class="container">
									<div class="row justify-content-md">
										<div class="col-md-auto">
											<select class="form-select" id="searchType" name="searchType">
												<option value="">검색</option>
												<option value="title"
													${searchVO.getSearchType()=="title" ? "selected" : ""}>제목</option>
												<option value="writer"
													${searchVO.getSearchType()=="writer" ? "selected" : "" }>작성자</option>
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






<!-- <div class="container"> -->
<!-- 	<div class="row">  -->
<!-- 		<div class="col align-self-start"> -->
<!-- 			<span><svg xmlns="http://www.w3.org/2000/svg" width="30" -->
<!-- 					height="30" fill="currentColor" class="bi bi-person-add" -->
<!-- 					viewBox="0 0 16 16"> -->
<!-- 								<path -->
<!-- 						d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" /> -->
								
<!-- 								<path -->
<!-- 						d="M8.256 14a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z" /> -->
<%-- </svg></span> <span>${ meeting.per }</span> --%>
<!-- 		</div> -->
		
<!-- 		<div class="col align-self-start"> -->
<!-- 			<span><svg xmlns="http://www.w3.org/2000/svg" width="30" -->
<!-- 					height="30" fill="currentColor" class="bi bi-calendar-check" -->
<!-- 					viewBox="0 0 16 16"> -->
<!--   <path -->
<!-- 						d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" /> -->
<!--   <path -->
<!-- 						d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" /> -->
<%-- </svg></span> <span>${ meeting.meet_date }, ${ meeting.meet_time }</span> --%>
<!-- 		</div> -->
<!-- 		<div class="col align-self-start"> -->
<!-- 			<span><svg xmlns="http://www.w3.org/2000/svg" width="30" -->
<!-- 					height="30" fill="currentColor" class="bi bi-geo-alt" -->
<!-- 					viewBox="0 0 16 16"> -->
<!--   <path -->
<!-- 						d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" /> -->
<!--   <path -->
<!-- 						d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" /> -->
<%-- </svg></span> <span>${ meeting.place }</span> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



</body>
</html>
