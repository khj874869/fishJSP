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
<link rel="stylesheet" href="../resource/Fair.css">
<link rel="stylesheet" href="../resource/product_Detail.css">

</head>
<body>
    
 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<main>
    <section id ="voucher">
        <img id = "map" src="../resource/image//박람회지도.png" alt="지도">
        <div class="provide">
            <ol>
                <li><h1>박람회 일정</h1> </li>
            <li> <p>안녕하세요? 오늘 국내 최대 규모의 열대어 박람회가 열립니다.</li>
            참여 기업은 15곳이며, 
            여러분의 눈길을 사로잡을 화려한 색감을 가진 물고기들이 전시됩니다. <br>
            이번 시흥시청의 지원을 받아 고용노동부와 연계하여, 새로운 시 사업인 만큼, <br>
            여러 관상어 관련 취업 박람회도 개최 될 예정입니다.
            많은 분들 관심 부탁드립니다.    
            </p></li>
            <li>※주의사항 : 오이도 행 셔틀버스는 매 시간 20분에 운행 될 예정입니다.</li>
            <li>운영 시간은 8:00~17:00 까지이며, 이용에 착오 없으시도록 부탁  드리겠습니다.</li> <br><br>
            <li>취업 박람회 참석이 목적이신 분은, 안내 데스크에서 명부를 작성 후 C동으로 이동 부탁드리겠습니다.</li> <br><br>
            <li>참여하는 기업체는 한화 아쿠아리움, 아쿠아 플래닛,팀 아쿠아, 상아쿠아, 아쿠아 가든 입니다.</li>
            </ol>
        </div>
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
</main>

<aside class="ad-container">
    <img src="../resource/image//aside광고책.png" alt="Advertisement">
    </aside>
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
    </script>
</html>