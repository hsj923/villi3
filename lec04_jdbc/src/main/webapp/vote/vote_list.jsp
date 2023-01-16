<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>투표게시판</title>
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
							<a class="navbar-brand" href="getBoardList.do">Villi</a>
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<!-- ================글작성버튼============= -->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
									<li class="nav-item"><a class="nav-link active"
										aria-current="page" href="meeting/meeting_insert.jsp">글작성</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getQuestionList.do">우리동네질문</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getLostList.do">동네분실센터</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page" href="getMeetingList.do">동네모임</a></li>
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
												<select class="form-select" id="searchType"
													name="searchType">
													<option value="">검색</option>
													<option value="title"
														${searchVO.getSearchType()=="title" ? "selected" : ""}>제목</option>
													<option value="writer"
														${searchVO.getSearchType()=="writer" ? "selected" : "" }>작성자</option>
													<option value="cate"
														${searchVO.getSearchType()=="cate" ? "selected" : ""}>카테고리</option>
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

	<div class="container mt-3">
		<div class="row mt-4">
			<table class="table table-hover table-bordered">
				<thead class="table-dark">
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
				</thead>
				<tbody>
					<c:forEach var="vote" items="${ voteList }">
						<tr>
							<td><a href="getVote.do?id=${ vote.id }">${ vote.id }</a></td>
							<td>${ vote.question }</td>
							<td>${ vote.v_date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container mt-3">
		<div class="row align-items-start">

			<ul class="col pagination justify-content-center">
				<c:set var="cp" value="${ pageInfo.getCurrentPage() }" />

				<c:if test="${ pageInfo.getStartPage() != 1 }">
					<li class="page-item"><a href="getVoteList.do?p=1"
						class="page-link"><i class="fas fa-fast-backward"></i></a></li>
					<li class="page-item"><a
						href="getVoteList.do?p=${ pageInfo.getStartPage() - 10 }"
						class="page-link"><i class="fas fa-backward"></i></a></li>
				</c:if>

				<c:forEach var="page" begin="${ pageInfo.getStartPage() }"
					end="${ pageInfo.getEndPage() }">
					<li class="page-item ${ (cp==page) ? 'active' : ''}"><a
						href="getVoteList.do?p=${page}" class="page-link">${page}</a></li>
				</c:forEach>

				<c:if test="${ pageInfo.getEndPage() < pageInfo.getTotalPages() }">
					<li class="page-item"><a
						href="getVoteList.do?p=${ pageInfo.getEndPage() + 1 }"
						class="page-link"><i class="fas fa-forward"></i></a></li>
					<li class="page-item"><a
						href="getVoteList.do?p=${ pageInfo.getTotalPages() }"
						class="page-link"><i class="fas fa-fast-forward"></i></a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<div class="container-lg mt-10 bg-white" align="right">
		<a href="vote/vote_insert.jsp"
			class="w-20 p-3 col-1 mt-3 btn btn-secondary">글작성</a>
	</div>
</body>
</html>
</body>
</html>
