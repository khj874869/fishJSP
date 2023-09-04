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
<style >
 a:link { color: white; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<main>
	<table>
	<colgroup>
		<col width="250px"/>
		<col />
	</colgourp>
	<tbody>
	<ul>
	<tr>
			<td>
			<li style= "list-style:none">
				<label>글번호</label>
					<span>${notice.noticeNo }</span>
			</li>
			</td>
	</tr>
		<tr>
	<td>
			<li style= "list-style:none" >
				<label>작성일</label>
				<span>${requestScope.notice.nCreateDate }</span>
			</li>
				</td>
	</tr>
	<tr>
	<td>
			<li style= "list-style:none">
				<label>글쓴이</label>
					<span>${notice.noticeWriter }</span>
				</li>
				</td>
	</tr>
	<tr>
	<td>
			
			<li style= "list-style:none" >
				<label>제목</label>
					<span>${notice.noticeSubject }</span>
			</li>
						</td>
	</tr>
			<tr>
	<td>
				<li style= "list-style:none" >
				<label>내용</label>
				<p>${notice.noticeContent}</p>
				</li>
								</td>
	</tr>
	<tr>
	<td>
	<li>
 				<label>첨부파일</label>
 				<!-- String으로 받을 수 없고 변환하는 작업이 필요하다. -->
				<img alt="첨부파일" src="../resources/nuploadFiles/${notice.noticeFilename }">			
			<a href="../resources/nuploadFiles/${notice.noticeFilename }" download>${notice.noticeFilename }</a>
 			</li>
 	</td>
 	</tr>
	 <div id ="tablebtn">
	<a href="/notice/list.do?currentPage=${noticeNo %100}"><button class="editBtn">목록으로 이동하기</button></a>
	<a href="/notice/modify.do?noticeNo=${notice.noticeNo }"><button class="editBtn" id="eidt">수정하기</button></a>
	<a href="/notice/delete.do?noticeNo=${notice.noticeNo }"><button class="editBtn"  id="delete">삭제하기</button></a>
		 </div>
		
			</ul>
	</tbody>
	</table>
		<table width="550" border="1">
				<c:forEach var="reply" items="${rList }">
					<tr>
						<td>${reply.replyWriter }</td>
						<td>${reply.replyContent }</td>
						<td>${reply.rCreateDate }</td>
						<td>
							<a href="javascript:void(0);" onclick="showReplyModifyForm(this,'${reply.replyContent}');">수정하기</a>
							<a href="#">삭제하기</a>
						</td>
					</tr>
					<tr id="replyModifyForm" style="display:none;">
<!-- 						<form action="/reply/update.kh" method="post"> -->
<%-- 							<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
<%-- 							<input typeC="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
<%-- 							<td colspan="3"><input type="text" size="50" name="replyContent" value="${reply.replyContent }"></td> --%>
<!-- 							<td><input type="submit" value="완료"></td> -->
<!-- 						</form> -->
							<td colspan="3"><input id="replyContent" type="text" size="50" name="replyContent" value="${reply.replyContent }"></td>
							<td><input type="button" onclick="replyModify(this,'${reply.replyNo}','${reply.refBoardNo }');" value="완료"></td>
					</tr>
				</c:forEach>
			</table>
</main>
<script>
				function showModifyPage() {
					const boardNo = "${board.boardNo }";
					location.href="/board/modify.kh?boardNo="+boardNo;
				}
				function showNoticeList() {
					location.href="/board/list.kh";
				}
				function replyModify(obj, replyNo, refBoardNo) {
					const form = document.createElement("form");
					form.action = "/reply/update.kh";
					form.method = "post";
					const input = document.createElement("input");
					input.type = "hidden";
					input.value = replyNo;
					input.name = "replyNo";
					const input2 = document.createElement("input");
					input2.type ="hidden";
					input2.value = refBoardNo;
					input2.name = "refBoardNo";
					const input3 = document.createElement("input");
					input3.type = "text";
// 					input3.value = document.querySelector("#replyContent").value;
					input3.value = obj;
					input3.name = "replyContent";
					form.appendChild(input);
					form.appendChild(input2);
					form.appendChild(input3);
					
					document.body.appendChild(form);
					form.submit();
				}
				function showReplyModifyForm(obj, replyContent) {
					
// 					document.querySelector("#replyModifyForm").style.display="";
					obj.parentElement.parentElement.nextElementSibling.style.display="";

					
				// 					<tr id="replyModifyForm" style="display:none;">
// 						<td colspan="3"><input type="text" size="50" value="${reply.replyContent }"></td>
// 						<td><input type="button" value="완료"></td>
// 					</tr>
// 					const trTag = document.createElement("tr");
// 					const tdTag1 = document.createElement("td");
// 					tdTag1.colSpan = 3;
// 					const inputTag1 = document.createElement("input");
// 					inputTag1.type="text";
// 					inputTag1.size=50;
// 					inputTag1.value=replyContent;
// 					tdTag1.appendChild(inputTag1);
// 					const tdTag2 = document.createElement("td");
// 					const inputTag2 = document.createElement("input");
// 					inputTag2.type="button";
// 					inputTag2.value="완료";
// 					tdTag2.appendChild(inputTag2);
// 					trTag.appendChild(tdTag1);
// 					trTag.appendChild(tdTag2);
// 					console.log(trTag);
					// 클릭한 a를 포함하고 있는 tr 다음에 수정폼이 있는 tr 추가하기
// 					const prevTrTag = obj.parentElement.parentElement;
// 					if(prevTrTag.nextElementSibling == null || !prevTrTag.nextElementSibling.querySelector("input"))
// 					prevTrTag.parentNode.insertBefore(trTag, prevTrTag.nextSibling);

				}
			</script>
</body>
	
</html>