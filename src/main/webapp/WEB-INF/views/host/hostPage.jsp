<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 전용 페이지 입니다.</title>
<link rel="stylesheet" href="resources/css/hostpage.css" />
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
      </div>
      <div class="myhostHeader">
        <h2>호스트페이지</h2>
        <p>호스트 전용 페이지 입니다.</p>
      </div>
      <div class="divider"></div>
      <div class="myhostGreeting">
        <h3>안녕하세요 host ${host.name}님</h3>
      </div>
      <div class="myhostSelect">
        <ul class="myhostlists">
          <li
            onclick="showMore(this)"
            class="tabs"
            id="accomodation"
            data-myhostpage-type="hostDetail"
          >
            등록된 숙소
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="reservation"
            data-myhostpage-type="reservationDetail"
          >
            게스트 예약
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="history"
            data-myhostpage-type="historyDetail"
          >
            히스토리
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="hostInfo"
            data-myhostpage-type="hostinfoDetail"
          >
            호스트 정보
          </li>
          <li
            onclick="showMore(this)"
            class="tabs"
            id="payment"  
            data-myhostpage-type="paymentDetail"
          >
            정산 내역
          </li>
        </ul>
      </div>
      <div class="detailContainer">
        <section id="hostDetail" class="hostDetail tabContent" data-myhostpage-type="accomodation">
            <h3>등록된 숙소 현황입니다.</h3>
            <div class="addmore">
                <button onclick="addmoreAccomodation()">숙소 등록 하기</button>
            </div>
            <ol class="hostingLists">   
              <li class="hostingList">
                <div>
                    <div class="accomodationImage">
                      <img src="resources/Images/place/place2.jpg" alt="hostingphoto" />
                    </div>
                    <div class="accomodationTexts">
                        <a href="#">
                            <div class="accomodationContent">
                            <h2>{acccomodation.title} </h2>
                            <span>{accomodation.shortDescription}</span>
                            </div>
                        </a>
                        <div class="hostingInfoBtn">
                          <a href="/#"></a><input type="button" value="숙소 정보"></a>
                        </div>
                    </div>
                </div>
                </li>
          
            </ol>
        
        </section>
        <!-- reservationDetail section -->
        <section id="reservationDetail" class="reservationDetail tabContent" data-myhostpage-type="reservation">
            <h3>예약 정보입니다.</h3>
            <div>
            <ul class="reservationLists">
              <li>
                <a href="#">
                  <div>
                    <img src="resources/Images/place/place5.jpg" alt="bookingphoto" />
                  </div>
                  <div>
                    <div class="reaservation-userInfo">
                        <h4>예약자: {guest.name}</h4>
                        <h4>예약 일자: {booking.date}</h4>
                     </div>
                      <div class="reservationContent">
                        <h3>{acccomodation.title}</h3>
                        <span>{accomodation.shortDescription}</span>
                      </div>
                  </div>
                  <div class="moreInfoBtn">
                      <input type="button" value="더 많은 정보" />
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </section>
        <section id="historyDetail" class="historyDetail tabContent"data-myhostpage-type="history"></section>
        <section id="hostinfoDetail" class="hostinfoDetail tabContent"data-myhostpage-type="hostInfo">
          <h3>게스트와 소통할 수 있는 정보를 입력, 수정할 수 있어요!</h3>
            <div>
            <form action="" method="GET" class="myHostInfoForm">
              <label for="name">이름</label>
              <input type="text" id="name" value="${host.name}" />
              <label for="email">연락 이메일</label>
              <input type="text" id="email" value="${host.email}" />
              <label for="phone">연락 전화번호</label>
              <input type="text" id="phone" value="${host.phone}" />
              <label for="introduction">소개</label>
              <textarea type="text" id="introduction" >${host.host_info}</textarea> 
              <input class="submitBtn" type="submit" value="수정 / 반영하기" />
            </form>
          </div>
        </section>
        <section id="paymentDetail" class="paymentDetail tabContent"data-myhostpage-type="payment"></section>
         
        <!-- alert modal section -->
        <div class="modal1">
          <div class="modal1-container">
            <div class="modal1-img">
              <img src="Images/icons/close.png" alt="X" onclick="exitModal1()">
            </div>
            <span>호스트 등록 화면으로 이동하시겠습니까?</span>
            <button class="moveToRegiBtn" onclick="movetoReg()">이동하기</button>
          </div>
        </div>
      </div>

</body>
<script src="resources/js/hostpage.js" ></script>
</html>