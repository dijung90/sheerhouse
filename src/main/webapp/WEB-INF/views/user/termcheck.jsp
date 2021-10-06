<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 확인 페이지</title>
</head>
<body>
	<script type="text/javascript">
	$(document).ready(function(){
	    
        $("#chk").click(function(){    
            if($("#req_1").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }else if($("#req_2").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                return;
            }else if($("#req_3").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                return;
            }else{
                $("#termchecked").submit();
            }
        });    
    });
const agreeChkAll = document.querySelector('input[name=agree_all]');
agreeChkAll.addEventListener('change', (e) => {
let agreeChk = document.querySelectorAll('input[name=agree]');
for(let i = 0; i < agreeChk.length; i++){
  agreeChk[i].checked = e.target.checked;
}
});
</script>
<link href="style/memberStyle.css" rel="stylesheet" type="text/css"/>
<title>약관동의 창</title>
</head>
<body>
<form id="termchecked" action="accpet.do" name="form" method="post">
<input type="hidden" name="email" value="${user.email }">
<input type="checkbox" name="agree_all" id="agree_all">
  <span>모두 동의합니다</span><br>
 <table width="1400" height="650">
  
   <td height="60%" align="center">
   <hr><br>
  
   <p align="left">
   <span style="padding-left: 160px">
   <b>약관동의</b></span>
   </p>
  <tr>
   <br>
   <textarea rows="20" cols="150">
     ${basic.content}
   </textarea>
   <br>
   <input type="checkbox" id="req1" name="agree" > 개인정보 수집 및 이용에 동의합니다.
   <br><br>
   <textarea rows="20" cols="150">
     ${ guest.content}
   </textarea>
   <br><br>
   <input type="checkbox" id="req2" name="agree" > 개인정보 수집 및 이용에 동의합니다.
   <br><br>
   <textarea rows="20" cols="150">
     ${host.content}
   </textarea>
   <br><br>
   <input type="checkbox" id="req3" name="agree" > 개인정보 수집 및 이용에 동의합니다.
   <br><br>
   <hr>
   </td>
  </tr>
  <tr>
   <td align="center" valign="top">
	<input type="button" value="동의" id="chk()"/>&nbsp;&nbsp;&nbsp;
   </td>
  </tr>
 </table>
</form>
</body>
</html>