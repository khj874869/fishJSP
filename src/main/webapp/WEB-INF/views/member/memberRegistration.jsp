<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수산시장</title>
<link rel="stylesheet" href="../resource/index.css">
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

	<h1>회원가입</h1>
	<form id='erollForm' action="/member/register.do" method="post">
		<div id="enroll">
			<label for="username">아이디:</label> <input type="text" id="username"
				name="username" required placeholder="아이디를 입력해주세요.">
		</div>
		<div class="enroll">
			<label for="email">이메일:</label> <input type="email" id="email"
				name="email"  required placeholder="e-mail 주소를 입력해주세요.">
		</div>
		<div class="enroll">
			<label for="password">비밀번호:</label> <input type="password"
				id="password" name="password" required placeholder="비밀번호를 입력해주세요.">
		</div>
	
		<div class="enroll">
			<label for="member-name">이름</label> <input type="text"
				id="member-name" name="member-name" required
				placeholder="이름을 입력해주세요.">
		</div>
		<div class="enroll">
			<label for="member-address">주소</label> <input type="text" id="post0"
				name="member-address"  required placeholder="우편번호를 입력해주세요."> 
		</div>
		<div class="enroll">
			<label for="confirm-password">전화번호</label> <input type="text"
				id="member-phone" name="member-phone" required
				 placeholder="전화번호를 입력해주세요. ('하이픈' 제외')">
		</div>
		<div class="enroll">
			<label for="age">나이</label> <input type="text"
				id="age" name="age" required 
				placeholder="나이를 입력해주세요.">
		</div>
		<input type="submit" value="가입하기">
	</form>
</body>
<script>

</script>
</html>
