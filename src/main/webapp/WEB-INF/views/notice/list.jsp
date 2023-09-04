<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
			table {
				width : 800px;
				border : 1px solid black;
				border-collapse : collapse;
			}
			th, td {
				border : 1px solid black;
			}
		</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<main>
  <h1>공지사항 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>첨부파일</th>
			</tr>
		</thead>
		<tbody>
		<!-- list데이터는 items에 넣었고 var에서 설정한 변수로 list데이터에서  -->
		<!-- 꺼낸 값을 사용하고 i의 값은 varStatus로 사용한다.  -->
			<c:forEach var="notice" items="${nList }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }"> ${notice.noticeSubject }</a></td>
					<td>${notice.noticeWriter }</td>
					<td>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.nCreateDate }"/>
					</td>
					<td>
						<c:if test="${!empty notice.noticeFilename }">O</c:if>
						<c:if test="${empty notice.noticeFilename }">X</c:if>
					</td>
				<%-- 	<td>
						<fmt:formatNumber pattern="##,###,###" value="123000"></fmt:formatNumber>
					</td> --%>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr align="center">
			<td colspan="5">
				<c:if test="${pInfo.startNavi !=1 }">
					<c:url var="prevUrl" value="/notice/list.do">
						<c:param name="page" value="${pInfo.startNavi-1 }"></c:param>
					</c:url>
					<a href="${prevUrl }">[이전]</a>
					</c:if>
				<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
					<c:url var="pageUrl" value="/notice/list.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<a href="${pageUrl }">${p }</a>&nbsp;
				</c:forEach>
				<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
					<c:url var="postUrl" value="/notice/list.do">
					<c:param name="page" value="${pInfo.endNavi+1 }"></c:param>
					</c:url>
				<a href="${postUrl }">[다음]</a>
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="4">
		<form action="/notice/search.do" method="get">
			<select name="searchCondition">
				<option value="all">전체</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>			
				<input type="text" name="searchKeyword"placeholder="검색어를 입력하세요.">
				<input type="submit" value="검색">
			</form>	
			</td>
			<td>
				<a href="/notice/inset.do"><button> 글쓰기</button></a>
			</td>
			</tr>
		</tfoot>
	</table>
</body>
<script>
</script>
</html>