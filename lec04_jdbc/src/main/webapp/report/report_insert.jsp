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
					<h2 class="mt-4">신고페이지</h2>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div
			class="border-bottom border-dark border-top border-dark mt-4 p-3 "
			align="center">
			<h4>"게시글"을 신고하는 이유를 선택해주세요</h4>
		</div>
	</div>
	<form action="insertReport.do" method="post">
		<div class="container px-9">
			<div class="row gx-4">
				<div class="col mt-3">
					<select class="form-select form-select-lg mb-3" name="r_rs1"
						aria-label=".form-select-lg example">
						<option selected>신고이유1</option>
						<option value="전문 판매업자 같아요">전문 판매업자 같아요</option>
						<option value="비매너 사용자예요">비매너 사용자예요</option>
						<option value="욕설을 해요">욕설을 해요</option>
						<option value="광고 / 허위글이에요">광고 / 허위글이에요</</option>
						<option value="성희롱을 해요">성희롱을 해요</option>
						<option value="사기 사용자에요">사기 사용자에요</option>
						<option value="게시글을 잘못올렸어요">게시글을 잘못올렸어요</option>
						<option value="거래 / 환불분쟁">거래 / 환불분쟁</option>
						<option value="기타">기타</option>
					</select> <select class="form-select form-select-lg mb-3" name="r_rs2"
						aria-label=".form-select-lg example">
						<option selected>신고이유2</option>
						<option value="전문 판매업자 같아요">전문 판매업자 같아요</option>
						<option value="비매너 사용자예요">비매너 사용자예요</option>
						<option value="욕설을 해요">욕설을 해요</option>
						<option value="광고 / 허위글이에요">광고 / 허위글이에요</</option>
						<option value="성희롱을 해요">성희롱을 해요</option>
						<option value="사기 사용자에요">사기 사용자에요</option>
						<option value="게시글을 잘못올렸어요">게시글을 잘못올렸어요</option>
						<option value="거래 / 환불분쟁">거래 / 환불분쟁</option>
						<option value="기타">기타</option>
					</select> <select class="form-select form-select-lg mb-3" name="r_rs3"
						aria-label=".form-select-lg example">
						<option selected>신고이유3</option>
						<option value="전문 판매업자 같아요">전문 판매업자 같아요</option>
						<option value="비매너 사용자예요">비매너 사용자예요</option>
						<option value="욕설을 해요">욕설을 해요</option>
						<option value="광고 / 허위글이에요">광고 / 허위글이에요</</option>
						<option value="성희롱을 해요">성희롱을 해요</option>
						<option value="사기 사용자에요">사기 사용자에요</option>
						<option value="게시글을 잘못올렸어요">게시글을 잘못올렸어요</option>
						<option value="거래 / 환불분쟁">거래 / 환불분쟁</option>
						<option value="기타">기타</option>
					</select>
					<div class="input-group mb-3">
						<span class="input-group-text"><i class="fas fa-clipboard"></i></span>
						<textarea class="form-control" name="r_con" id="r_con" rows="20"
							placeholder="구체적인 사항을 적어주세요"></textarea>
					</div>
					<div class="input-group mb-3">
						<c:forEach var="board" items="${ boardList }">
							<input type="number" name="r_seq" class="form-control" id="r_seq"
								value="${ board.seq }">
						</c:forEach>
					</div>
					<div class="input-group input-group-lg mt-5 mb-5">
						<input type="submit" class="form-control btn btn-primary"
							onclick="insertReport()" aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-lg" value=" 신고하기 ">
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		function insertReport() {
			if (confirm("게시물을 신고하시겠습니까?")) {
				self.location.href = "report_insert";
			}
		}
	</script>
</body>
</html>
