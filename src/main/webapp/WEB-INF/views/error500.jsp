<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지입니다.</title>
</head>
<body onload="window_go_index();">
<%@ include file="/WEB-INF/views/search/Header.jsp"%>
			<div class="error">
				<h2>페이지 호출 오류</h2>
				<div>
					<h3>
						이용에 불편을 드려 죄송합니다.<br />예기치 않은 오류가 발생하였습니다.
					</h3>
					<p>
						요청하신 페이지가 존재하지 않거나<br/>오류가 발생하였습니다.<br/>빠른 시일내에 복구하도록 하겠습니다.<br/>잠시 뒤에 메인으로 이동하겠습니다. 
					</p>
				</div>
			</div>
			<script>
      function window_go_index(){
         setTimeout('go_index()',5000) 
      }

      function go_index(){
         location.href="/index.do"
      }

  </script>
  <%@ include file="/WEB-INF/views/Footer.jsp"%>
</body>
</html>