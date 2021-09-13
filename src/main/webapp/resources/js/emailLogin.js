		var usercode = "";
		var x ="";
			function emailsend(){
				var useremail = document.getElementById("email").value;
				var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(useremail.match(emailexp) == null){
					alert("이메일의 형식과 맞지 않습니다.");
				}else{	
				alert("인증번호를 전송하였습니다."); 
				var password = document.getElementById("password");
				password.setAttribute("type", "hidden");
				var passwordcheck = document.getElementById("passwordcheck");
				passwordcheck.setAttribute("type","hidden");
				var emailcheck = document.getElementById("emailcheck");
				emailcheck.setAttribute("type","text");
				emailcheck.setAttribute("value", "");
				usercode = "";
				for(var i = 0; i < 6 ; i++){
					
					usercode += Math.floor(Math.random() * 10);
				}

				$.ajax({
					url: 'sendEmail.do',
					type: 'GET',
					data: {
						email: useremail,
						code: usercode
						}
				});
				clearInterval(x);
				var time = 300;
				var min = "";
				var sec = "";
				x = setInterval(function(){
					min = parseInt(time/60);
					sec = time%60;

					document.getElementById("emailtext").innerHTML = "인증하기  " + min +":"+sec;
					time--;
					if(time < 0){
						clearInterval(x);
						alert("인증시간이 초과되었습니다. 다시 시도해 주세요.");
						document.getElementById("emailtext").innerHTML ="";
						emailcheck.setAttribute("type","hidden");
						emailcheck.setAttribute("value","");
					}
				}, 1000);
			}
		}
		function emailCheck(){
			
			var codeCheck = document.getElementById("emailcheck").value;
			
			if(usercode == codeCheck){
				alert("이메일 인증이 성공적으로 완료되었습니다.");
				clearInterval(x);
				document.getElementById("emailtext").innerHTML ="";
				emailcheck.setAttribute("type","hidden");
				var password = document.getElementById("password");
				password.setAttribute("type", "password");
				var passwordcheck = document.getElementById("passwordcheck");
				passwordcheck.setAttribute("type","password");
			}else{
				alert("이메일 인증이 실패하였습니다. 다시 시도해 주세요");
				clearInterval(x);
				document.getElementById("emailtext").innerHTML ="";
				emailcheck.setAttribute("type","hidden");
				emailcheck.setAttribute("value","");
				var password = document.getElementById("password");
				password.setAttribute("type", "password");
			}
	
		}
		
		function emailLogin(){
			var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var loginForm = document.loginForm;
			var userEmail = loginForm.email.value;
			var userPassword = loginForm.password.value;
			var userPasswordCheck = loginForm.passwordcheck.value;
			var userPasswordCheckType = loginForm.passwordcheck.type;
			var check = true;
			if(userEmail.match(emailexp) == null){
				alert("이메일의 형식과 맞지 않습니다.");
			}else if(userPassword == "") {
				alert("비밀번호는 필수 입력사항입니다.");
			}else if(userPasswordCheckType == "hidden"){
				function eventKeyup(userPassword){
					$("#passwordCheck").val(userPassword);
				}
				loginForm.submit();
			}else if(userPassword != userPasswordCheck){
				alert("비밀번호가 맞지 않습니다.");
				var password = document.getElementById("password");
				password.setAttribute("value", "");
				var passwordcheck = document.getElementById("passwordcheck");
				passwordcheck.setAttribute("value","");
			}else{
				
				loginForm.submit();
			}
			
		}	

		function searchEmail(){
			clearInterval(x);
			var useremail = document.getElementById("searchEmail").value;
			var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(useremail.match(emailexp) == null){
				alert("이메일의 형식과 맞지 않습니다.");
			}else{
				var check = true;
				
				$.ajax({
					url: "/searchEmail.do",
					type: "GET",
					async: false,
					data: {email:useremail},
					success: function(result){
						check = result;
					}
					
				});
				if(check === "false"){
					alert("존재하지 않는 이메일 정보입니다.");					
				}else{
					alert("인증번호를 전송하였습니다."); 
					var password = document.getElementById("searchPassword");
					password.setAttribute("type", "hidden");
					var passwordcheck = document.getElementById("searchPasswordCheck");
					passwordcheck.setAttribute("type","hidden");
					var emailcheck = document.getElementById("searchEmailCheck");
					emailcheck.setAttribute("type","text");
					emailcheck.setAttribute("value", "");
					usercode = "";
					for(var i = 0; i < 6 ; i++){
						
						usercode += Math.floor(Math.random() * 10);
					}

					$.ajax({
						url: 'sendEmail.do',
						type: 'GET',
						data: {
							email: useremail,
							code: usercode
							}
					});
					clearInterval(x);
					var time = 300;
					var min = "";
					var sec = "";
					x = setInterval(function(){
						min = parseInt(time/60);
						sec = time%60;

						document.getElementById("searchEmailText").innerHTML = "인증하기  " + min +":"+sec;
						time--;
						if(time < 0){
							clearInterval(x);
							alert("인증시간이 초과되었습니다. 다시 시도해 주세요.");
							document.getElementById("searchEmailText").innerHTML ="";
							emailcheck.setAttribute("type","hidden");
							emailcheck.setAttribute("value","");
						}
					}, 1000);
				}
			}
		}
		function searchEmailCheck(){
			
			var codeCheck = document.getElementById("searchEmailCheck").value;
			var emailcheck = document.getElementById("searchEmailCheck");
			
			if(usercode == codeCheck){
				alert("이메일 인증이 성공적으로 완료되었습니다.");
				clearInterval(x);
				document.getElementById("searchEmailText").innerHTML ="";
				emailcheck.setAttribute("type","hidden");
				var password = document.getElementById("searchPassword");
				password.setAttribute("type", "password");
				var passwordcheck = document.getElementById("searchPasswordCheck");
				passwordcheck.setAttribute("type","password");
			}else{
				clearInterval(x);
				document.getElementById("searchEmailText").innerHTML ="";
				var emailcheck = document.getElementById("searchEmailCheck");
				emailcheck.setAttribute("type","hidden");
				emailcheck.setAttribute("value","");
				alert("이메일 인증이 실패하였습니다. 다시 시도해 주세요");
				
			}
	
		}

		function passwordUpdate(){
			var joinForm = document.joinForm;
			var userEmail = document.getElementById("searchEmail").value;
			var userPassword = document.getElementById("searchPassword").value;
			var userPasswordCheck = document.getElementById("searchPasswordCheck").value;
			var emailexp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var check = true;
			if(userEmail.match(emailexp) == null){
				alert("이메일의 형식과 맞지 않습니다.");
			}else if(userPassword == "") {
				alert("비밀번호는 필수 입력사항입니다.");
			}else if(userPassword != userPasswordCheck){
				alert("비밀번호가 맞지 않습니다.");
				var password = document.getElementById("searchPassword");
				password.setAttribute("value", "");
				var passwordcheck = document.getElementById("searchPasswordCheck");
				passwordcheck.setAttribute("value","");
			}else{
				joinForm.submit();
			}
		}