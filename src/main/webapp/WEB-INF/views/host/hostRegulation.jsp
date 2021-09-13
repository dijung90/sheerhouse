<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/hostRegulation.css" />
</head>
<body>
	<div class="regulationContainer">
      <header class="header">
        <div>
          <h2>호스트가 되기 위한 첫번째 단계입니다.</h2>
        </div>
      </header>
      <div class="clickhere" onclick="check()">
        <h2 class="clickhereTitle">여기를 클릭해주세요</h2>
      </div>
      <div class="moveToRegi">
        <a href="/"></a>
      </div>
      <div class="agree1">
        <h2 class="agreeHeader">확인해주세요</h2>
        <div class="divider"></div>
        <div>
          <div class="check1">
            <h3>체크사항 예제 1</h3>
          </div>
          <label>
            <input
              class="cb-reg1-pass"
              name="accept"
              type="checkbox"
              value="pass"
              onchange="validate1()"
            />
            해당사실이 없습니다.
          </label>
          <label>
            <input
              class="cb-reg1-nonpass"
              name="accept"
              type="checkbox"
              value="nonpass"
              onchange="validate2()"
            />
            해당사실이 있습니다.
          </label>
        </div>

        <div>
          <div class="check2">
            <h3>체크사항 예제 2</h3>
          </div>
          <label
            ><input
              class="cb-reg2-pass"
              name="accept"
              type="checkbox"
              value="pass"
              onchange="validate3()"
            />해당사실이 없습니다.</label
          >
          <label
            ><input
              class="cb-reg2-nonpass"
              name="accept"
              type="checkbox"
              value="nonpass"
              onchange="validate4()"
            />해당사실이 있습니다.</label
          >
        </div>

        <div class="companyRule">
          <h3>
            쉬어家의 정책에 의거하여 답변사항이 거짓일 경우 호스팅 자격이 취소
            될 수 있습니다.
          </h3>
          <label
            ><input
              class="cb-reg3-pass"
              type="checkbox"
              name="accept"
              value="pass"
              onchange="validate5()"
            />동의합니다.</label
          >
          <label
            ><input
              class="cb-reg3-nonpass"
              type="checkbox"
              name="accept"
              value="nonpass"
              onchange="validate6()"
            />동의하지않습니다 .</label
          >
        </div>
        <div>
          <span>모두 확인하셨다면 아래의 버튼을 클릭해주세요.</span>
        </div>
        <button class="agreeBtn" onclick="agreeBtn1()">동의합니다.</button>
        <h5 class="warnMsg"></h5>
      </div>
    </div>
</body>
<script type="text/javascript" src="/resources/js/hostRegulation.js"></script>
</html>