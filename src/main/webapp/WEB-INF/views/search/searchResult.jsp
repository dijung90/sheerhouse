<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KaKaoMapPage</title>
<link rel="stylesheet" href="/resources/css/searchResult.css" />
</head>
<body>
      <div class="navContainer">
        <div class="logoContainer">
          <a href="/"
            ><h2>쉬어家</h2>
            <span>sheerhouse</span></a
          >
        </div>
        <div>
          <div class="searchbar-small">
            <button class="locationBtn">
              <div>
                <span>지역</span>
              </div>
            </button>

            <button class="dateBtn">
              <div>
                <span>날짜</span>
              </div>
            </button>

            <button class="peopleBtn">
              <div>
                <span>인원</span>
              </div>
            </button>
          </div>
        </div>
        <nav class="menuContainer">
          <ul class="menus">
            <c:if test="${email == null}">
              <li class="loginBtn" onclick="loginnbtnClicked()">로그인</li>
              <li class="joinBtn" onclick="joginBtnClicked()">회원가입</li>
              <li><a href="#">호스트 등록하기</a></li>
            </c:if>
            <!-- <c:if test="${email != null}">
              <li class="loginBtn" onclick="loginnbtnClicked()">로그인</li>
              <li class="joinBtn" onclick="joginBtnClicked()">회원가입</li>
              <li><c:out value=" ${email}" /> 반갑습니다.</li>
              <li><a href="mypage.jsp">마이페이지</a></li>
              <li><a href="host.jsp">호스트 등록하기</a></li>
            </c:if> -->
          </ul>
        </nav>
      </div>
      <div class="accomodationResults-container">
        <div class="accomodationResult">
          <section class="accomodationResult-container">
            <h2 class="searchresultHeader">지역의 숙소</h2>
            <span class="searchHeader-sub">코로나 관련 정보를 확인하세요</span>
          </section>
          <section>
            <div class="resultAccomodation-container">
              <div class="resultAccomodation">
                <div class="resultAccomodationImg">
                  <img src="http://placehold.it/280x180" alt="" />
                </div>
                <div class="resultAccomodationText">
                  <span>accomation title</span>
                  <div class="divider-short"></div>
                  <p>accodation description</p>
                </div>
              </div>
            </div>
          </section>
        </div>
        <div id="map" style="width:50%;height:900px;"></div>
      </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4e2675e9fcb8f1c39453c9511374e2b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>카카오</div>', 
    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
},
{
    content: '<div>생태연못</div>', 
    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
},
{
    content: '<div>텃밭</div>', 
    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
},
{
    content: '<div>근린공원</div>',
    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
}
];

for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng // 마커의 위치
});

// 마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}

</body>
</html>