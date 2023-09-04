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
<link rel="stylesheet" href="../resource/product_Detail.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<main>
  <nav class = "productNav">
    <ol><span><a href="../index.html">HOME/</a></span>
    <span><a href="../member/login.html">로그인</a></span>
    </ol></nav>
<section class ="imgSection">
  <div class = cartItem>
  <img  class = "productexplain" src="../resource/image//블루크레스트.png" alt="홀더" > 
  </div>
  <section>
  <div class="imagination">
    <ol>
    <li><h2>제품상세설명</h2></li>
    <li>판매가 : ₩400,000</li>
    <li>
      <p>구피가 보통 열대어의 보석이라면, 디스커스는 열대어의 왕이라 불립니다. <br>
        크레스트는 일본에 유명 디스커스 장인이 운영하는 유명샵인 아쿠아 마이스터에서 나온 개체입니다.  <br><br>
        국내엔 순혈 개체가 아닌 개체들이 있으나, 저희는 품질 보증서를 가지고 있습니다. <br>
        순혈 품종을 키우고 싶으시다면 구매 추천드립니다. <br><br><br><br><br>
        주의사항 : 사용자의 부주의로 인한 파손 시, 교환 환불 어려울 수 있습니다.
      </p>
      <br><br>
      <div class="collection"><p>구매수량  :<button class="plus">+</button><input type="number" class="numbers" value="1" min="1"><button class="minus">-</button></div></p>
      </li>
      <li><span>총 금액: ₩<span id="totalPrice">400000</span></span></li>
 <jsp:include page="/WEB-INF/views/include/productbag.jsp"></jsp:include>
  </ol>
  </div>
  <br><br><br>
  </section>
  </section>
  <div id="comment-section">
    <h3>후기</h3>
    <div id="comment-container">
    <div id="comment-list">
    </div>
    <form id="comment-form">
      <img src="../resource/image//별점.png" alt="별점">
      <textarea id="comment-input" placeholder="평을 남겨주세요." required></textarea>
      <button type="submit">후기 남기기</button>
    </form>
  </div>
</div>

<footer class="bottomarea">
  <div class="container">
    <div class="bottomarea-inner">
      <div class="bottomarea-column">
        <h3>관련 수칙</h3>
        <p>배송 후 10일 이후, 
        <p> 해당 물품 교환시 불이익 발생 할 수 있습니다.</p>
      </div>
      <div class="bottomarea-column">
        <h3>연락처</h3>
        <p>KH아카데미종로지원0515</p>
        <p>khj874869@gmail.com</p>
        <p>000-000-1234</p>
      </div>
      <div class="bottomarea-column">
            <h3> 공지사항</h3>
        <p> 2023.04.28</p>
        <p>5월 신용카드 무이자행사 안내</p>
        <p> 2023.04.05</p>
        <p>4월 신용카드 무이자행사 안내</p>
        <p>2023.03.24</p>
        <p>디스커스의 생태 보고서 구매안내</p>        
</div>
    </div>
  </div>
</footer>
</main>
</body>
<script>
var commenDatatForm = document.getElementById('comment-form');
var commentList = document.getElementById('comment-list');
commenDatatForm.addEventListener('submit', function(event) {
  event.preventDefault();
  var commentInput = document.getElementById('comment-input');
  var commentText = commentInput.value;
  var newComment = document.createElement('div');
  newComment.textContent = commentText;
  newComment.classList.add('comment');
  commentList.appendChild(newComment);
  commentInput.value = '';
});

var quantityValue = document.querySelector('.numbers');
var plusButton = document.querySelector('.plus');
var minusButton = document.querySelector('.minus');
var totalPriceElement = document.getElementById('totalPrice');

function upQuantity(change) {
  var charge = Number(quantityValue.value);
  charge += change;
  if (charge < 1) {
    charge = 1;
  }
  quantityValue.value = charge;
  updateTotalPrice();
}

plusButton.addEventListener('click', function() {
  upQuantity(1);
});
minusButton.addEventListener('click', function() {
  upQuantity(-1);
});
function updateTotalPrice() {
	  var charge = Number(quantityValue.value);
	  var pricePerItem = 1; 
	  var totalPrice = charge * pricePerItem;
	  totalPriceElement.textContent = totalPrice;
	}
updateTotalPrice();

</script>
</html>