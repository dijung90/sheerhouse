<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<link rel="stylesheet" href="/resources/css/mypageStyle.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
</head>
<body>

 <div class="mypageContainer">
      <div class="navContainer">
        <div class="logoContainer">
          <a href="/"
            ><h2>쉬어家</h2>
            <span>sheerhouse</span></a
          >
        </div>
      </div>
      <div class="mypageHeader">
        <h2>마이페이지</h2>
      </div>
      <div class="mypageGreeting">
        <h3>안녕하세요 ${user.name}님</h3>
      </div>
      <div class="mypageSelect">
        <ul class="mypagelists">
          <li onclick="showMore(this)" class="tabs" id="myBooking" data-mypage-type="bookingDetail">
            나의 예약
          </li>
          <li onclick="showMore(this)" class="tabs" id="myWishList" data-mypage-type="wishListDetail">
            나의 위시리스트
          </li>
          <li onclick="showMore(this)" class="tabs" id="myHistory" data-mypage-type="historyDetail">
            나의 히스토리
          </li>
          <li onclick="showMore(this)" class="tabs" id="myInfo" data-mypage-type="infoDetail">
            개인정보
          </li>
          <li onclick="showMore(this)" class="tabs" id="myPayment" data-mypage-type="paymentDetail">
            결제정보
          </li>
        </ul>
      </div>
      <div class="detailContainer">
        <section id="bookingDetail" class="bookingDetail tabContent" data-mypage-type="booking">
            <ol class="bookingLists">
		            <c:forEach var="reservationlist" items="${reservationlist}">	
		            	<c:set var="today" value="<%=new java.util.Date()%>"/>
		           		<fmt:parseDate var="starDate" value="${fn:split(reservationlist.stayingDate, ',')[0]}" pattern="yyyy-MM-dd"/>
		            	<c:if test="${starDate > today }">
		
				              <li class="bookingList">
				                <div>	
					                    <div class="accomodationImage">
					                    <input  class="imageUrl" type="hidden" value="${reservationlist.url}" />
					              <!--         <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" /> -->
					                    </div>
					                    <div class="accomodationTexts">
					                            <div class="accomodationContent">
					                      		<a href="searchResultDetail.do?home_seq=${reservationlist.home_seq}&title=${reservationlist.title}" target="_blank">
					                            	<h2>${reservationlist.title}</h2>
					                        	</a>
					                            	<span> 결제 금액 : ${reservationlist.totalprice}</span>
					                            	<div class="reservationDateInfo">
					                            		<span>기간 : </span>
					                            		<input type="text" class="reservationDates" value="${reservationlist.stayingDate}" readonly/>	
					                            	</div>
					                            	
					                            	<span> 예약 인원 : ${reservationlist.headcount}</span>
					                            		
					                            </div>
					                             <div class="bookingInfo">
					                         		 <!-- button onclick="bookingInfo('{booking.seq}')">예약상세</button> -->
					                         		 <input  class="fullImageUrl" type="hidden" value="${reservationlist.url}" />
					                      			<a href="mypageBookingInfo.do?home_seq=${reservationlist.home_seq}&apply_num=${reservationlist.apply_num}" target="_blank">
					                         		  		<button class="bookingInfoBtn">예약상세</button>
					                         		 </a>
					                      		 </div>
					                      </div>
					                      <div>
					                      	<input class="reservationState" type="button" value="${reservationlist.res_status }" /> 
					                      	<input type="hidden" class="reservationCancel" type="button" value="${reservationlist.cancel_reason }" /> 
					                      </div>                    
					                </div>
				                </li>
		                
		                <div class="divider"></div>
		                </c:if>
		             </c:forEach>
            </ol>           
        </section>
        
        
       
        
        
        
        
        <!-- wishlist section -->
       
		        <section id="wishListDetail" class="wishListDetail tabContent" data-mypage-type="wishList">
		          <div>
		            <ul class="wishLists">
		             <c:forEach var="wishList" items="${wishList}" >
				              <li>
				                  <div>
				                    <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" />
				                  </div>
				                  <div class="wishListContent">
				                    	<a href="searchResultDetail.do?home_seq=${wishList.home_seq}&title=${wishList.title}" target="_blank">
				                    		<h2>${wishList.title}</h2>
				                    	</a>
				                    	<span>가격 : ${wishList.price}</span>	
				                    	<span>${wishList.info}</span>
				                  </div>
				                 	<div class="wishIcon">
				                    	<span class="entypo-heart wishlist ${wishList.home_seq}" id="${wishList.home_seq}" active="false" style="color: rgb(157,157,157);"></span> 
				                    </div>
				                <div class="divider"></div>
				              </li>
		                </c:forEach>
		            </ul>
		          </div>
		        </section>
		        

		       
        <section id="historyDetail" class="historyDetail tabContent" data-mypage-type="history">
        	<ol class="historyLists">
		            <c:forEach var="reservationlist" items="${reservationlist}">	
		            	<c:set var="today" value="<%=new java.util.Date()%>"/>
		           		<fmt:parseDate var="starDate" value="${fn:split(reservationlist.stayingDate, ',')[0]}" pattern="yyyy-MM-dd"/>
		            	<c:if test="${starDate < today }">
		
				              <li class="historyList">
				                <div>	
					                    <div class="historyImage">
					                    <input  class="imageUrls" type="hidden" value="${reservationlist.url}" />
					              <!--         <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" /> -->
					                    </div>
					                    <div class="historyTexts">
					                            <div class="historyContent">
					                      		<a href="searchResultDetail.do?home_seq=${reservationlist.home_seq}&title=${reservationlist.title}" target="_blank">
					                            	<h2>${reservationlist.title}</h2>
					                        	</a>
					                            	<span> 결제 금액 : ${reservationlist.totalprice}</span>
					                            	<div class="reservationDateInfo">
					                            		<span>기간 : </span>	
					                            		<input type="text" class="reservationDates" value="${reservationlist.stayingDate}" readonly/>	
					                            	</div>
					                            	
					                            	<span> 예약 인원 : ${reservationlist.headcount}</span>
					                            		
					                            </div>
					                             <div class="bookingInfo">
					                         		 <!-- button onclick="bookingInfo('{booking.seq}')">예약상세</button> -->
					                         		 <input  class="fullImageUrl" type="hidden" value="${reservationlist.url}" />
					                      			<a href="mypageReview.do?home_seq=${reservationlist.home_seq}&apply_num=${reservationlist.apply_num}" target="_blank">
					                         		  		<button class="historyInfoBtn">예약상세 / 리뷰작성</button>
					                         		 </a>
					                      		 </div>
					                      </div>
					                      <div>
					                      	<%-- <input class="reservationState" type="button" value="${reservationlist.res_status }" />  --%>
					                      	<input class="reservationState complete" type="button" value="완료" /> 
					                      	<input type="hidden" class="reservationCancel" type="button" value="${reservationlist.cancel_reason }" /> 
					                      </div>                    
					                </div>
				                </li>
		                
		                <div class="divider"></div>
		                </c:if>
		             </c:forEach>
            </ol>           
        
        </section>
        <section id="infoDetail" class="infoDetail tabContent" data-mypage-type="privateInfo">
          <div>
             <form action="updateUser.do" method="post" class="myInfoForm" name="myInfoForm">
              <label for="name">이름</label>
              <input type="text" name="name" id="myname" value="${user.name}" />
              <label for="password">현재 비밀번호</label>
              <input type="password" name="password" id="mypassword" />
              <label for="emailla">이메일</label>
              <input type="text" name="email" id="myemail" value="${user.email}"  readonly/>
              <label for="phone">전화번호</label>
              <input type="text" name="phone" id="myphone" value="${user.phone}" />
              <label for="birthday">생년월일</label>
              <input type="date" id="birthday" name="birthday" value="${user.birthday}" />

              <input class="submitBtn" type="submit" value="수정 / 반영하기" />
            </form>
          </div>
        </section>
        <section id="paymentDetail" class="paymentDetail tabContent" data-mypage-type="payment"></section>
    </div>
   </div>
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script>
    const urls = document.querySelectorAll(".imageUrl");
    const historyurls = document.querySelectorAll(".imageUrls");
    

	/* 나의 예약 썸네일 지정  */
	
 	const thumNail = document.querySelectorAll(".accomodationImage");
	/* thumNail.innerHTML = '<img src="'+img[0]+'" alt="bookingphoto" />'; */
	var imgArr = [];
	for(var j=0; j<urls.length; j++){
		var url = urls[j].value;
		var imgs = url.slice(1,-1);
		var img = imgs.split(", ");
		/* console.log(img[j]); */
		imgArr.push(img[j]);
		
		
	}
	
	 for(var i=0; i < thumNail.length; i++){
		 	thumNail[i].innerHTML = '<img src="'+ imgArr[i]+'" alt="bookingphoto" />'; 
		 	
	}
	 
	 
	 
	 
	 /* 나의 히스토리 썸네일 지정 */
	 
	 const historythumNail = document.querySelectorAll(".historyImage");
		/* thumNail.innerHTML = '<img src="'+img[0]+'" alt="bookingphoto" />'; */
		var historyimgArr = [];
		for(var j=0; j<historyurls.length; j++){
			var historyurl = historyurls[j].value;
			var historyimgs = historyurl.slice(1,-1);
			var historyimg = historyimgs.split(", ");
			/* console.log(img[j]); */
			historyimgArr.push(historyimg[j]);
			
			
		}
		
		 for(var i=0; i < historythumNail.length; i++){
			 historythumNail[i].innerHTML = '<img src="'+ historyimgArr[i]+'" alt="bookingphoto" />'; 
			 	
		} 
		
	
	
	
/* 	$(document).on("click", ".reservationInfoExit", function(){
		$(".reservationDetailInfoContainer").css({'display': 'none'});
	})
	
	$(document).on("click", ".bookingInfoBtn", function(){
		$(".reservationDetailInfoContainer").css({'display': 'block'});
		var title = '<h2>{title}</h2>'
		$(".reservationInfoDetail").append(title);
		
		
	}) */
	
	
	
  
  /* 예약확정, 취소 버튼 기능입니다. res_status 값을 받아옵니다. */
  
  	const reservationStates = document.querySelectorAll(".reservationState");

  	for(var i=0; i< [...reservationStates].length; i++){
  		if(reservationStates[i].value === 'confirm'){
  			reservationStates[i].value =  "예약확정";
  			console.log([...reservationStates].length);
  		}else if(reservationStates[i].value === 'cancel'){
  			const cancelReason = document.querySelector(".reservationCancel");
  			reservationStates[i].value =  "취소";
  			reservationStates[i].style.backgroundColor = '#d65f5f';
  			reservationStates[i].addEventListener("click", function(){
  				alert(cancelReason.value);
  			})
  		}
  	}
  	
  	var imgContent = "";
	for(var i=0; i<img.length; i++){
		console.log(img[i]);
		imgContent += '<li class="mySlides fade" ><img src="'+ img[i]+'" alt="bookingphoto" /></li>'; 
	}
	
	$(".slideImagesContainer").append(imgContent);
  	
	const reservStarDate = document.querySelectorAll(".reservationDates");
	const spanDate = document.querySelectorAll(".reservationDate");
	var resContent = "";
	
	for(var num=0; num< [...reservStarDate].length; num++){
		var dates = reservStarDate[num].value;
		var date = dates.split(",");
		var nights = date.length;
		
		var strCheckin = date[0];
  		var strCheckout = date[date.length -1];
  		
		var arr1 = strCheckin.split('-');
		var arr2 = strCheckout.split('-');
		
		
		var checkin = new Date(arr1[0], arr1[1], arr1[2]);
		var checkout = new Date(arr2[0], arr2[1], arr2[2]);
				
		var diff = checkout - checkin;
		var currentDay = 24 * 60 * 60 * 1000;
		
		let result = parseInt(diff/currentDay);
		
		resContent = result + '박' + nights + '일';
		reservStarDate[num].value = resContent;
		console.log(resContent);
		
	}
/* 
		var stayingDates = []; */


  		

  	
  	</script>
</html>