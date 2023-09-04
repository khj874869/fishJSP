<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 실패</title>
	</head>
	<body>
		<h1>로그인 정보가 없습니다!</h1>
		<h2>${requestScope.msg }</h2>
	</body>
		<script>
			const result = ${msg };
			alert(result);
			window.location.href = "/login.do";
		</script>
</html>