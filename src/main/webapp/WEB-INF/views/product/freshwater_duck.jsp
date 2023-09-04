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
  <img class = "productexplain" src="../resource/image//민물가오리.png" alt="홀더"> 
  </div> 
  <section>
  <div class="imagination">
    <ol>
    <li><h2>제품상세설명</h2></li>
    <li>판매가 : ₩1,500,000</li>
    <li>
      <p>민물에 사는 가오리 입니다.  <br>
        매우 비싼 가격이지만, 블랙다이아 담수 가오리는 물생활 끝판왕 중 하나입니다. <br><br>
        번식만 시킬 수 있다면, 원가는 그냥 상회할 정도로 벌 수 있습니다. <br>
        관상용으로도 나중에 팔기에도 용이한 가오리 입니다. <br><br><br><br><br>
        주의사항 : 사용자의 부주의로 인한 파손 시, 교환 환불 어려울 수 있습니다.
      </p>
      <br><br>
      <div class="collection"><p>구매수량  :<button class="plus">+</button><input type="number" class="numbers" value="1" min="1"><button class="minus">-</button></div></p>
      </li>
      <li><span>총 금액: ₩<span id="totalPrice">1,500,000</span></span></li>
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
function upQuantity(change) {
  var charge = Number(quantityValue.value);
  charge += change;
  if (charge < 1) {
    charge = 1;
  }
  quantityValue.value = charge;
}

plusButton.addEventListener('click', function() {
  upQuantity(1);
});
minusButton.addEventListener('click', function() {
  upQuantity(-1);
});
</script>
</html>