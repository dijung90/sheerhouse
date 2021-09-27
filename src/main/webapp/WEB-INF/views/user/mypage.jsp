<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <a href="/mypage.do">
                            <div class="accomodationContent">
                            <h2>${user.email} </h2>
                            <span>${user.phone }</span>
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
        <c:forEach var="wish" items="${wish}" >
        <section id="wishListDetail" class="wishListDetail tabContent" data-mypage-type="wishList">
          <div>
            <ul class="wishLists">
              <li>
                <a href="/mypage.do">
                  <div>
                    <img src="/resources/Images/place/place2.jpg" alt="bookingphoto" />
                  </div>
                  <div class="wishListContent">
                    <h2 href="/mypage.do">${wish.home_seq}</h2>
                    <span>${wish.email}</span>
                    <div class="wishIcon"><span>❤</span></div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </section>
        </c:forEach>
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
   
  </body>
</body>
</html>