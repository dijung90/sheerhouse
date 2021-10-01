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
				<h2>페이지에 에러가 발생했습니다.</h2>
				<div>
					<h3>
						사유 : 요청하신 페이지가 없습니다.<br/>
					</h3>
					<p>
						잠시 후에 메인으로 보내드리겠습니다.
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
<script> 
function expireSession() { window.location = "index.do"; } 
setTimeout('expireSession()', <%= request.getSession().getMaxInactiveInterval() * 1000 %>); 
</script>

</html>