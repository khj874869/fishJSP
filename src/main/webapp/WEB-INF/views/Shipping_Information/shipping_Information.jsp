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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resource/body.css">
<link rel="stylesheet" href="../resource/product .css">
<link rel="stylesheet" href="../resource/footer.css">
<link rel="stylesheet" href="../resource/slider.css">
<link rel="stylesheet" href="../resource/notice.css">
<link rel="stylesheet" href="../resource/shipping.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<main>
<section>
<div class="carrier">
    <h1>배송정보</h1>
<img src="../resource/image//배송정보.png" alt="배송정보">
<img src="../resource/image//배송정보간략이미지.png" alt="배송정보간략이미지">
</div>
</section>
<table>
    <thead>
    <tr>
        <th>물품명</th>
        <th>송장번호</th>
        <th>상태</th>
        <th>현재위치</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>홍월디스커스</td>
        <td>23121-3112214</td>
        <td>고객님의 상품이 인수 되었습니다.</td>
        <td>옥천HUB</td>
        </tr>
        <tr>
        <td>블루크래스트</td>
        <td>2314155-20193333</td>
        <td>고객님의 상품이 배달지에 도착했습니다.</td>
        <td>강원창고</td>
        </tr>
        <tr>
        <td>홍용</td>
        <td>121235-3948553</td>
        <td>상품 송전 입니다.</td>
        <td>김포HUB</td>
        </tr>
        <tr>
        <td>청용</td>
        <td>1212958-390193</td>
        <td>고객님의 상품이 배달지에 도착했습니다.</td>
        <td>경기/부천 창고</td>
        </tr>
        <tr>
        <td>홍월 디스커스</td>
        <td>12181-3940555</td>
        <td>고객님의 제품이 곧 발송 예정입니다.</td>
        <td>인천창고</td>
        </tr>
    </tbody>
    </tfoot>
    </taqble>
</main>
</body>
</html>