<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" href="/resources/css/searchResultDetail.css" />
</head>
 <body>
    <div>
        <div class="navContainer">
          <div class="logoContainer">
            <a href="/"
              ><h2>쉬어家</h2>
              <span>sheerhouse</span></a
            >
          </div>
          <div class="searchContainer">
            <input type="text" value="location" />
            <div class="divider-short"></div>
            <input type="text" value="dates" />
            <div class="divider-short"></div>
            <input type="text" value="인원" />
          </div>
          <nav class="menuContainer">
            <ul class="menus">
              <c:if test="${user.email eq null}">
                <li class="loginBtn" onclick="loginnbtnClicked()">
                  로그인/회원가입
                </li>
              </c:if>
              <c:if test="${user.role eq 'user'}">
                <li><a href="mypage.do">마이페이지</a></li>
                <li><a href="hostRegulation.host">호스트 등록하기</a></li>
              </c:if>
              <c:if test="${user.role eq 'host'}">
                <li><a href="mypage.do">마이페이지</a></li>
                <li><a href="host.host">호스트 페이지로 가기</a></li>
              </c:if>
            </ul>
          </nav>
          </div>
          </div>
    <div class="detailContainer">
      
          <!-- <div class="accomodationImagesContainer">
        <div class="accomodationImageContainer">
          <img class="arrowLeft" src="../Images/icons/right-arrowRed.png" />
          <div class="mainImges">
            <img src="https://via.placeholder.com/650x400" alt="" />
          </div>
          <img class="arrowRight" src="../Images/icons/right-arrowRed.png" />
        </div>
      </div>
      <div> -->
        <div class="headerTitle">
            <h2>${title}</h2>
          </div>  
          <c:forEach var="detail" items="${DetailInfo}" >
       		 <div class="slideshow-container">
            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade">
              <div class="numbertext">1 / 3</div>
              <img
                src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-1.jpg" alt="accomodationPhoto1"
                style="width: 100%"
              />
              <div class="text">sheer house</div>
            </div>

            <div class="mySlides fade">
              <div class="numbertext">2 / 3</div>
              <img
                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-2.jpg" alt="accomodationPhoto2"
                style="width: 100%"
              />
              <div class="text">sheer house</div>
            </div>

            <div class="mySlides fade">
              <div class="numbertext">3 / 3</div>
              <img
                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-3.jpg" alt="accomodationPhoto3"
                style="width: 100%"
              />
              <div class="text">sheer house</div>
            </div>
  		 </c:forEach>
            <!-- Next and previous buttons -->
            <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
            <a class="next" onclick="moveSlides(1)">&#10095;</a>
          </div>
          <br />

          <!-- The dots/circles -->
          <div style="text-align: center">
            <span class="dot" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
          </div>
        </div>
        <c:forEach var="detail" items="${DetailInfo}" >
        <div class="descriptionsContainer">
          <section class="descriptionContainer">
            <div class="descriptionHeader">
              <div class="title"><span>${detail.title }</span></div>
              <div class="hostInfo"><span>${detail.host_info }</span></div>
            </div>
            <div class="divider-long"></div>
            <div class="descriptionContent">
            <div>
                <span>${detail.type }</span>
            </div>
            <div class="divider-long"></div>
              <div>
                <span>${detail.info }</span>
              </div>
              <div class="divider-long"></div>
              <div>
                <span>${detail.rule }</span>
              </div>
            </div>
          </section>
          <section class="descrptionContainer2">
            <div class="reservationContainer">
                <form action="">
                    <div class="reservationContent1">
                        <div>
                            <span>체크인</span>
                            <input type="text" value="체크인">
                        </div>
                        <div>
                            <span>체크아웃</span>
                            <input type="text" value="체크아웃">
                        </div>
                    </div>
                    <div class="reservationContent2">
                        <span>인원</span>
                        <input type="text" value="인원">
                    </div>
                    <input class="reservationBtn" type="button" value="예약하기">
                </form>

   
              <div class="reservationPrices">
                <span>${detail.price } / 1박</span>
              </div>
            </div>
          </section>
   
        </div>
        </c:forEach>
      </div>
   
    </div>
  </body>
  <script>
    var slideIndex = 0; //slide index

    // HTML 로드가 끝난 후 동작
    window.onload = function () {
      showSlides(slideIndex);

      // Auto Move Slide
      //   var sec = 3000;
      //   setInterval(function(){
      //     slideIndex++;
      //     showSlides(slideIndex);

      //   }, sec);
    };

    // Next/previous controls
    function moveSlides(n) {
      slideIndex = slideIndex + n;
      showSlides(slideIndex);
    }

    // Thumbnail image controls
    function currentSlide(n) {
      slideIndex = n;
      showSlides(slideIndex);
    }

    function showSlides(n) {
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      var size = slides.length;

      if (n + 1 > size) {
        slideIndex = 0;
        n = 0;
      } else if (n < 0) {
        slideIndex = size - 1;
        n = size - 1;
      }

      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }

      slides[n].style.display = "block";
      dots[n].className += " active";
    }
  </script>
</html>