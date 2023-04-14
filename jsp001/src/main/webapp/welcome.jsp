<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dream Jeju</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <div id="container">
        <!-- 헤드영역 -->
         <%@ include file="menu.jsp" %>
        <div id="slideShow" class="carousel slide" data-ride="carousel">
           <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#slideShow" data-slide-to="0" class="active"></li>
                <li data-target="#slideShow" data-slide-to="1"></li>
                <li data-target="#slideShow" data-slide-to="2"></li>
            </ul>
            <div id="slides" class="carousel-inner">
                <div class="carousel-item active">
                <img  src="images/photo-1.jpg" alt="">
                </div>
                <div class="carousel-item">
                <img  src="images/photo-2.jpg" alt="">
                </div>
                <div class="carousel-item">
                <img  src="images/photo-3.jpg" alt="">
                </div>
               <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#slideShow" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#slideShow" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
        <div id="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">공지사항</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">갤러리</label>

                <div id="notice" class="tabContent">
                    <h2>공지사항 내용입니다.</h2>
                    <ul>
                        <li>사무실을 이전했습니다.</li>
                        <li>[참가 모집] 카약 체혐에 초대합니다.</li>
                        <li>[참가 모집] 여름 방학 기간, 오름 체험단을 모집합니다.</li>
                        <li>겨울, 추천 여행지</li>
                        <li>가을, 추천 여행지</li>
                    </ul>
                </div>
                <div id="gallery" class="tabContent">
                    <h2>갤러리 내용입니다.</h2>
                    <ul>
                        <li><img src="images/img-1.jpg"></li>
                        <li><img src="images/img-2.jpg"></li>
                        <li><img src="images/img-3.jpg"></li>
                        <li><img src="images/img-1.jpg"></li>
                        <li><img src="images/img-2.jpg"></li>
                        <li><img src="images/img-3.jpg"></li>
                    </ul>
                </div>
            </div>
            <div id = "links">
                <ul>
                    <li>
                        <a href="#">
                            <span id="quick-icon1"></span>
                            <p>평화 기행</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon2"></span>
                            <p>힐링 워크숍</p>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span id="quick-icon3"></span>
                            <p>문의하기</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- footer 부분 -->
        <%@ include file="footer.jsp"%>