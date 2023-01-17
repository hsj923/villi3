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
	<div class="container border-bottom border-dark">
		<div class="row align-items-start mt-3 p-3 opacity-100">
		  <div class="col mt-2"><a href="#"><i class="fas fa-calendar fa-3x text-dark"></i></a></div>
		  <div class="col" align="center"><a href="../getBoardList.do"><img src="../resources/images/logo.png" alt="logo" width=90px height=90px ></a></div>
		  
		  <div class="col mt-2 text-end"><a href="#"><i class="fas fa-heart fa-3x text-dark"></i></a>
		  <span class="mx-4"><a href="getUserList.do"><i class="fas fa-user fa-3x text-dark"></i></a></span>
		  <span><a href="#"><i class="fas fa-search fa-3x text-dark" ></i></a></span>	
		  </div>
		</div>
	</div>	
</header>
	<!-- ====================================== -->
	
	<div class="container" >
		<div class="mt-4 p-3">
			<h3>게시물작성</h3>	
		</div>
	</div>

	                   <!-- 카테고리 -->
		<form action="insertBoard.do" method="post" enctype="multipart/form-data">	
				<div class="container px-9">
		  <div class="row gx-4">
		       <div class="col">
		  <select class="form-select form-select-lg mb-3" name="cate" aria-label=".form-select-lg example">
			  <option selected>게시물 카테고리</option>
			  <option value="상품">상품</option>
			  <option value="서비스">서비스</option>
			  <option value="동네">동네</option>
	     </select>
	      </div>
			     <div class="col">
		<select class="form-select form-select-lg mb-3" name="cate2" aria-label=".form-select-lg example">
			  <option selected>품목 카테고리</option>
			  <optgroup label="상품대여">
			  <option value="전자기기">전자기기</option>
			  <option value="공구용품">공구용품</option>
			  <option value="의류">의류</option>
			  <option value="주방/화장실용품">주방/화장실용품</option>
			  <option value="육아물품">육아물품</option>
			  <option value="도서/음반">도서/음반</option>
			  <option value="반려동물용품">반려동물용품</option>
			  <option value="뷰티용품">뷰티용품</option>
			  <option value="기타">기타</option>
			  </optgroup>
			  <optgroup label="서비스">
			  <option value="조립/설치/운반">조립/설치/운반</option>
			  <option value="동행돌봄">동행돌봄</option>
			  <option value="역할대행">역할대행</option>
			  <option value="청소/집안일">청소/집안일</option>
			  <option value="과외/알바">과외/알바</option>
			  <option value="배달">배달</option>
			  <option value="기타">기타</option>
			  </optgroup>
			  <optgroup label="동네생활">
			  <option value="분실신고">분실신고</option>
			  <option value="동네맛집">동네맛집</option>
			  <option value="혼술/혼밥">혼술/혼밥</option>
			  <option value="동네행사">동네행사</option>
			  <option value="동네질문">동네질문</option>
			  <option value="취미생활">취미생활</option>
			  <option value="일상">일상</option>
			  <option value="모임">모임</option>
			  <option value="잡담">잡담</option>
			  </optgroup>
	     </select>
			    </div>
		  </div>
	</div>
	
	<div class="container mt-3" align="center">
		<div class="input-group mb-3">
  				<span class="input-group-text"><i class="fas fa-user"></i></span>
  				<input type="text" class="form-control" name="writer" id="writer" placeholder="글 작성자....">
			</div>
			<div class="input-group mb-3">
  				<span class="input-group-text"><i class="fas fa-address-book"></i></span>
  				<input type="text" class="form-control" name="title" id="title"  placeholder="글 제목....">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text"><i class="fas fa-clipboard"></i></span>
			  <textarea class="form-control"  name="content" id="content"  rows="20" placeholder="글 상세내용...."></textarea>
			</div>	
			
			
								<!-- 파일첨부 -->
			<div class="input-group mb-3">
					          <label class="input-group-text" for="uploadFile1"><i class="fas fa-file"></i></label>
			  <input type="file" class="form-control" name="uploadFile1" id="uploadFile1" aria-describedby="uploadFile" aria-label="Upload">
			  
			  
			  				  <label class="input-group-text" for="uploadFile2"><i class="fas fa-file"></i></label>
			  <input type="file" class="form-control" name="uploadFile2" id="uploadFile2" aria-describedby="uploadFile" aria-label="Upload">
			  
			  
			  				  <label class="input-group-text" for="uploadFile4"><i class="fas fa-file"></i></label>
			  <input type="file" class="form-control" name="uploadFile3" id="uploadFile3" aria-describedby="uploadFile" aria-label="Upload">
			  
			  
			  				  <label class="input-group-text" for="uploadFile4"><i class="fas fa-file"></i></label>
			  <input type="file" class="form-control" name="uploadFile4" id="uploadFile4" aria-describedby="uploadFile" aria-label="Upload">
			  
			  
			  				  <label class="input-group-text" for="uploadFile5"><i class="fas fa-file"></i></label>
			  <input type="file" class="form-control" name="uploadFile5" id="uploadFile5" aria-describedby="uploadFile" aria-label="Upload">
			</div>	
			<input type="hidden" name="fileName" value=""/>		
				
			
			
			<div class="input-group input-group-lg mb-5">
			  <input type="submit" class="form-control btn btn-primary" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value=" 작성 ">
			</div>

			
<!-- 		    <input type="submit" class="input-group input-group-lg btn btn-primary" value="새글 작성 " />  -->
<!--  		    <button type="button" class="btn btn-primary" onclick="history.go(-1)">글 목록 가기</button> -->
			</div>
		</form>	
</body>
</html>









