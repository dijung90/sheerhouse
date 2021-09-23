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
              <div class="text">${detail.title }</div>
            </div>

            <div class="mySlides fade">
              <div class="numbertext">2 / 3</div>
              <img
                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-2.jpg" alt="accomodationPhoto2"
                style="width: 100%"
              />
              <div class="text">${detail.title }</div>
            </div>

            <div class="mySlides fade">
              <div class="numbertext">3 / 3</div>
              <img
                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-3.jpg" alt="accomodationPhoto3"
                style="width: 100%"
              />
              <div class="text">${detail.title }</div>
              </c:forEach>
            </div>
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
        
        <!--   하단 컨테이너 -->
        <div class="sectionsContainer">
        
        	<section class="leftSectionContainer">
        		<div>
        		 	<c:forEach var="detail" items="${DetailInfo}" >
		        			<div class="descriptionContainer">
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
		     
  						</div>
  					</c:forEach>	
  					<div class="reviewsContainer"> 
              			<div class="reviews">
		                  <span>{username}</span>
		                  <span>{별점 or 만족도}</span>        
		                  <span>{staying dates}</span>       
		                  <p>{reviewContent}</p>               
              			</div>
            		</div>
        		</div>
        	</section>
        	<section class="rightSectionContainer">
        			<div class="reservationContainer">
                		<form action="">
                				<!-- 체크인, 체크아웃 달력  -->
	                    		<div class="reservationContent1">
	                        		<div>
			                            <span>체크인</span>
			                            <input class="checkin" name="checkin" type="date" value="체크인">
	                        		</div>
	                        		<div>
	                          		  <span>체크아웃</span>
	                            		<input class="checkout" name="checkout" type="date" value="체크아웃">
	                       			 </div>
	                    		</div>
	                    		<!-- 인원, 가격  -->
                   				<div class="reservationContent2">
                   						<!-- index 페이지의 js function 과 동일  -->
				                        <span>인원</span>
				                        <input name="searchMaxPeo" class="peopleNumInfo" onclick=search() type="button" value="인원" />	
				                        <input class="reservationBtn" type="submit value="예약하기">
						                <div class="peopleBtnContainer">
							                <div>
							                  <span class="peopleBtnHeader"> 성인 </span>
							                  <input
							                  class="addBtns"
							                  type="button"
							                  onclick="peopleIncre()"
							                  value="+"
							                />
							                  <input
							                  type="text"
							                  value="0"
							                  name="searchMaxPeople"
							                  class="peopleBtnNumInput"
							                />
							                  <input
							                  class="addBtns"
							                  type="button"
							                  onclick="peopleDecre()"
							                  value="-"
							                />
						                </div>
		                    		</div>
				                    <c:forEach var="detail" items="${DetailInfo}" >
						   					<div class="divider-long"></div>
						   						<!-- 인원수, 달력 날짜 계산해서 계산 기능 추가해야함.  -->
						             	 		<div class="reservationPrices">
						                			<div>
						                				<div class="pricePerNight">
								                			<span>${detail.price } /</span>
								                			<span class="manyNights">N 박</span>
						                				</div>
						                				<div class="totalPrice">
						                					<input value="" type="text" name="totalprice"/>
						                				</div>
						                			</div>
						              			</div>
						              	</c:forEach>
		                    		
		                    		<input class="reservationBtn" type="submit" value="예약하기">
                				</div>
                				</form>


            		</div>
        	</section>
        </div>
       </div>
  </body>
  <script>
  
  const checkinDate = document.querySelector(".checkin");
  const checkoutDate = document.querySelector(".checkout");
  const manyNights = document.querySelector(".manyNights");
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
    
    function search() {
    	  const peopleBtnContainer = document.querySelector(".peopleBtnContainer");
    	  peopleBtnContainer.style.display = "block";
    	}
    
    function peopleIncre() {
    	  const peopleNumInput = document.querySelector(".peopleBtnNumInput");
    	  const peoInput = document.querySelector(".peopleBtnNumInput");
    	  const peopleNumInfo = document.querySelector(".peopleNumInfo");
    	  let currentValue = parseInt(peopleNumInput.value);
    	  peoInput.value = currentValue + 1;
    	  peopleNumInfo.value = currentValue + 1;
    	  console.log(currentValue + 1);
    	}

    	function peopleDecre() {
    	  const peopleNumInput = document.querySelector(".peopleBtnNumInput");
    	  const peoInput = document.querySelector(".peopleBtnNumInput");
    	  const peopleNumInfo = document.querySelector(".peopleNumInfo");
    	  let currentValue = parseInt(peopleNumInput.value);
    	  if (currentValue <= 0) {
    	    peoInput.value = 0;
    	  } else {
    	    peoInput.value = currentValue - 1;
    	    peopleNumInfo.value = currentValue - 1;
    	  }
    	  console.log(currentValue - 1);
    	}

    	const datePick = () => {
    		strCheckin = checkinDate.value;
    		strCheckout = checkoutDate.value;
    		
    		var arr1 = strCheckin.split('-');
    		var arr2 = strCheckout.split('-');
    		
    		
    		var checkin = new Date(arr1[0], arr1[1], arr1[2]);
    		var checkout = new Date(arr2[0], arr2[1], arr2[2]);
    		
    		var diff = checkout - checkin;
    		var currentDay = 24 * 60 * 60 * 1000;
    		
    		let result = parseInt(diff/currentDay) 
    		if(isNaN(result)){
    			console.log("non");
    		}else {
    			console.log("ok");
    			manyNights.innerText = result + "박"
    		}
    	}
    checkinDate.addEventListener("change", datePick);
    checkoutDate.addEventListener("change", datePick);
    
    
    
  </script>
</html>