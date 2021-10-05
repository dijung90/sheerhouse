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
            
            	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>
           		<c:set var="starDate" value="${fn:split(reservationlist.stayingDate, ',')[0]}"></c:set> 
           		<input type="text" value="${starDate}" />
            	<fmt:formatDate value="" pattern="yyyy-MM-dd" var="Staying"/> 
            	
            	
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
                            		<span>예약 일자 : </span>
                            		<span class="reservationDate">${reservationlist.stayingDate}</span>	
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
		        

		       
        <section id="historyDetail" class="historyDetail tabContent" data-mypage-type="history"></section>
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
    
 /*        // 다음의 위치로 알아야 되기 때문에 
        imgOn = imgOn + 1;
        
        if( imgOn === imgLen ){
          // 다음의 위치가 총 개수보다 클 경우
          // 처음의 위치로 돌아간다
          $(".imgBox .img").eq(0).css("opacity", 1);
          $(".imgBox .img").eq(0).addClass("on");
        }else{
          // 다음 위치가 있는 경우 
          $(".imgBox .img").eq(imgOn).css("opacity", 1);
          $(".imgBox .img").eq(imgOn).addClass("on");
        }
      }); */
    
    
    
  
/* 	var url = urls.value;	
	var imgs = url.slice(1,-1);
	var img = imgs.split(", ");
*/
	
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
	
	
	
	$(document).on("click", ".reservationInfoExit", function(){
		$(".reservationDetailInfoContainer").css({'display': 'none'});
	})
	
	$(document).on("click", ".bookingInfoBtn", function(){
		$(".reservationDetailInfoContainer").css({'display': 'block'});
		var title = '<h2>{title}</h2>'
		$(".reservationInfoDetail").append(title);
		
		
	})
	
	
	
    


  
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
  	


  		

  	
  	</script>
</html>