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
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body class="bg-light">
	<!--                   ===========header================ -->
	<header>
		<div class="container border-bottom border-dark">
			<div class="row align-items-start mt-3 p-3 opacity-100">
				<div class="col mt-2">
					<a href="#"><i class="fas fa-calendar fa-3x text-dark"></i></a>
				</div>
				<div class="col" align="center">
					<a href="getBoardList.do"><img src="resources/images/logo.png"
						alt="logo" width=90px height=90px></a>
				</div>

				<div class="col mt-2 text-end">
					<a href="#"><i class="fas fa-heart fa-3x text-dark"></i></a> <span
						class="mx-4"><a href="getUserList.do"><i
							class="fas fa-user fa-3x text-dark"></i></a></span> <span><a href="#"><i
							class="fas fa-search fa-3x text-dark"></i></a></span>
				</div>
			</div>
		</div>
	</header>


	<!--==============================게시물 제목===============================   -->
	<div class="container">
		<div class="row my-3">
			<div class="col-12">
				<h4>${ vote.v_title }</h4>
			</div>
		</div>


		<!--==============================체크박스===============================   -->
		<div class="container mt-3">

			<div class="form-check">
				<input class="form-check-input" type="radio" name="flexRadioDefault"
					id="flexRadioDefault1" value="${ vote.v_count1 }"
					onclick="calculate(this)"> <label class="form-check-label"
					for="flexRadioDefault1"> ${ vote.v_item1 } </label>
			</div>


			<div class="form-check">
				<input class="form-check-input" type="radio" name="flexRadioDefault"
					id="flexRadioDefault2" value="${ vote.v_count2 }"
					onclick="calculate(this)"> <label class="form-check-label"
					for="flexRadioDefault2"> ${ vote.v_item2 } </label>
			</div>


			<c:if test="${ !empty  vote.v_item3}">
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault3"
						value="${ vote.v_count3 }" onclick="calculate(this)"> <label
						class="form-check-label" for="flexRadioDefault3"> ${ vote.v_item3 }
					</label>
				</div>
			</c:if>

			<c:if test="${ !empty  vote.v_item4}">
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" id="flexRadioDefault4"
						value="${ vote.v_count4 }" onclick="calculate(this)"> <label
						class="form-check-label" for="flexRadioDefault4"> ${ vote.v_item4 }
					</label>
				</div>
			</c:if>

			<!-- 이미지 -->
			<!--              <div class="card" style="width: 18rem;"> -->
			<%-- 				   <img src="resources/images/${ vote.v_item1Pic }" class="card-img-top" alt="img"> --%>
			<!-- 			 </div> -->

			<!--==============================차트생성===============================   -->
			<div class="row my-2">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<canvas id="myChart1"></canvas>
						</div>
						<div class="card-footer text-center text-dark">
							<h3>${ vote.v_con }</h3>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ==================부트스트랩====================== -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>


		<!--==============================파이형 차트===============================   -->
		<script>
  
//jstl변수 선언
  var list1 = '<c:out value="${ vote.v_item1 }"/>';
  var list2 = '<c:out value="${ vote.v_item2 }"/>';  
  var list3 = '<c:out value="${ vote.v_item3 }"/>';  
  var list4 = '<c:out value="${ vote.v_item4 }"/>';  
  var count1 = '<c:out value="${ vote.v_count1 }"/>';
  var count2 = '<c:out value="${ vote.v_count2 }"/>';
  var count3 = '<c:out value="${ vote.v_count3 }"/>';
  var count4 = '<c:out value="${ vote.v_count4 }"/>';
  
 
  data = {
        datasets: [{
            backgroundColor: ['#ebce10','#80dbd4','#a2a2a2','yellowgreen'],
            data: [count1, count2, count3, count4]
        }],       
        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
        labels: [list1,list2, list3, list4] 
    };

  // 가운데 구멍이 없는 파이형 차트
  var ctx1 = document.getElementById("myChart1");
  var myPieChart = new Chart(ctx1, {
      type: 'pie',
      data: data,
      options: {}
  });
  
  //체크박스 체크시 체크된 값 출력
  function calculate(box){
      if(box.checked) // 체크가 되면 checed==true라는 값을 전달받는다. 
          (box.value); //value속성을 이용
      document.getElementById("sumtext").value = parseInt(box.value)+1; //getElementById메소드 이용&value속성 변경
  }

  </script>

		<!-- ================================투표하기 버튼=============================== -->
		<!-- 체크된 값 -->
		<hr>
		<input type="text" id="sumtext" value="체크하시오" name="">
		<button type="button" id="vote" class="btn btn-success"
			onclick="alert(투표성공')">투표하기</button>
	</div>


	<div class="container mt-5" align="center">
		<a href="vote/vote_insert.jsp" class="btn btn-primary">글등록</a> <a
			href="getVoteList.do" class="btn btn-primary">글목록</a> <a
			href="report/report_insert.jsp" class="btn btn-danger">신고</a>
	</div>


</body>
</html>
