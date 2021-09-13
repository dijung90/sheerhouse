<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/hostStyle.css" />
<script type="text/javascript" src=/resources/js/host.js></script>
<title>호스트등록하기</title>
</head>
 <body>
    <div class="property-container">
      <section class="property-header">
        <div>
          <h2>게스트에게</h2>
          <h2>숙소를 자세히 설명해주세요</h2>
        </div>
      </section>
      <form action="host/comfirmation.html" method="post" class="hostForm">
        <div class="propertyContent-container">
          <section class="property property-type">
            <div class="propertyInput-container">
              <h2>숙소타입</h2>
                <button
                  onclick="propertySelect(event)"
                  name="propertyType"
                  class="proBtn propertyApartment"
                  id="propertyApartment"
                  type="radio"
                  value="아파트"
                >
                  아파트
                </button>
                <button
                  onclick="propertySelect(event)"
                  name="propertyType"
                  class="proBtn propertyHouse"
                  id="propertyHouse"
                  type="radio"
                  value="주택"
                >
                  주택
                </button>
                <button
                  onclick="propertySelect(event)"
                  class="proBtn propertySpecialHouse"
                  id="propertySpecialHouse"
                  name="propertyType"
                  type="radio"
                  value="별채"
                >
                  별채
                </button>
                <button
                  onclick="propertySelect(event)"
                  name="propertyType"
                  class="proBtn propertyBB"
                  id="propertyBB"
                  type="radio"
                  value="B&B"
                >
                  B&B
                </button>
                <button
                  onclick="propertySelect(event)"
                  class="proBtn propertyUnique"
                  id="propertyUnique"
                  name="propertyType"
                  type="radio"
                  value="독특한 숙소"
                >
                  독특한 숙소
                </button>
                <button
                  onclick="propertySelect(event)"
                  class="proBtn propertyHotel"
                  id="propertyHotel"
                  name="propertyType"
                  type="radio"
                  value="부티크 호텔"
                >
                  부티크 호텔
                </button>
              <div class="arrow-container">
                <div class="right-arrow" onclick="proTypeArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-location">
            <div>
              <h2>숙소위치</h2>
              <div class="locationInputContainer">
                <input
                  name="propertyLocation"
                  class="locationInput"
                  type="text"
                  placeholder="숙소위치 검색"
                />
                <input class="locationInputBtn" type="submit" value="검색" />
              </div>
              <div id="map" class="locationInfo"></div>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proLocationLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proLocationRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-maxPeo">
            <div>
              <div class="maxPeoNum">
                <h2>최대 수용인원</h2>
                <div>
                  <input
                    class="addBtn"
                    type="button"
                    onclick="increaseNum()"
                    value="+"
                  />
                  <input
                    type="text"
                    value="0"
                    name="propertyMaxPeople"
                    class="maxPeopleInput"
                  />
                  <input
                    class="minusBtn"
                    type="button"
                    onclick="decreaseNum()"
                    value="-"
                  />
                </div>
              </div>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proMaxPeoLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proMaxPeoRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-price">
            <div>
              <h2>요금</h2>
              <input
                name="PropertyPrice"
                type="text"
                placeholder="요금을 입력해주세요"
              />
              <div class="arrow-container">
                <div class="left-arrow" onclick="proPriceLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proPriceRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-name">
            <div>
              <h2>숙소이름</h2>
              <input
                name="propertyName"
                type="text"
                placeholder="숙소이름을 입력해주세요"
              />
              <div class="arrow-container">
                <div class="left-arrow" onclick="proNameLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
                <div class="right-arrow" onclick="proNameRightArrow()">
                  <img
                    src="/resources/Images/icons/right-arrow.png"
                    alt="right-arrow"
                  />
                </div>
              </div>
            </div>
          </section>
          <section class="property property-description">
            <div>
              <h2>숙소설명</h2>
              <span>게스트에게 최대한 자세히 설명해주세요</span>
              <span>
                숙소위치의 장점, 장애인 시설, 화재시설등의 편의시설을 강조하면
                더 좋아요!
              </span>
              <textarea></textarea>
              <div class="arrow-container">
                <div class="left-arrow" onclick="proDescLeftArrow()">
                  <img src="/resources/Images/icons/right-arrow.png" alt="left-arrow" />
                </div>
              </div>
            </div>
            <input
              class="hostSubmit"
              type="submit"
              value="모두 작성했습니다."
            />
          </section>
        </div>
      </form>
    </div>
    <script src="../js/host.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c4e2675e9fcb8f1c39453c9511374e2b"
    >
          var container = document.getElementById("map");
      var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3,
      };

      var map = new kakao.maps.Map(container, options);
    </script>
  </body>
</html>