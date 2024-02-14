<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<link rel="stylesheet" href="/tobe/css/reset.css" />
<link rel="stylesheet" href="/tobe/css/common.css" />
<link rel="stylesheet" href="/tobe/css/main.css" />
<link rel="stylesheet" href="/tobe/css/contents.css" />
<link rel="stylesheet" href="/tobe/css/swiper.css" />
<style>
.calendarWrap{
	
	width:80%;
	margin: 0 auto;
}

#calendar {
  width: 80%;
  margin: 10px auto;
}
	
/*
i wish this required CSS was better documented :(
https://github.com/FezVrasta/popper.js/issues/674
derived from this CSS on this page: https://popper.js.org/tooltip-examples.html
*/

	:root {
		--fc-small-font-size: .95em;
		--fc-button-bg-color: #49654E;
	    --fc-button-border-color: #49654E;
	    --fc-button-hover-bg-color: #253528;
	    --fc-button-hover-border-color: #253528;
	    --fc-button-active-bg-color: #253528;
	    --fc-button-active-border-color: #253528;
	}
    
	.fc-col-header-cell{
	}
	.fc-day-sun a {
    color: red;
}
  
	/* 토요일 날짜: 파란색 */
	.fc-day-sat a {
	    color: blue;
	}
	.popper,
	.tooltip {
	  position: absolute;
	  z-index: 9999;
	  background: #FFFFFF;
	  color: black;
	  width: 500px;
	  border-radius: 3px;
	  box-shadow: 0 0 2px rgba(0,0,0,0.5);
	  padding: 10px;
	  text-align: center;
	}
	.style5 .tooltip {
	  background: #1E252B;
	  color: #000000;
	  max-width: 200px;
	  width: auto;
	  font-size: .200rem;
	  padding: .5em 1em;
	}
	.popper .popper__arrow,
	.tooltip .tooltip-arrow {
	  width: 0;
	  height: 0;
	  border-style: solid;
	  position: absolute;
	  margin: 5px;
	}
	
	.tooltip .tooltip-arrow,
	.popper .popper__arrow {
	  border-color: #FFC107;
	}
	.style5 .tooltip .tooltip-arrow {
	  border-color: #1E252B;
	}
	.popper[x-placement^="top"],
	.tooltip[x-placement^="top"] {
	  margin-bottom: 5px;
	}
	.popper[x-placement^="top"] .popper__arrow,
	.tooltip[x-placement^="top"] .tooltip-arrow {
	  border-width: 5px 5px 0 5px;
	  border-left-color: transparent;
	  border-right-color: transparent;
	  border-bottom-color: transparent;
	  bottom: -5px;
	  left: calc(50% - 5px);
	  margin-top: 0;
	  margin-bottom: 0;
	}
	.popper[x-placement^="bottom"],
	.tooltip[x-placement^="bottom"] {
	  margin-top: 5px;
	}
	.tooltip[x-placement^="bottom"] .tooltip-arrow,
	.popper[x-placement^="bottom"] .popper__arrow {
	  border-width: 0 5px 5px 5px;
	  border-left-color: transparent;
	  border-right-color: transparent;
	  border-top-color: transparent;
	  top: -5px;
	  left: calc(50% - 5px);
	  margin-top: 0;
	  margin-bottom: 0;
	}
	.tooltip[x-placement^="right"],
	.popper[x-placement^="right"] {
	  margin-left: 5px;
	}
	.popper[x-placement^="right"] .popper__arrow,
	.tooltip[x-placement^="right"] .tooltip-arrow {
	  border-width: 5px 5px 5px 0;
	  border-left-color: transparent;
	  border-top-color: transparent;
	  border-bottom-color: transparent;
	  left: -5px;
	  top: calc(50% - 5px);
	  margin-left: 0;
	  margin-right: 0;
	}
	.popper[x-placement^="left"],
	.tooltip[x-placement^="left"] {
	  margin-right: 5px;
	}
	.popper[x-placement^="left"] .popper__arrow,
	.tooltip[x-placement^="left"] .tooltip-arrow {
	  border-width: 5px 0 5px 5px;
	  border-top-color: transparent;
	  border-right-color: transparent;
	  border-bottom-color: transparent;
	  right: -5px;
	  top: calc(50% - 5px);
	  margin-left: 0;
	  margin-right: 0;
	}
</style>


 <script>
 $(function(){
// 		$(".removeBtn").click(function(){

// 			$.ajax({
// 				type: 'GET',
// 				url:'/tobe/user/common/calendar/list',
// 				dataType:"json",  
// 				success:function(res) {
// 					console.log(res.list);					
// 				}
// 			})
// 		})
		
		
	})

 document.addEventListener('DOMContentLoaded', function() {
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
//     	 headerToolbar: {          
//     		 left: 'prev,next today',          
//     		 center: 'title',          
//     		 right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'        
//     		 },
       initialView: 'dayGridMonth',
       events: function(info, successCallback, failureCallback){
    	   $.ajax({
   			type: 'GET',
   			url:'/retobe/user/calendar/list',
   			dataType:"json",  
   			success:function(res) {
				var jsonArray = [];
   				for(var i=0; i<res.list.length; i++){
   					var datacal ={
  						title : res.list[i].cal_title
  						,start : res.list[i].cal_start
  						,end : res.list[i].cal_end
  						, textColor :
  						  res.list[i].cal_subject === "토익" ? "red" :
  						  res.list[i].cal_subject === "토스" ? 'white' :
  						  res.list[i].cal_subject === "토플" ? 'white' :
  						  res.list[i].cal_subject === "아이엘츠" ? '#000000' :
  						  res.list[i].cal_subject === "텝스" ? 'white' :
  						  res.list[i].cal_subject === "오픽" ? '#FFFFFF' :
  						  res.list[i].cal_subject === "gre" ? '#FFFFFF' :
  						  res.list[i].cal_subject === "g-telp" ? '#FFFFFF' : ''
  						,backgroundColor:
  						  res.list[i].cal_subject === "토익" ? '#E7E9E3' :
  						  res.list[i].cal_subject === "토스" ? '#D1D7CF' :
  						  res.list[i].cal_subject === "토플" ? '#B8C2B7' :
  						  res.list[i].cal_subject === "아이엘츠" ? '#AEBAAE' :
  						  res.list[i].cal_subject === "텝스" ? '#9EAC9E' :
  						  res.list[i].cal_subject === "오픽" ? '#738876' :
  						  res.list[i].cal_subject === "gre" ? '#516B55' :
  						  res.list[i].cal_subject === "g-telp" ? '#008404' : ''
  						,textColor : 'black'  
  						,borderColor :
  						  res.list[i].cal_subject === "토익" ? '#E7E9E3' :
  						  res.list[i].cal_subject === "토스" ? '#D1D7CF' :
  						  res.list[i].cal_subject === "토플" ? '#B8C2B7' :
  						  res.list[i].cal_subject === "아이엘츠" ? '#AEBAAE' :
  						  res.list[i].cal_subject === "텝스" ? '#9EAC9E' :
  						  res.list[i].cal_subject === "오픽" ? '#738876' :
  						  res.list[i].cal_subject === "gre" ? '#516B55' :
  						  res.list[i].cal_subject === "g-telp" ? '#008404' : ''
  						,description : res.list[i].cal_content 		  
//   						,display : 'list-item'
  						
   					};
   					jsonArray.push(datacal);
   				}
   				console.log(res);					
   				console.log(jsonArray);
   				successCallback(jsonArray);
   			},
   		    error: function () {
                failureCallback(); // 실패할 경우에도 호출되어야 합니다.
            }
   		})
       },			
	    eventDidMount: function(info) {
		      var tooltip = new Tooltip(info.el, {
		        title: info.event.extendedProps.description,
		        placement: 'top',
		        trigger: 'hover',
		        container: 'body'
		      });
	    	},

     });
//     calendar.setOption('height', 700);
     calendar.setOption('aspectRatio', 1.6);
     calendar.render();
   });
 
//  $(function(){
// 		$(".removeBtn").click(function(){
// 			console.log("안녕");

// 		})
// } )
// 	window.onload = function(){
     
// 	}	

    </script>
  </head>
</head>
<body>
<div class="wrap">
	<div class="headerBox">
		<%@include file="/WEB-INF/views/user/common/userHeader.jsp"%>
	</div>
	<div class="calendarWrap">
		<div id='calendar'></div>
	</div>
	<div class="footerBox">
		<%@include file="/WEB-INF/views/user/common/userFooter.jsp"%>
	</div>
</div>
	  
</body>
</html>