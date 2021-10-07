<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/Host/hostDateSetting.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>날짜설정</title>

</head>
<body>
	
	<form>
				<!-- 숙소 정보 수정 헤더 -->
				<div class="formHeader">
					<h2>숙소 정보 수정</h2>
					<span>숙소정보를 업데이트 합니다.</span>
				</div>
				
				<!-- 숙소 상태 변경 toggle switch button -->
				<div class="formStatus">
					<h3>숙소 상태</h3>
					<input type="checkbox" checked data-toggle="toggle" data-on="ON" data-off="OFF" data-onstyle="danger" data-offstyle="secondary">
				</div>
				
				<!-- 숙소 정보 수정 input here -->
				<div class="formInfo">
					<h3>숙소정보</h3>
					<span>숙소 이름</span>
					<input name="accomodationTitle" type="text" placeholder="" value=""/>
					<span>숙소 설명/세부정보</span>
					<textarea name="accomodationContent" type="text" placeholder="" value=""></textarea>
					
				</div>
				
				<!-- 숙소 타입 라디오 버튼 -->
				<div class="formType">
					<h3>숙소 타입</h3>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						   <label class="btn btn-secondary active">
						   <input type="radio" name="options" id="propertyApartment" autocomplete="off" checked> 아파트
						   </label>
						
						   <label class="btn btn-secondary">
						   <input type="radio" name="options" id="propertyHouse" autocomplete="off"> 주택
						   </label>	
						
						   <label class="btn btn-secondary">
						   <input type="radio" name="options" id="propertySpecialHouse" autocomplete="off"> 별채
						   </label>
						   
						   	<label class="btn btn-secondary">
						   <input type="radio" name="options" id="propertyBB" autocomplete="off"> B&B
						   </label>
						   
						   	<label class="btn btn-secondary">
						   <input type="radio" name="options" id="propertyUnique" autocomplete="off"> 독득한 숙소
						   </label>
						   	
						   	<label class="btn btn-secondary">
						   <input type="radio" name="options" id="propertyHotel" autocomplete="off"> 부티크 호텔
						   </label>
					</div>				
				</div>
				
				
				<!-- 숙소 주소 업데이트  -->
				<div class="formAddress">
				
					<h3>숙소 주소</h3>
					
					   <div class="locationInputContainer" >
			                <input
			                  name="address"
			                  class="locationInput"
			                  type="text"
			                  placeholder="주소찾기를 이용해주세요."
			                  readonly="readonly"
			    			  id="locationText"
			                />
			                 
			                <span id="locationMsg" class="spanMsg" style="color:red;font-size: 11px;"></span>
			                <input class="locationInputBtn" type="button" value="주소찾기" onClick="searchAddress();"/>
			                <span class="spanMsg" id="locationSpan" style="margin-top: 10px;"></span>
			                
			              	<div id="addressLayer"></div>
			          	</div>
			          	
			               <div id="map" class="locationInfo"  ></div>
			              	
					</div>
				<div class="formPrice">
					<h3>숙소 가격</h3>
					<input type="text" value="" placeholder="" />
				</div>
				
				<!-- 숙소 사진 변경  -->
				<div class="formPhoto">
					<h3>숙소 사진</h3>
					
					<span style="align-content: center; color:navy; font-size: 12px;margin-bottom: 20px;">사진 등록은 최대 3장까지 가능합니다.</span>
			              	<input type="hidden" id="imgCheck" value="0" />
			              	
			              	<div id="imagePreview">
			              		<input type="file" name="file" id="btnAtt" multiple="multiple" accept="img/*" style="display: none;"/>
			              		<input type="button" value="사진등록" onclick=document.all.btnAtt.click();>
			              		<span class="spanMsg" id="imgSpan" style="margin-top: 10px;"></span>
			              		
			              		<div id="att_zone" data-placeholder="등록버튼 및 드래그로 추가 가능합니다."></div>
			              	</div>
				</div>
				
				<!-- 달력 // 예약불가 일정 등록 -->
				
				<div>
					<h3>예약불가 일정 추가</h3>
					
			   		<!--test data   -->
					<input class="unusedDate" type="hidden" value="[2021-10-01,2021-10-02,2021-10.03,2021-10-04, 2021-10-10,2021-10-11]" readonly />
				
					<span>${starDate }</span>
					
					<div class="input-group input-daterange"> 
						<input type="text" name="date" class="unDates" />
					</div>
					
					<div>
					<!-- 선택된 날짜가 여기로 들어옵니다. -->
						<div class="pickedDates">
						</div>
					</div>
				</div>
				<button>수정하기</button>
	</form>
</body>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f48e658b16980f769e8e1860af3df72f&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src=/resources/js/host.js></script>

<script>

		
		
		
		/// call the method to find address --- start map funtion ---- 
		
		function typeSet(value){
			var type = document.getElementById("typeValue");
			type.setAttribute("value", value);
		}


		var container = document.getElementById("map");
		var options = {
		  center: new kakao.maps.LatLng(37.570999, 126.992651),
		  level: 5
		};
		var map = new kakao.maps.Map(container, options);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var geocoder = new kakao.maps.services.Geocoder();
		var marker = new kakao.maps.Marker({
		    map: map
		});
		function relayout(){
			  
			
			if($("#location").css("display") == "none"){
				setTimeout(function(){ map.relayout(); }, 0);
			}

			
		}

		var layer = document.getElementById("addressLayer");
		function searchAddress(){
			new daum.Postcode({
				oncomplete: function(data){
					var addr = data.address;
					
					document.getElementById("locationText").value = addr;
					
					geocoder.addressSearch(data.address, function(result, status) {
					//document.getElementById("locationMsg").innerHTML="상세주소까지 다 입력하셨나요? 게스트에게 정확한 주소를 알려줘야 합니다."
					//document.getElementById("detailLocationText").setAttribute("type","text");
							if (status === daum.maps.services.Status.OK) {

		                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		                    marker.setMap(null);
		                    marker = new daum.maps.Marker({
		                        position: coords,
		                        map: map
		                    });
		                    map.relayout();
		                    map.setCenter(coords);
		                    marker.setPosition(coords)
		                }
		            });
				}
			}).open();
			
		}
		
		
		
		
		////end of map function
		
		
		
		
		
		//// 사진 저장 기능 ------------- start save imgs function
		
		
		var fileCnt = 0;
		var imgForm = new FormData();
		/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){
		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width: 260px;height:200px;margin:5px;border:1px solid gray;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성 
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:20px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:transparent;color:#f00';
		  
		    
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
				fileCnt += fileArr.length;
		      	if(fileCnt < 4){
		      	for(f of fileArr){
		        	imgForm.append("file", f);

		      		imageLoader(f);
		     	 }
		      	}else{
		      		alert("사진등록은 최대 3장까지 가능합니다");
		      		fileCnt -= fileArr.length;
		      		return;
		      	} 
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      fileCnt += files.length;
		      if(fileCnt < 4){
		      	for(f of files){
		      		//imgArr.push(f);
		      		//console.log(imgArr);
		        	imgForm.append("file", f);
		      		imageLoader(f);
		      	}
		      }else{
		    	  alert("사진등록은 최대 3장까지 가능합니다");
		    	  fileCnt -= files.length;
		    	  return;
		      }
		    }, false)
		   
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		    	  
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		     	  img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		     	      
		     	}
		      
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');

		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);  
		            //imgArr.splice(i,1);
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p);
		        imgForm.delete(delFile);
		        fileCnt-= 1;
		        
		      }
		      div.appendChild(img)
		      div.appendChild(btn)
		      return div
		    }
		}('att_zone', 'btnAtt')
		
		function imgSet(){
			if(fileCnt !=0){
				document.getElementById("imgCheck").setAttribute("value", "1");
			}else{
				document.getElementById("imgCheck").setAttribute("value", "0");
			}
		}

	  function submitBtn(e){
		  	
			  var title = document.getElementById("title").value;
			
			  var info = document.getElementById("info").value;
			  console.log(info);
			  if(info === ""){
				console.log("진입");
				document.getElementById("infoSpan").innerHTML="숙소설명은 필수 입력사항입니다.";
				return;
			  }
			  
			  $.ajax({
				 url: "/fileSend.host?title="+title ,
				 enctype: 'multipart/form-data',
				 type:"POST",
				 data: imgForm,
				 async: false,
			  	 processData: false,
			  	 contentType: false
			  });
			  document.getElementById("infoSpan").innerHTML="";
			  document.getElementById("registForm").submit();
		 
	  }
	  
	  
	  
	  
	  /*--------- end of saving img funciton	 ----------------------  */
	  
	  
	  /* ------------start date bootstrap funtion ------------------- */
	  	
	const unusedDate = document.querySelector(".unusedDate");	
 	const unusedDate_value = unusedDate.value;
     const unusedDateArr = unusedDate_value.split(",");
     const unusedDateArr2 = unusedDate_value.trim(" ");
     console.log(unusedDateArr);
     console.log(unusedDateArr2);
     
     var dateToday = new Date(); 
     $(document).ready(function () {
       $(".input-daterange").datepicker({
         format: "yyyy-mm-dd",
         autoclose: true,
         minDate: dateToday,
         startDate: '+1d',
         datesDisabled: unusedDateArr2
		
       });
       $(".unDates").datepicker({
    	   	 format: "yyyy-mm-dd",
	  	     todayBtn:  1,
	  	     autoclose: true,
	  	 }).on('changeDate', function (selected) {
	  	     var minDate = new Date(selected.date.valueOf());
	 		var data = $(".unDates").val();
	 		console.log(data);
			var html = '<div class="form-content"><input type="text" value="'+ data +'"/><span class="deleteDate">X</span></div>';
			$(".pickedDates").append(html);
	  	 });

     });
     
		   
		   
		 
		 
</script>
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
</html>