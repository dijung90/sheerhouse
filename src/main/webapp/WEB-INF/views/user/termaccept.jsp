<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav id="sub_menu">
		<ul>
		<li><a href="term.do">이용약관</a>
		<li><a href="newsroom.do">뉴스룸</a>
		<li><a href="companyDetail.do">회사 정보</a>
		<li><a href="help.do">도움말</a>
		</ul>
	</nav>

	<nav class="menuContainer">
          <ul class="menus">
         		 <c:if test="${user.role eq 'user'}">
		            <a href="termcheck.do">약관 동의하러 가기</a>
				</c:if>
          </ul>
        </nav>
       <div>
        <h3>이용약관</h3>
        <p>
        	${basic.content }
        </p>
        <h3>고객</h3>
        <p>${guest.content }</p>
       </div>
	<div class="clear"></div>
</body>
</html>