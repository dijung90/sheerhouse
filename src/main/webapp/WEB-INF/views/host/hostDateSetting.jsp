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
<meta charset="UTF-8">
<title>날짜설정</title>

</head>
<body>
	<fmt:setLocale value="ko_kr"/>
	<c:set var="now" value="<%=new java.util.Date()%>" />
   	<fmt:formatDate var="starDate" value="${now}" pattern="yyyy-MM-dd"/>
   	
   	<!--test data   -->
	<input class="unusedDate" type="text" value="[2021-10-01,2021-10-02,2021-10.03,2021-10-04, 2021-10-10,2021-10-11]" readonly />
	<span>${starDate }</span>
	<div class="dateInput">
	<input type="text" name="date" />
	</div>
	
	<div>
		<div class="pickedDates">
			
		</div>
	</div>
	<template>
  <div>
    <b-calendar v-model="value" :date-disabled-fn="dateDisabled" locale="ko"></b-calendar>
  </div>
</template>
</body>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script>

		const unusedDate = document.querySelector(".unusedDate");	
		const unusedDate_value = unusedDate.value;
		const unusedDateArr = unusedDate_value.split(",");
		const unusedDateArr2 = unusedDate_value.trim(" ");
		console.log(unusedDateArr);
		console.log(unusedDateArr2);

/* 
		$(document).ready(function () {
			  $('.dateInput').daterangepicker({
			    format: "yyyy-mm-dd",
			    autoclose: true,
			    minDate: dateToday,
			    startDate: '+1d',
			    datesDisabled: unusedDateArr2
				
			  });
		}
		
		  $('input[name="date"]').daterangepicker({
			    startDate: moment(),
			    endDate: moment(),
			    datesDisabled: unusedDateArr2,
			    locale: {
			      format: 'YYYY-MM-DD'
			    }
			  },function(startDate, endDate, label) {
				    console.log("A new date selection was made: " + startDate.format('yyyy-MM-dd') + ' to ' + endDate.format('yyyy-MM-dd'));
			  });
		   */
		  
 $(function() {
	  $('input[name="date"]').daterangepicker({
	    startDate: moment(),
	    endDate: moment(),
	    isInvalidDate: unusedDateArr2,
	    locale: {
	      format: 'YYYY-MM-DD'
	    }
	  },function(startDate, endDate, label) {
		    console.log("A new date selection was made: " + startDate.format('yyyy-MM-dd') + ' to ' + endDate.format('yyyy-MM-dd'));
	  });
	});
	
	
	
/* 	
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
		  $(".input1").datepicker({
			     todayBtn:  1,
			     autoclose: true,
			 }).on('changeDate', function (selected) {
			     var minDate = new Date(selected.date.valueOf());
			     $('.input2').datepicker('setStartDate', minDate);
			     $('.input2').datepicker('setDate', minDate); // <--THIS IS THE LINE ADDED
			 });
			 $(".input2").datepicker()
			     .on('changeDate', function (selected) {
			         var maxDate = new Date(selected.date.valueOf());
			         $('.input1').datepicker('setEndDate', maxDate);
			     });
		}); 
 */




	
		
/* 		$(function() {
			  $('input[name="daterange"]').daterangepicker({
				  datesDisabled: unusedDateArr2,
				    format: "yyyy-mm-dd",
				    autoclose: true
				  
			  }, function(start, end, label) {
			    console.log("A new date selection was made: " + start.format('yyyy-MM-dd') + ' to ' + end.format('yyyy-MM-dd'));
			  });
			});
		 */
		 
</script>
</html>