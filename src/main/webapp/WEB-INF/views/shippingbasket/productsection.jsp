<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="../resource/shipping.css">
<script>
	${document}.ready(function(){
		${"#btnList"}.click(function(){
			location.href="${path}/shop/product/list.do";			
		})
	})

</script>
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<h1>장바구니</h1>
	<h2>상품상세정보</h2>
	<table border="1">
		<tr>
			<td>
				<img src="${path }/image/${Product.productUrl}" width="340" height="300">
			</td>
			<td>
				<table border="1" style="height:300px; width:400px;">
					<tr align="center">
						<td>상품명</td>
						<td> ${product.productName }</td>	
		</tr>		
		<tr align="center">
			<td>가격</td> 
			<td><fmt:formatNumber value="${product.productPrice }" pattern="###,###,###"/></td>
		</tr>
		<tr align="center">
			<td>상품소개</td> 
			<td>${product.productDesc }</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<form name="form1" method="post" action="${path }/shop/cart/insert.do" >
					<input type="hidden"  name="productId" value="${product.productId }">
						<select name="amount">
							<c:forEach begin="1" end="10" var="i">
								<option value="${i}">${i }</option>
							</c:forEach>
						</select>&nbsp;개
						<input type="submit" value="장바구니에 담기">
					</form>
				<a href="${path }/shop/product/list.do">상품목록</a>
			</td>
		</tr>		
			</table>
		</td>
	</tr>
</table>
</body>







</html>