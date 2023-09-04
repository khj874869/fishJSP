<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<header>
  <div class="header-top">
    <div class="container">
      <nav class="top-navigation">
        <ul class="top-nav-menu">
          <li><a href="/member/login.do">로그인/회원가입</a></li>
          <li><a href="/notice/list.do">공지사항</a></li>
          <li><a href="./point/point.jsp">포인트</a></li>
          <li><a href="./Shipping_Information/shipping_Information.jsp">주문조회</a></li>
          <li><a href= "/member/register.do">회원가입</a></li>
        </ul>
    </nav>
      <div class="input-group">
        <input type="text" placeholder="검색어를 입력하세요">
        <button type="submit">검색</button>
      </div>
      <div class="mainlogo">
      <a href="./index.jsp"><img src="../resource/image/수산시장.png" alt="LOGO"></a> 
      </div>
      <div class="icon-user" ><img src="../resource/image/구글.png" alt="구글">
        <img src="../resource/image/네이버.png" alt="네이버">
        <img src="../resource/image/카카오톡.png" alt="카카오톡">
        <img src="../resource/image/인스타그램.png" alt="인스타그램">
      </div>
      </div>
    </div>
  </div>
  <nav class="navbar">
    <div class="container-nav">
      <ul class="nav-menu">
        <div class="connect-wrapper">
          <ul class="fish">
          <li class="nav-items">
            <div class="nav-item-header"><a href="#" 
              class="nav-link">물고기종류</a></div>
              <div class="nav-item-content">
              <ul>
              <li>디스커스</li>
              <li>토종물고기</li>
              <li>아로와나</li>
              </ul>
            </div>
          </li>
        <div class="connect">
          <ul class="fish">
            <li class="nav-items">
            <div class="nav-item-header">
            <a href="#" class="nav-link">먹이/사료</a></div>
            <div class="nav-item-content">
              <ul>
              <li>비트</li>
              <li>플레이크</li>
              <li>트로피카</li>
          </ul>
          </div>
          </li>
        <div class="connect">
          <ul class="fish">
            <li class="nav-items">
            <div class="nav-item-header">
            <a href="#" class="nav-link">여과기</a></div>
            <div class="nav-item-content">
              <ul>
              <li>테트라</li>
              <li>트로피카</li>
              <li>브로와</li>
          </ul>
          </div>
          </li>
          <div class="connect">
            <ul class="fish">
              <li class="nav-items">
              <div class="nav-item-header">
              <a href="./fair/fair.jsp" class="nav-link">박람회</a></div>
              <div class="nav-item-content">
                <ul>
                <li>일정표</li>
                <li>아쿠아팻랜드</li>
            </ul>
            </div>
            </li>
            <div class="connect">
              <ul class="fish">
                <li class="nav-items">
                <div class="nav-item-header">
                <a href="./notice/notice.jsp" class="nav-link">공지사항</a></div>
                <div class="nav-item-content">
                  <ul>
                  <li>Q&A</li>
                  <li>시착보상</li>
              </ul>
              </div>
              </li>
              <div class="connect">
                <ul class="fish">
                  <li class="nav-items">
                  <div class="nav-item-header">
                  <a href="#" class="nav-link">게시판</a></div>
                  <div class="nav-item-content">
                    <ul>
                    <li>중고거래</li>
                    <li>연구자료</li>
                  
                </ul>
                </div>
                </li>
      </div>
      </ul>
    </div>
  </div>
</div>
</div>
</div>
  </ul></nav>
</header>