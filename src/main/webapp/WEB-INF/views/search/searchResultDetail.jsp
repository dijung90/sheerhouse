<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<link rel="stylesheet" href="/resources/css/searchResultDetail.css" />
</head>
 <body>
<%@ include file="/WEB-INF/views/search/Header.jsp"%>
    <div class="detailContainer">
      

          <div class="headerTitle">
            <h2>${title}</h2>
          </div>  
          
       	<div class="slideshow-container">
          <c:forEach var="detail" items="${DetailInfo}" >
          <!-- Full-width images with number and caption text -->
	            <div class="mySlides faded">
	              <div class="numbertext">1 / 3</div>
	              <img
	                src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-1.jpg" alt="accomodationPhoto1"
	                style="width: 100%"
	              />
	              <div class="text">${detail.title }</div>
	            </div>
	
	            <div class="mySlides faded">
	              <div class="numbertext">2 / 3</div>
	              <img
	                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-2.jpg" alt="accomodationPhoto2"
	                style="width: 100%"
	              />
	              <div class="text">${detail.title }</div>
	                <input type="hidden" value="${user.email}" id="email_val" />
	            </div>
	
	            <div class="mySlides fade">
	              <div class="numbertext">3 / 3</div>
		              <img
		                 src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${detail.home_seq}${detail.host_seq}/${detail.home_seq}${detail.host_seq}${detail.title}-3.jpg" alt="accomodationPhoto3"
		                style="width: 100%"
		              />
	              	<div class="text">${detail.title }</div>
	             </div>
	             
	              </c:forEach>
           
            <div class="arrows">
	            <!-- Next and previous buttons -->
	            <a class="slideprev" onclick="moveSlides(-1)">&#10094;</a>
	            <a class="slidenext" onclick="moveSlides(1)">&#10095;</a>
          	</div>
        	  <br />
			
		          <!-- The dots/circles -->
		          <div style="text-align: center">
		            <span class="dot" onclick="currentSlide(0)"></span>
		            <span class="dot" onclick="currentSlide(1)"></span>
		            <span class="dot" onclick="currentSlide(2)"></span>
		          </div>
          </div>
       		</div>
       		
	
        <!--   하단 컨테이너 -->
	        <div class="sectionsContainer">
	        
	        	<section class="leftSectionContainer">
	        		<div>
	        		 	<c:forEach var="detail" items="${DetailInfo}" >
			        			<div class="descriptionContainer">
					  				<div class="descriptionHeader">
					              		<div class="title">
					              			<h2>${detail.title }</h2>
					              			<section class="wishlistHeartIcon">
					                			<span class="entypo-heart wishlist ${detail.home_seq}" id="${detail.home_seq}" active="false" style="color: rgb(157,157,157);"></span> 
					              			</section>
										</div>
					              		<div class="divider-long"></div>
					              		<div class="hostInfo">
					              		<h3>숙소 기본 정보</h3>
					              			<dl>
					              				<dt>호스트 ${detail.host_info } 님</dt>
					              				<dd>호스트 소개글 HERE</dd> <!-- //호스트 소개내용을 추가해주세요  -->
	 				              			</dl>
	 				              			<p> 숙소 최대 수용 인원 : <span class="maxPeopleNum">${detail.headcount }</span></p>
	 				              			<input class="unusedDate" type="hidden" value="${detail.unused_date}"/>
					              		</div>			              		
					            	</div>
					            	<div class="divider-long"></div>
					            <div class="descriptionContent">
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
	  					<div class="reviewHeader">
	  						<h2>후기</h2>
	  						<span>{} 개의 후기가 있습니다. </span>
	  					</div>
	  			
	  					<c:forEach var="comment" items="${CommentInfo}">	
	  					<div class="reviewsContainer"> 
	              			<div class="reviews">
			                  <span><strong>${comment.name}</strong> 님 의 리뷰입니다.</span>
			                  <div class="review-inside-bar"></div>
			                  <span class="reviewScore">{별점 or 만족도}</span>        
			                  <span class="reviewStayingDate">{staying dates}</span>       
			                  <p class="reviewContent">${comment.content}</p> 
			                  <div class="reviewRegDate">
			                  	<fmt:formatDate value="${comment.regDate}" pattern="yyyy/MM"/>
			                  	<span>에 작성되었습니다.</span>
			                  </div>
			                  <%-- <span class="reviewRegDate">${comment.regDate} 에 작성되었습니다.</span> --%>              
	              			</div>
	            			<div class="divider-long"></div>
	            		</div>
	            		
	            		</c:forEach>
	        		</div>
	        	</section>
	        	<section class="rightSectionContainer">
	        			<div class="reservationContainer">
	                		<form action="">
	                				<!-- 체크인, 체크아웃 달력  -->
		                    		<div class="reservationContent1">
		                        		<!-- <div>
				                            <span>체크인</span>
				                            <input class="checkin" name="checkin" type="date" value="체크인">
		                        		</div>
		                        		<div>
		                          		  <span>체크아웃</span>
		                            		<input class="checkout" name="checkout" type="date" value="체크아웃">
		                       			 </div> -->
			                       			 <div class="date-container">
										        
										         <div class="input-group input-daterange"> <input name="checkin" type="text" class="form-control input1" placeholder="체크인" readonly> <input name="checkout" type="text" class="form-control input2" placeholder="체크 아웃" readonly> </div>
										          
										      </div>
				                    	</div>
		                    		<!-- 인원, 가격  -->
	                   				<div class="reservationContent2">
	                   						<!-- index 페이지의 js function 과 동일  -->
					                        <span>인원</span>
					                        <input name="searchMaxPeo" class="peopleNumInfo" onclick="search()" type="button" value="인원" />	
							                <div class="peopleBtnContainer displayNone">
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
							   					<div class="divider-long margin-top-small"></div>
							   						<!-- 인원수, 달력 날짜 계산해서 계산 기능  -->
							             	 		<div class="reservationPrices">
							                			<div>
															<h2>가격 정보 : ${detail.price } / 1박</h2>
															<div class="divider-long"></div>
															<div class="totalPriceContainer">
																<div>
									                				<span class="pricePerNight">  ${detail.price } / </span>
									                				<span class="manyNights">N 박</span>
							                					</div>
								                				<div class="totalPrice">
								                					<input class="totalPriceInput" value="" type="text" name="totalprice"/>
								                				</div>
															</div>
							                			</div>
							              			</div>
							              	</c:forEach>
			                    		
			                    		<input class="reservationBtn" type="submit" value="예약하기">
			                    		<p class="warnMsg">  </p>
	                				</div>
	                				</form>	
	            		</div>
	        	</section>
	        </div>
	    </div>
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
  <script>
  
  const checkinDate = document.querySelector(".checkin");
  const checkoutDate = document.querySelector(".checkout");
  
  const maxPeopleNum = document.querySelector(".maxPeopleNum");
  const warnMsg = document.querySelector(".warnMsg");
  
  const manyNights = document.querySelector(".manyNights");
  const totalPriceInput = document.querySelector(".totalPriceInput");
  const pricePerNight = document.querySelector(".pricePerNight");
  const totalPriceContainer = document.querySelector(".totalPriceContainer");
  
  
  const unusedDate = document.querySelector(".unusedDate");
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
    	  if(!peopleBtnContainer.classList.contains("displayNone")){
    		  peopleBtnContainer.classList.add("displayNone");
    	  }else if(peopleBtnContainer.classList.contains("displayNone")){
    		  peopleBtnContainer.classList.remove("displayNone");
    	  }

    	}
    
    function peopleIncre() {
    	  const peopleNumInput = document.querySelector(".peopleBtnNumInput");
    	  const peoInput = document.querySelector(".peopleBtnNumInput");
    	  const peopleNumInfo = document.querySelector(".peopleNumInfo");
    	  
    	  let currentValue = parseInt(peopleNumInput.value);
    	  let maxPeoNum = parseInt(maxPeopleNum.innerHTML);
    	  peoInput.value = currentValue + 1;
    	  peopleNumInfo.value = currentValue + 1;
    	  console.log(currentValue + 1);
    	  console.log("max poeple: "+maxPeoNum);
    	  if(currentValue + 1 > maxPeoNum){
    		  peopleNumInfo.value = maxPeoNum;
    		  peoInput.value = maxPeoNum;
    		  warnMsg.style.display = 'block';
    		  warnMsg.innerHTML = "최대 수용인원을 초과하였습니다. "
    	  }
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
    		///cal dates //
    		strCheckin = checkinDate.value;
    		strCheckout = checkoutDate.value;
    		
    		var arr1 = strCheckin.split('-');
    		var arr2 = strCheckout.split('-');
    		
    		
    		var checkin = new Date(arr1[0], arr1[1], arr1[2]);
    		var checkout = new Date(arr2[0], arr2[1], arr2[2]);
    		
    		var diff = checkout - checkin;
    		var currentDay = 24 * 60 * 60 * 1000;
    		
    		let result = parseInt(diff/currentDay);
    		
    		
    		//get price per night 
    		
    		strtotal = pricePerNight.innerText;
			var priceArr = strtotal.split('/');

			
			priceNight = parseInt(priceArr[0]);
			
			
    		if(isNaN(result)){
    			console.log("non");
    		}else {
    			totalPriceContainer.style.display = 'block';
    			console.log("ok");
    			manyNights.innerText = result + " 박 "
    			totalPriceInput.value = " 총 " + result * priceNight + "원  ";
    		}
    	}
/*     checkinDate.addEventListener("change", datePick);
    checkoutDate.addEventListener("change", datePick);
     */

	
     const unusedDate_value = unusedDate.value;
     const unusedDateArr = unusedDate_value.split(",");
     const unusedDateArr2 = unusedDate_value.trim(" ");
     console.log(unusedDateArr);
     console.log(unusedDateArr2);
     
     var dateToday = new Date(); 
     $(document).ready(function () {
       $(".input-daterange").datepicker({
         format: "yyyy-mm-dd",
         autoclose: true,
         minDate: dateToday,
         startDate: '+1d',
         datesDisabled: unusedDateArr2
		
       });
       $(".input1").datepicker({
  	     todayBtn:  1,
  	     autoclose: true,
  	 }).on('changeDate', function (selected) {
  	     var minDate = new Date(selected.date.valueOf());
  	     $('.input2').datepicker('setStartDate', minDate);
  	     $('.input2').datepicker('setDate', minDate); // <--THIS IS THE LINE ADDED
  	 });

  	 $(".input2").datepicker()
  	     .on('changeDate', function (selected) {
  	         var maxDate = new Date(selected.date.valueOf());
  	         $('.input1').datepicker('setEndDate', maxDate);
  	     });

     });
     
     
     
     /* wish list   */
 	
		const wishlists = document.querySelectorAll(".wishlist");
		wishlists.forEach(wishlist => {
			wishlist.addEventListener('change', function() {
			 	var con = wishlist.getAttribute("active");
			 	console.log("hihi" + con);
			  });
			})

		$(document).on("click", ".wishlist", function(){
			let email = $("#email_val").val();
			let html = '';
		    var homeseq = $(this).attr("id");
		    var home_seq = parseInt(homeseq, 0);	
		    console.log(home_seq);
		    console.log(email);
		    
		
			if(email == null){
					alert("로그인이 필요합니다.");
					return false;
				}

			
			$.ajax({
				url : "search/wishlist.do",
				type : "Get",
				data: {home_seq : home_seq, email : email},
				dataType: "text",
				success : function(result){
					if(result == "selected"){
						console.log("added");
						$('.'+ home_seq).addBack().css({"color": "#e55763"});
						}else{
							console.log("error");
							$('.'+ home_seq).addBack().css({"color": "#9d9d9d"});

					}
					
				} 
			
		})
		
	})

     
     
     
/*      $(document).ready(function(){

    	 $("#startdate").datepicker({
    	     todayBtn:  1,
    	     autoclose: true,
    	 }).on('changeDate', function (selected) {
    	     var minDate = new Date(selected.date.valueOf());
    	     $('#enddate').datepicker('setStartDate', minDate);
    	     $('#enddate').datepicker('setDate', minDate); // <--THIS IS THE LINE ADDED
    	 });

    	 $("#enddate").datepicker()
    	     .on('changeDate', function (selected) {
    	         var maxDate = new Date(selected.date.valueOf());
    	         $('#startdate').datepicker('setEndDate', maxDate);
    	     });

    	 }); */
		
	$(".input1")
     
     	strtotal = pricePerNight.innerText;
		var priceArr = strtotal.split('/');

		
		let priceNight = parseInt(priceArr[0]);
     	
     $(".form-control").change(function(){
    	 let input1 = $(".input1").val();
    	 let input2 = $(".input2").val();
    	 
/*          $(".input2").datepicker({
        	  	startDate: +2 $('.input1').val()
        	  	minDate:  $('.input1').val()
         }) */
 		var arr1 = input1.split('-');
		var arr2 = input2.split('-');
		
		
		var checkin = new Date(arr1[0], arr1[1], arr1[2]);
		var checkout = new Date(arr2[0], arr2[1], arr2[2]);
		

		
		var diff = checkout - checkin;
		var currentDay = 24 * 60 * 60 * 1000;
		
		let result = parseInt(diff/currentDay);
		
		if(isNaN(result)){
			console.log("non");
		}else {
			totalPriceContainer.style.display = 'block';
			console.log("ok");
			manyNights.innerText = result + " 박 "
			totalPriceInput.value = " 총 " + result * priceNight + "원  ";
		}
    	 
    	 console.log(input1);
    	 console.log(input2);
    	 console.log(priceNight);
    	 console.log(result);
     })



    
  </script>
</html>