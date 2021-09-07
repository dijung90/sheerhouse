<%@page import="com.main.sheerhouse.user.domain.UserVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<title>메인페이지입니다.</title>
		<script type="text/javascript" src="/resources/js/main.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/resources/css/mainstyle.css" />
		  
		<c:set var="email" value="jenny" />
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
         		 <c:if  test="${email == null}" >
		            <li class="loginBtn" onclick="loginnbtnClicked()">로그인</li>
		            <li class="joinBtn" onclick="joginBtnClicked()">회원가입</li>
					<li><a href="#">호스트 등록하기</a></li>
				</c:if>
				<c:if test="${email != null}">
					<li class="loginBtn" onclick="loginnbtnClicked()">로그인</li>
		            <li class="joinBtn" onclick="joginBtnClicked()">회원가입</li>
					<li><c:out value=" ${email}"/> 반갑습니다.</li>
		            <li><a href="mypage.do">마이페이지</a></li>
					<li><a href="homes.host">호스트 등록하기</a></li>
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
					<h3 class="joinHeader">회원가입</h3>
					<div class="divider"></div>
					<form class="joinForm">
              				<input type="text" name="name" placeholder="이름을 입력해주세요" />
             				<input type="number" name="phone" placeholder="전화번호를 입력해주세요" />
							<input type="email" name="email" placeholder="이메일을 입력해주세요" />
							<button class="emailCheckBtn" onclick="idCheck()" type="button" name="emailCheck">이메일 중복확인</button>
							<input type="password" name="password" placeholder="비밀번호를 입력해주세요" />
							<input type="password" name="password-re" placeholder="비밀번호를 다시 입력해주세요" />
							<input class="joinSubmit" type="submit"  value="회원가입하기"/>
					</form>
						<div class="divider"></div>
						
						<div class="alterJoinContainer">

						<div class="join facebookLogin">
								<a href="#"/>
									<div class="altercontent">
											<div class="alterJoinIcon"><img src="/resources/Images/icons/facebook.png"  alt="facebook login"/></div>
											<span>페이스북으로 회원가입하기</span>
									</div>
								</a>
						</div>
						
						<div class="join googleLogin">
								<a href="#">
							    <div class="altercontent">
									<div class="alterJoinIcon">
										<img src="/resources/Images/icons/google.png"  alt="google login"/>
									</div>
									<span>구글로 회원가입하기</span>
								</div>
							</a>
						</div>
			            <div class="join kakaoLogin">
			              <a href="#" >
			                <div class="altercontent">
			                <div class="alterJoinIcon">
			                	<img src="/resources/Images/icons/kakao-talk.png"  alt="kakaotalk login"/>
			                </div>
			                <span>카카오톡으로 회원가입하기</span>
			              </div>
			            </a>
			          </div>
					<div class="join emailLogin">
						<a href="#">	
							<div class="altercontent">
								<div class="alterJoinIcon">
									<img src="/resources/Images/icons/email.png"  alt="facebook login"/>
								</div>
								<span>이메일로 회원가입하기</span>
							</div>
						</a>
					</div>
				</div>
			</div>
      </div>
      	
	<div class="login-modal">
      	<div class="login-modalContent">
        <div class="login-exitBtn">
        	<img src="/resources/Images/icons/close.png" alt="cancel" />
        </div>
        <h3 class="loginHeader">로그인</h3>
        
        
        <div class="divider"></div>
        <form class="loginForm" method="post" >
            <input type="text" name="email" placeholder="이메일을 입력해주세요" />
            <input type="password" name="password" placeholder="비밀번호를 입력해주세요" />
            <input class="login_Submit" type="submit"  value="로그인 하기"/>
            <span onclick="moveTojoinPage()" class="movoToJoin">회원가입 하러 가기</span>
        </form>
          <div class="divider"></div>
          
          <div class="alterLoginContainer">

         	 <div class="login facebookLogin">
             	 <a href="#">
               		 <div class="loginAltercontent">
                    	<div class="alterJoinIcon">
                    		<img src="/resources/Images/icons/facebook.png"  alt="facebook login"/>
                    	</div>
                   		 <span>페이스북으로 로그인하기</span>
                	</div>
            	  </a>
          	</div>
          
          <div class="login googleLogin">
           <a href="#">
                <div class="loginAltercontent">
                <div class="alterLoginIcon"><img src="/resources/Images/icons/google.png"  alt="google login"/></div>
                <span>구글로 로그인하기</span>
              </div>
            </a>
          </div>
          <div class="login kakaoLogin">
            <a href="#">
              <div class="altercontent">
            		  <div class="alterLoginIcon">
              			<img src="/resources/Images/icons/kakao-talk.png"  alt="kakaotalk login"/>
              			</div>
              <span>카카오톡으로 로그인하기</span>
              </div>
          	</a>
        </div>

            <div class="login emilLogin">
              <a href="#">	
             	 <div class="loginAltercontent">
	                  <div class="alterLoginIcon">
	                  		<img src="/resources/Images/icons/email.png"  alt="facebook login"/>
	                  </div>
                 	  <span>이메일로 로그인하기</span>
             	 </div>
              </a>
            </div>
         </div>
    </div>
    </div>
      </div>
      <script>
      /* 로그인 버튼 클릭 메서드 */
      $(".login_Submit").click(function(){

    	  /* 로그인 메서드 서버 요청 */
 	  	 $("#loginForm").attr("action", "/index.do");
         $("#loginForm").submit();
          
      });
      
      </script>
        </body>
        
</html>