<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수산시장</title>
<link rel="stylesheet" href="../resource/index.css">
<link rel="stylesheet" href="../resource/member.css">

<script src="../resource/index.js" defer></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resource/body.css">
<link rel="stylesheet" href="../resource/product .css">
<link rel="stylesheet" href="../resource/footer.css">
<link rel="stylesheet" href="../resource/slider.css">
<link rel="stylesheet" href="../resource/member.css">

</head>
<body>

	 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	</head>
	<body>
		<h1>마이페이지</h1>
		<form action="/member/update.do"" method="post">
			<input type="hidden" name="memberId" value="${member.memberId }">
		
			<fieldset>
				<legend>회원 상세 정보</legend>
				<ul>
					<li style= "list-style:none">
					<div class="enroll">
						<label for="member-id">아이디</label>
						<input type="text" id="member-id" name="memberId" value="${member.memberId }" > <!-- 기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</div>				
					</li>
					<li style= "list-style:none">
					<div class="enroll">
						<label for="member-pw">비밀번호</label>
						<input type="password" id="member-pw" name="memberPw"> <!-- 기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</div>
					</li>
					<li style= "list-style:none">
					<div class="enroll">
						<label for="member-email" >이메일</label>
						<input type="text" id="member-email" name="memberEmail" > 
					</div>
					</li>
					<li style= "list-style:none">
						<div class="enroll">
						<label for="member-phone">전화번호</label>
						<input type="text" id="member-age" name="memberPhone" > <!-- 기능을 위한 id, 쿼리스트링 생성을 위한 name -->
						</div>
					</li>
					
					<li style= "list-style:none">
						<div class="enroll">
						<label for="member-address">주소</label>
						<input type="text" id="member-address" name="memberAddress" value="${member.memberAddress }" > <!-- 기능을 위한 id, 쿼리스트링 생성을 위한 name -->
						</div>
					</li>
					
				</ul>
			</fieldset>
			 <div class="row text-center">
            <div class="col-md-6 col-sm-1 ">
			<button class="btn btn-primary btn-lg" id="editbtn"><a class="nav-link" href="/member/update.do?memberId=${member.memberId }">수정하기 </a></button>
			</div>			
            <div class="col-md-6 col-sm-1">
			<button class="btn btn-waring btn-lg"  id="editbtn"><a class="nav-link"href="/member/delete.do?memberId=${member.memberId }">삭제하기 </a></button>
			</div>
			</div>
		</form>

	</body>
</html>




