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
<link rel="stylesheet" href="../resource/Login.css">
</head>
<body>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

  <aside class="ad-container">
    <img src="../resource/image/aside광고책.png" alt="Advertisement">
  </aside>
      <title>로그인</title>
    </head>
    <body>
    <form action="/member/login.do" method = "post">
      <div class="loginContainer">
        <img src="../resource/image/수산시장.png" alt="수산시장">
        <img src="../resource/image/사용자 이미지.png" alt=""> <input type="text" id="name" name="memberId"placeholder="아이디를 입력해주세요." required>
        <img src="../resource/image/자물쇠이미지.png" alt=""><input type="password" id="password" name="memberPw"placeholder="Password" required>
        <button type="submit"  class="buttonLogin" id="btn1">로그인 </button>
        <a href=""><button type="submit"  class="buttonLogin" id="btn2">ID/PW찾기</button></a>
        <button type="submit" class="buttonLogin" id="btn3" >회원가입</button>
      </div>
      </form>
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
  </body>
  <script>
    var usernameInput = document.querySelector('#name');
    var passwordInput = document.querySelector('#password');
    document.querySelector("#btn1").addEventListener("click" ,()=> {   
      if (usernameInput.value !== '' && passwordInput.value !== '') {
    window.location.href = "/login.do";
  } else {
    alert('ID/PW를 입력해주세요.');
  }
});
    
  </script>
  </html>
