<%@page import="com.main.sheerhouse.user.domain.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지입니다.</title>
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/resources/css/mainstyle.css" />
  		<meta name="google-signin-scope" content="profile email">
   		<meta name="google-signin-client_id" content="704009539267-6g73vgvh8j2u16gfps9r01t0srqldprf.apps.googleusercontent.com">
    	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="/resources/js/main.js"></script>
    	<script type="text/javascript" src="/resources/js/emailLogin.js"></script>
    	<script type="text/javascript" src="/resources/js/updatePassword.js"></script>
	
</head>
  <body class="main">
    <div>
      <div class="navContainer">
        <div class="logoContainer">
          <a href="/"><h2>쉬어家</h2>
          <span>sheerhouse</span></a>
        </div>
        <nav class="menuContainer">
          <ul class="menus">
         		 <c:if  test="${user.email eq null}" >
		            <li class="loginBtn" onclick="loginnbtnClicked()">로그인/회원가입</li>
				</c:if>
				<c:if test="${user.role eq 'user'}">
		            <li><a href="mypage.do">마이페이지</a></li>
					<li><a href="hostRegulation.host">호스트 등록하기</a></li>
				</c:if>						
				<c:if test="${user.role eq 'host'}">
					<li><a href="mypage.do">마이페이지</a></li>
					<li><a href="homes.host">호스트 페이지로 가기</a></li>
				</c:if>
          </ul>
        </nav>
      </div>
      <div class="bannerContainer">
        <div class="bannerImage">
          <img src="/resources/Images/banner/banner.jpg" alt="banner" />
        </div>
        <form class="searchContainer">
          <div class="searchWhere">
            <h3>Where</h3>
            <input type="text" placeholder="어디로 떠나시나요?" />
          </div>
          <div class="searchIn">
            <h3>Check in</h3>
            <input onclick="getInDate()" id="CheckinDate" type="date" aria-required="true"/>
            <!-- <label for="CheckinDate">체크인 날짜</label> -->
          </div>
          <div class="searchOut">
            <h3>Check out</h3>
            <input onclick="getOutDate()" id="CheckoutDate" type="date" aria-required="true" />
            <!-- <label for="CheckoutDate">체크아웃 날짜</label>// -->
          </div>
          <div class="searchPeo">
            <h3>People</h3>
            <input onclick=search() type="button" value="인원" />
          </div>
          <div class="search">
            <button type="submit">
              <img src="/resources/Images/icons/search-white.png" alt="search" />
            </button>
          </form>
        </div>
      </div>

      <section class="recommendPlaceContainer">
        <h3>이번 여행 여긴 어떤가요?</h3>
        <div>
          <div class="recommendImage image1">
            <a href="#"><img src="/resources/Images/place/place5.jpg" alt="place" /></a>
          </div>
          <div class="recommendImage image2">
            <a href="#"><img src="/resources/Images/place/place4.jpg" alt="place" /></a>
          </div>
          <div class="recommendImage image3">
            <a href="#"><img src="/resources/Images/place/place3.jpg" alt="place" /></a>
          </div>
          <div class="recommendImage image4">
            <a href="#"><img src="/resources/Images/place/place6.jpg" alt="place" /></a>
          </div>
        </div>
      </section>
      <section class="recommendActivityContainer">
        <h3>이런 액티비티도 있어요</h3>
        <div>
          <div class="recommendActivity activity1">
            <a href="#"
              ><img src="/resources/Images/activity/activity1.jpg" alt="place"
            /></a>
          </div>
          <div class="recommendActivity activity2">
            <a href="#"
              ><img src="/resources/Images/activity/activity2.jpg" alt="place"
            /></a>
          </div>
          <div class="recommendActivity activity3">
            <a href="#"
              ><img src="/resources/Images/activity/activity3.jpg" alt="place"
            /></a>
          </div>
          <div class="recommendActivity activity4">
            <a href="#"
              ><img src="/resources/Images/activity/activity4.jpg" alt="place"
            /></a>
          </div>
        </div>
      </section>


      <section class="footer"></section>
		</div>
		
		
		<div class="join-modal">
				<div class="join-modalContent">
					<div onclick="joinExitbtnClicked()" class="join-exitBtn"><img src="/resources/Images/icons/close.png" alt="cancel" /></div>
					<h3 class="joinHeader">비밀번호 변경</h3>
					<div class="divider"></div>
					<form class="joinForm" action="passwordUpdate.do" method="post" name="joinForm">
							<input type="text" name="email" id="searchEmail" placeholder="이메일을 입력해주세요" />
							<span id="searchEmailMsg" class="spanMsg"></span>
							<span onClick="searchEmail();" class="movoToJoin">인증번호 받기</span>
							<input type="hidden" name="emailcheck" id="searchEmailCheck"  placeholder="인증번호를 입력해주세요" />
							<span id="searchEmailTextMsg" class="spanMsg"></span>
            				<span class="movoToJoin" id="searchEmailText" onClick="searchEmailCheck();"></span>
							<input type="hidden" name="password" id="searchPassword" placeholder="변경할 비밀번호를 입력해주세요" />
							<input type="hidden" name="passwordcheck" id="searchPasswordCheck" placeholder="변경할 비밀번호를 다시 입력해주세요" />
							<span id="searchPasswordMsg" class="spanMsg"></span>
							<input class="joinSubmit" type="button" onClick="passwordUpdate();" value="비밀번호 변경하기"/>
					</form>
				</div>
			</div>
      </div>
      	
	<div class="login-modal" >
      	<div class="login-modalContent">
        <div class="login-exitBtn">
        	<img src="/resources/Images/icons/close.png" alt="cancel" />
        </div>
        <h3 class="loginHeader">로그인</h3>
        
        
        <div class="divider"></div>
        <form class="loginForm" action="emailUserInfo.do" name="loginForm" method="post">
            <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" />
            <span id="emailMsg" class="spanMsg"></span>
            <span onclick="emailsend();" class="authMsg" id="emailSend">인증번호 받기</span>
            <input type="hidden" name="emailcheck" id="emailcheck" class="emailcheck" placeholder="인증번호를 입력해주세요" />
            <span id="emailTextMsg" class="spanMsg"></span>
            <span class="movoToJoin" id="emailtext" onClick="emailCheck();"></span>
            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요" />
            <input type="hidden" name="passwordcheck" id="passwordcheck" placeholder="비밀번호를 다시 입력해주세요" />
            <span id="passwordMsg" class="spanMsg"></span>
            <input class="loginSubmit" type="button" onClick="emailLogin();" value="로그인 / 회원가입 하기"/>
            <span onclick="moveTojoinPage()" class="movoToJoin">비밀번호 변경</span>
        </form>
          <div class="divider bottom-margin"></div>
          
          <div class="alterLoginContainer">

          <div class="login googleLogin" id="googleClick">
           <a href="#" >
               <div class="g-signin2"  data-onsuccess="onSignIn"></div>
            </a>
          </div>

 
         <div class="login kakaoLogin" onclick="kakaoLogin();">
            <a href="javascript:void(0)">
              <div class="altercontent">
            		  <div class="alterLoginIcon">
              			<img src="/resources/Images/icons/kakao-talk.png"  alt="kakaotalk login"/>
              			</div>
              <span>카카오톡으로 로그인하기</span>
              </div>
          	</a>
        </div>

         </div>
    </div>
    </div>
      </div>
<script>
      function onSignIn(googleUser) {
    	 
    	var profile = googleUser.getBasicProfile();
        var username = profile.getName();
        var useremail = profile.getEmail();

        $("#googleClick").click(function(){
  		  $.ajax({
  			  url: 'googleUserInfo.do',
  			  type: 'POST',
			  async: false,
  			  data:{ email: useremail,
					name: username
				},
				success: function(result){
					location.href="index.do";
				}
  			});


  	  });
    }
    </script> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('f6cac299feab96616592fa86fe86f09e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			var useremail = response.kakao_account.email;
			var username = response.properties.nickname;

			$.ajax({
				url: 'kakaoUserInfo.do',
				type: 'POST',
				data : {
					email: useremail,
					name: username
				},
				success: function(result){
					location.href="index.do";
				},
				beforeSend:function(){
			        $('.wrap-loading').removeClass('display-none');
			    }
			    ,complete:function(){
			        $('.wrap-loading').addClass('display-none');
			    }

			});
          },
          fail: function (error) {
          },
        })
      },
      fail: function (error) {
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</body>
</html>