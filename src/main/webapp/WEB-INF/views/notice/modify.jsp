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
<script src="../resource/index.js" defer></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resource/body.css">
<link rel="stylesheet" href="../resource/product .css">
<link rel="stylesheet" href="../resource/footer.css">
<link rel="stylesheet" href="../resource/slider.css">
<link rel="stylesheet" href="../resource/notice.css">

<style>
		textarea {
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
	</style>
</head>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 
 <body>
 
 <h1>공지사항 작성</h1>
	<form action="/notice/modify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="noticeNo" value="${notice.noticeNo }" >
	<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
	<input type="hidden" name="fileRename" value="${notice.fileRename }">
	<input type="hidden" name="noticeFilepath" value="${notice.noticeFilepath }">
	<input type="hidden" name="noticeFilelength" value="${notice.noticeFilelength }">
	<fieldset> 
		<legend>공지사항 작성</legend>
			<ul>
 			<li>
 				<label>제목</label>
 				<input type="text" name="noticeSubject" value="${notice.noticeSubject }" >
 			</li>
 			<li>
 				<label>작성자</label>
 				<input type="text" name="noticeWriter" value="${notice.noticeWriter }">
 			</li>
 			<br>
 			<li>
 				<label>내용</label>
				<textarea rows="7" cols="100" name="noticeContent" value="${notice.noticeContent }"></textarea>
 			</li>
 			<li>
 				<label>첨부파일</label>
 			<img alt="첨부파일" src="../resources/nuploadFiles/${notice.noticeFilename }">			
			<a href="../resources/nuploadFiles/${notice.noticeFilename }" download>${notice.noticeFilename }</a>
 			<input type="file" name="uploadFile">
 			</li>
 		</ul>
 		<div>
 		<button type="button" onclick="showModifyPage();">수정하기</button>
 		<button>삭제하기</button>
 		</div>
 		
 		</fieldset>
	</form>
 	<script >
 		function showModifyPage(){
 			const noticeNo = "${notice.noticeNo}";
 			location.href="/notice/modify.do?noticeNo="+noticeNo;
 		}
	</script>
</body>
</html>