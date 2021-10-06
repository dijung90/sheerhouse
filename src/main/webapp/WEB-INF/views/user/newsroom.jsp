<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="/resources/css/help.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스룸</title>
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
	<div>
		<h2>게시판</h2>
<div id="outter">
	<table border="1">
		<tr>
			<td>No.</td>
			<td width="50%">제목</td>
			<td>등록일</td>	
		</tr>
		<c:forEach items="${Notice}" var="notice">
			<tr>
				<td>${notice.notice_num }</td>
				<td>${notice.title }</td>
				<td><fmt:formatDate value="${notice.regist_date }" pattern="yyyy.MM.dd"/> </td>
			</tr>
		</c:forEach>
	</table>
</div>
	</div>
</body>
</html>