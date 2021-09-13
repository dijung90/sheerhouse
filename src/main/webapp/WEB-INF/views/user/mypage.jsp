<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<link rel="stylesheet" href="/resources/css/mypageStyle.css" />
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
      <div class="mypageHeader">
        <h2>마이페이지</h2>
      </div>
      <div class="divider"></div>
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
          <div>
            <ol class="bookingLists">
              <li class="bookingList">
                <div>
                    <div class="accomodationImage">
                      <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" />
                    </div>
                    <div class="accomodationTexts">
                        <a href="#">
                            <div class="accomodationContent">
                            <h2>{acccomodation.title} </h2>
                            <span>{accomodation.shortDescription}</span>
                            </div>
                        </a>
                        <div class="bookingInfoBtn">
                          <button onclick="bookingInfo('{booking.seq}')">예약상세</button>
                         </div>
                    </div>
                </div>
                </li>
          
            </ol>
        </section>
        <!-- wishlist section -->
        <section id="wishListDetail" class="wishListDetail tabContent" data-mypage-type="wishList">
          <div>
            <ul class="wishLists">
              <li>
                <a href="#">
                  <div>
                    <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" />
                  </div>
                  <div class="wishListContent">
                    <h2>{acccomodation.title}</h2>
                    <span>{accomodation.shortDescription}</span>
                    <div class="wishIcon"><span>❤</span></div>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div>
                    <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" />
                  </div>
                  <div class="wishListContent">
                    <h2>{acccomodation.title}</h2>
                    <span>{accomodation.shortDescription}</span>
                    <div class="wishIcon"><span>❤</span></div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </section>
        <section id="historyDetail" class="historyDetail tabContent" data-mypage-type="history"></section>
        <section id="infoDetail" class="infoDetail tabContent" data-mypage-type="privateInfo">
          <div>
            <form action="" method="GET" class="myInfoForm">
              <label for="name">이름</label>
              <input type="text" id="name" value="{userName}" />
              <label type="password" for="password">현재 비밀번호</label>
              <input type="password" id="password" value="{userEmail}" />
              <label for="email">이메일</label>
              <input type="text" id="email" value="{userEmail}" />
              <label for="phone">전화번호</label>
              <input type="text" id="phone" value="{userPhone}" />
              <label for="birthInfo">생년월일</label>
              <input type="date" id="birthInfo" value="{userBirth}" />

              <input class="submitBtn" type="submit" value="수정 / 반영하기" />
            </form>
          </div>
        </section>
        <section id="paymentDetail" class="paymentDetail tabContent" data-mypage-type="payment"></section>
    </div>
   
  </body>
</body>
</html>