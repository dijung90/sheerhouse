$("#stopBtn").click(function(){
	
	//체크된 체크박스의 갯수 구함
	console.log("length: " +$("input:checkbox[name=user_checkBox]:checked").length);
	
	var emailList = new Array();
	var checkbox = $("input:checkbox[name=user_checkBox]:checked");
	
	checkbox.each(function(i){
		
		//체크박스의 부모는 td , td의 부모는 tr이다.
		var tr = checkbox.parent().parent().eq(i); //체크된 체크박스의 tr을 구함
		var td = tr.children(); //체크된 체크박스의 td를 구함
		
		var email = td.eq(2).text(); // td의 3번째가 email값
		
		emailList.push(email);
		
	});
		$.ajax({
			
				url		: "userCheckResult",
				type	: "GET",
				data	: {"emailList" : emailList}, 
				success	: function(){
					console.log("성공");
					location.href="userTable.mdo";
				}
			});
	console.log(emailList);
	$("#emailList").html("체크된 row의 모든 email"+ emailList);
});