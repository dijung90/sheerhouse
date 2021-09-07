<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/hostStyle.css" />
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
      <div class="propertyContent-container">
	        <section class="property property-type">
	          <h2>숙소타입</h2>
	          <input type="button" value="아파트" />
	          <input type="button" value="주택" />
	          <input type="button" value="별채" />
	          <input type="button" value="B&B" />
	          <input type="button" value="독특한 숙소" />
	          <input type="button" value="부티크 호텔" />
	        </section>
	        <section class="property property-location">
	          <h2>숙소위치</h2>
	          <div class="locationInputContainer">
	            <input
	              class="locationInput"
	              type="text"
	              placeholder="숙소위치 검색"
	            />
	            <input class="locationInputBtn" type="submit" value="검색" />
	          </div>
	          <div class="locationInfo"></div>
	        </section>
	        <section class="property property-maxPeo">
	          <div class="maxPeoNum">
	            <h2>최대 수용인원</h2>
	            <div>
	              <button>+</button>
	              <input type="text" />
	              <button>-</button>
	            </div>
	          </div>
	        </section>
	        <section class="property property-price">
	          <h2>요금</h2>
	          <input type="text" placeholder="요금을 입력해주세요" />
	        </section>
	        <section class="property property-name">
	          <h2>숙소이름</h2>
	          <input type="text" placeholder="숙소이름을 입력해주세요" />
	        </section>
	        <section class="property property-description">
	          <h2>숙소설명</h2>
	          <span>게스트에게 최대한 자세히 설명해주세요</span>
	          <span>
	            숙소위치의 장점, 장애인 시설, 화재시설등의 편의시설을 강조하면 더
	            좋아요!
	          </span>
	          <textarea></textarea>
	        </section>
      </div>
    </div>
</body>
</html>