<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/UserMypage/mypageShowDetail.css" />
</head>
<body>
	<nav>
		
	</nav>
	<div class="reservationDetailInfoContainer">
			 						<input class="imgUrls" type="hidden" value="${bookingDetail.url }" />
			 						<div class="slideshow-container">
											
									  <!-- Full-width images with number and caption text -->
									  <ul class="slideImagesContainer">
									  </ul>
									
									  <!-- Next and previous buttons -->
									  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
									  <a class="next" onclick="plusSlides(1)">&#10095;</a>
									</div>
									
									
									<div class="reservationInfoDetail">
									<h2>${bookingDetail.title}</h2>
						                	<div>
						                		<p>총 결제 금액 : ${bookingDetail.totalprice}</p>
						                	</div>
						                	<div>
						                		<p>예약 일정 ${bookingDetail.stayingDate}</p>
						                	</div>
						                	<div>
						                			<p>숙소 정보: ${bookingDetail.info}</p>
						                			<p>예약 인원: ${bookingDetail.headcount}</p>
						                			<p>호스트 : ${bookingDetail.host_info}</p>
						                			<p class="addressInfo">주소 : ${bookingDetail.address}</p>
						                	</div>
						                	<div>
						                		<span>숙소의 규칙을 확인해주세요</span>
						                		<p>${bookingDetail.rule}</p>
						                	</div>
						                	<div class=sendEmailContainer>
						                		<h2>호스트에게 연락하기</h2>
						                		<input type="text" value="${bookingDetail.email }" />
						                		<textarea></textarea>	
						                		<button>전송</button>		
						                	</div>
						         
						                
						               </div>
									<br>
									
             </div>
</body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script> 
  
  const urls = document.querySelector(".imgUrls");
  /* 	console.log(urls.value); */
  	var url = urls.value;
  	var imgs = url.slice(1,-1);
  	var img = imgs.split(", ");
  /* 	console.log(img); */

  	
  /* 	for(var j=0; j<urls.length; j++){
  		var url = urls[j].value;
  		console.log(url);
  		var imgs = url.slice(1,-1);
  		var img = imgs.split(", ");
  		console.log(img[j]);
  		imgArr.push(img[j]);		
  	} */
  	
  	var imgContent = "";
	for(var i=0; i<img.length; i++){
		console.log(img[i]);
		imgContent += '<li class="mySlides fade" ><img src="'+ img[i]+'" alt="bookingphoto" /></li>'; 
	}
	
	$(".slideImagesContainer").append(imgContent);
  
  
  
  var slideIndex = 1;
  showSlides(slideIndex);

  // Next/previous controls
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  // Thumbnail image controls
  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");

    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";

  }
  

  (function(){
      emailjs.init("YOUR_USER_ID");
   })();


  
  </script>
</html>