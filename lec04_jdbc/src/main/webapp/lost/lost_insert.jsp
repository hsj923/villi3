<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>동네분실센터 글쓰기</title>
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
												<li><a class="dropdown-item active" href="#">상품</a></li>
												<li><a class="dropdown-item" href="board_sinsert.jsp">서비스</a></li>
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

	<!-- 카테고리 -->
	<div class="container mt-3" align="center">
		<form action="insertLost.do" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col"></div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="writer" id="writer"
					placeholder="글 작성자....">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="title" id="title"
					placeholder="동네분실센터 제목....">
			</div>

			<div class="input-group mb-3">
				<textarea class="form-control" name="content" id="content" rows="20"
					placeholder="동네분실센터 상세내용...."></textarea>
			</div>

			<div class="input-group mb-3">
				<input type="date" class="form-control" name="lost_time" id="lost_time"
					placeholder="분실시간">
			</div>
			
			<div class="container mt-3">
				<div class="row">
					<div class="input-group mb-3">
						<div class="fs-5 col-sm-10 text-start">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								fill="currentColor" class="bi bi-alarm" viewBox="0 0 16 16">
  <path
									d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z" />
  <path
									d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z" />
</svg>
							시간
						</div>
						<div class="col-sm-2 text-end">
							<input type="time" class="form-control" name="lost_hour"
								id="lost_hour">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 파일첨부 -->

			<label for="formFile" class="form-label">사진은 최대 5장까지 등록가능합니다</label>
			<div class="input-group mb-3">

				<input type="file" class="form-control" name="uploadFile1"
					id="uploadFile1" aria-describedby="uploadFile" aria-label="Upload">
				<input type="file" class="form-control" name="uploadFile2"
					id="uploadFile2" aria-describedby="uploadFile" aria-label="Upload">


				<input type="file" class="form-control" name="uploadFile3"
					id="uploadFile3" aria-describedby="uploadFile" aria-label="Upload">
				<input type="file" class="form-control" name="uploadFile4"
					id="uploadFile4" aria-describedby="uploadFile" aria-label="Upload">


				<input type="file" class="form-control" name="uploadFile5"
					id="uploadFile5" aria-describedby="uploadFile" aria-label="Upload">
			</div>
			<input type="hidden" name="fileName" value="" />
			<div class="input-group input-group-lg mb-5">
				<input type="submit" class="form-control btn btn-outline-success"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-lg" value=" 완료 ">
			</div>
			<!-- 		    <input type="submit" class="input-group input-group-lg btn btn-primary" value="새글 작성 " />  -->
			<!--  		    <button type="button" class="btn btn-primary" onclick="history.go(-1)">글 목록 가기</button> -->
		</form>
	</div>
</body>
</html>









