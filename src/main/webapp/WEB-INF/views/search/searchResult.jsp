<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과입니다</title>

<link rel="stylesheet" href="/resources/css/searchResult.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/search/Header.jsp"%>
      <div class="accomodationResults-container">
        <div class="accomodationResult">
          <section class="accomodationResult-container">
            <h2 class="searchresultHeader">${location } 지역의 숙소 결과입니다.</h2>
            <span class="searchHeader-sub">코로나 관련 정보를 확인하세요</span>
          </section>
          <c:forEach var="search" items="${resultList}" >
          <section>
            <div class="resultAccomodation-container">
              <div class="resultAccomodation">
                <div class="resultAccomodationImg">
                  <img src="https://sheerhouse.s3.ap-northeast-2.amazonaws.com/Accomodation/${search.home_seq}${search.host_seq}/${search.home_seq}${search.host_seq}${search.title}-1.jpg" alt="accomodationPhoto1" />
                </div>
                <div class="resultAccomodationText">
                  <a href="searchResultDetail.do?home_seq=${search.home_seq}&title=${search.title}" target="_blank"><span>${search.title }</span></a>
                  <div class="divider-short"></div>
                  <input class="prices" type="text" value="${search.price }"/>원 <span> /1박</span>
                  <input class="locations" type="hidden" value="${search.address }"/>
                </div>
                <div class="wishlistHeartIcon">
                	<span class="entypo-heart wishlist"></span> 
                </div>
              </div>
            </div>
            <div class="divider-resultAccomodation"></div>
          </section>
          </c:forEach>
        </div>
        <div id="map" style="width:100%;height:900px;"></div>
      </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4e2675e9fcb8f1c39453c9511374e2b&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4e2675e9fcb8f1c39453c9511374e2b&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		const prices = document.querySelectorAll(".prices");
		const locations = document.querySelectorAll(".locations"); // location 주소 array 형태로 불러옴
		const mapContainer = document.getElementById('map'); //map을 표시할 div!
		mapOption = { 
				center: new kakao.maps.LatLng(37.5710194900321, 126.992526739499), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
		const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		const geocoder = new kakao.maps.services.Geocoder();
		const positions = [];
		const latlng = []; 
		const posX = [];
		const posY = [];
		function getMapDes(){
			for(var i = 0; i<prices.length; i++){
				prices[i].value;
				positions.push('<div class="mapText">' + prices[i].value + '원 / 1박' + '</div>' );
			}

		}
		
		 
			function sleep(ms) {
			  return new Promise(
			    resolve => setTimeout(resolve, ms)
			  );
			}

			async function delayedGreeting() {
			for(var i = 0; i < locations.length; i++){
					geocoder.addressSearch(locations[i].value, getmapData);
				}
				getMapDes();
			  console.log("Hello");
			  await sleep(2000);
			  console.log("in sleep " + posX[1]);
			  console.log("in sleep " + positions[1]);
			  drawToMap();
			  console.log("World!");
			  await sleep(2000);
			  console.log("Goodbye!");
			}

			delayedGreeting();
		 console.log(positions);
		 function getmapData(results, status){
				if (status === kakao.maps.services.Status.OK) {
					for (var i = 0; i<results.length; i++){
			            //console.log(results[i].x); 
			            //console.log(results[i].y);
			            posX.push(results[i].x);
			            posY.push(results[i].y);
			            console.log(posX);
			            console.log(posY);
			       		//return posX, posY;
			        }
				}
			       console.log("in getMapData " + posX[0]);
			}
		
		 

			function drawToMap(){
				for (var i = 0; i < positions.length; i ++) {
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    map: map, // 마커를 표시할 지도
					    position: new kakao.maps.LatLng( posY[i], posX[i]) // 마커의 위치
					});

					// 마커에 표시할 인포윈도우를 생성합니다 
					var infowindow = new kakao.maps.InfoWindow({
					    content:  positions[i] // 인포윈도우에 표시할 내용
					   // console.log(positions[i]);
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
					
			}
		

</script>

</body>
</html>

</body>
</html>