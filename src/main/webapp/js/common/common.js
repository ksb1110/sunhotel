/*****************************************************************************************
 * common.js
 * 공통 javascript
 * 
 * getDataList	배열 형식의 반복 데이터를 JSON 형식의 데이터로 변형해 Array로 리턴
*****************************************************************************************/

var CmObject = new Object();

CmObject.getData = function(targetObj, inObject){
	targetObj.children().find("input, select, textarea").each(function(){
		var name = $.trim(this.name);
		var value = $(this).val();
		
		inObject[name] = value;
		
	});
	
	return inObject;
}

/**
 * 배열 형식의 반복 데이터를 JSON 형식의 데이터로 변형해 Array로 리턴
 * 
 * @param	motherObj	루프가 도는 부모 객체
 * @param	childObj	실제 루프가 도는 html 객체	(ex : li , tr 등)
 */
CmObject.getDataList = function(motherObj, childObj){
	var dataList = new Array();
	
	motherObj.each(function(){
		$(this).find(childObj).each(function(index){
			var onerow = {};
			
			$(this).children().find("input, select, textarea").each(function(){
				var name = $.trim(this.name);
				var value = $(this).val();
				
				onerow[name] = value;
				
			});
			dataList.push(onerow);
		});
	});
	
	return dataList;
}

/**
 * Ajax 에러 처리
 * @param request
 * @param status
 * @param error
 */
CmObject.fn_AjaxError = function(request, status, error){
	if(request.status == "500"){
		alert("로그인 정보가 없습니다. 로그인 후 진행하시기 바랍니다.");
		location.reload(true);
	}else{
		console.log("에러가 발생했습니다!");
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
}


function addZeros(num, digit) { // 자릿수 맞춰주기
    var zero = '';
    num = num.toString();
    if (num.length < digit) {
      for (i = 0; i < digit - num.length; i++) {
        zero += '0';
      }
    }
    return zero + num;
}


function setDatetime(){ 
        var dateString = ""; 
        var amPm = '오전'; // 초기값 AM
        var newDate = new Date(); 
        var week = ['일', '월', '화', '수', '목', '금', '토'];
        var day = newDate.getDay();
        var currentHours = addZeros(newDate.getHours(),2);
        var currentMinute = addZeros(newDate.getMinutes() ,2);
        if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            amPm = '오후';
            if(currentHours == 12){
            	currentHours = 12;
            }else{
            	currentHours = addZeros(currentHours - 12,2);
            }
        }
        dateString   = "<span>"+newDate.getFullYear()+". "+ ("0" + (newDate.getMonth() + 1)).slice(-2) +". "+ ("0" + newDate.getDate()).slice(-2) +"</span>";
        dateString += "&nbsp;<span class='day'>"+ week[day] +"</span>&nbsp;<span>"+ amPm +" "+ currentHours +" : "+ currentMinute +"</span>";
        
        //document.write(dateString); 문서에 바로 그릴 수 있다. 
        $("#nowDatetime").html(dateString); 
}

function setNowTime(){ 
        var dateString = ""; 
        var amPm = '오전'; // 초기값 AM
        var newDate = new Date(); 
        var week = ['일', '월', '화', '수', '목', '금', '토'];
        var day = newDate.getDay();
        var currentHours = addZeros(newDate.getHours(),2);
        var currentMinute = addZeros(newDate.getMinutes() ,2);
        if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            amPm = '오후';
            if(currentHours == 12){
            	currentHours = 12;
            }else{
            	currentHours = addZeros(currentHours - 12,2);
            }
        }
        dateString += amPm +" "+ currentHours +" : "+ currentMinute;
        
        //document.write(dateString); 문서에 바로 그릴 수 있다. 
        $("#nowTime").html(dateString); 
}

function ajaxGetDateTimeNow(){
	
	//현재시간 구하기
	var today = new Date();
	var hour = today.getHours();
	hour = eval(hour);
	
	  //-- ajax call  
	  $.ajax({
	      type: 'POST',
	      url: "/api/ajaxGetWeatherDate.ez",
	      success: function(data) {   
	            
	    	  nowRealDateTime = data.nowRealDateTime;
	    	  nowRealWeek  = data.nowRealWeek;
	          
	          console.log(" nowRealDateTime = "+ nowRealDateTime +", nowRealWeek = "+ nowRealWeek);

	          var dateString = ""; 
	          var amPm = '오전'; // 초기값 AM 
	          
	          var nowYear = nowRealDateTime.substr(0,4);
	          var nowMonth = nowRealDateTime.substr(5,2);
	          var nowDay = nowRealDateTime.substr(8,2);
	          var nowHH = nowRealDateTime.substr(11,2);
	          var nowMM = nowRealDateTime.substr(14,2);
	          /*
	          console.log(" nowYear = "+ nowYear );
	          console.log(" nowMonth = "+ nowMonth );
	          console.log(" nowDay = "+ nowDay );
	          console.log(" nowHH = "+ nowHH );
	          console.log(" nowMM = "+ nowMM ); */ 
	          
	          var currentHours = addZeros(nowHH,2);
	          var currentMinute = addZeros(nowMM,2);
	          if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	              amPm = '오후';
	              if(currentHours == 12){
	              	currentHours = 12;
	              }else{
	              	currentHours = addZeros(currentHours - 12,2);
	              }
	          }
	          dateString   = "<span>"+nowYear+". "+ ("0" + nowMonth).slice(-2) +". "+ ("0" + nowDay).slice(-2) +"</span>";
	          dateString += "&nbsp;<span class='day'>"+ nowRealWeek +"</span>&nbsp;<span>"+ amPm +" "+ currentHours +" : "+ currentMinute +"</span>";
	          
	          //document.write(dateString); 문서에 바로 그릴 수 있다. 
	          $("#nowDatetime").html(dateString); 

	          //-- 날씨/미세먼지 start
	          result01 = data.wp_hour;
	          	          	          
	          //날씨아이콘
	          result02 = "01";  //-- icon
	          
	          //맑음
	          if(data.wp_wfKor == "맑음") {
	        	  
	        	  //낮이면
	        	  if(hour >= 6 && hour < 18) {
					
	        		  result02 = "01_day";
	        	  }
	        	  //밤이면
	        	  else {
				
	        		  result02 = "01_night";
	        	  }
	          }
	          //구름 조금
	          else if(data.wp_wfKor == "구름 조금") {
	        	  
	        	  result02 = "02";
	          }	          
	          //구름 많음이면
	          else if(data.wp_wfKor == "구름 많음") {
	          	  
	        	  //낮이면
	        	  if(hour >= 6 && hour < 18) {
					
	        		  result02 = "03_day";
	        	  }
	        	  //밤이면
	        	  else {
				
	        		  result02 = "03_night";
	        	  }
	          }
	          //흐림
	          else if(data.wp_wfKor == "흐림") {
	        	  
	        	  result02 = "04";
	          }	 
	          //비
	          else if(data.wp_wfKor == "비") {
	        	  
	        	  result02 = "05";
	          }	 
	          //눈/비
	          else if(data.wp_wfKor == "눈/비") {
	        	  
	        	  result02 = "06";
	          }	  
	          //눈
	          else if(data.wp_wfKor == "눈") {
	        	  
	        	  result02 = "07";
	          }	 
	          
	          result03 = data.wp_wfKor; //날씨정보 한글
	          result04 = data.wp_temp; 
	          result04 = parseInt(result04);
	          
	          result05 = data.wp_pm10Val;
	          result06 = data.wp_pm10Cai; //미세먼지 지수PM10 지수 ( CAI 지수 : 1.좋음, 2.보통, 3.나쁨, 4.매우나쁨, 5.점검중 )
	          
	          //정수형으로 변경해줘야 한다.
	          result06 = eval(result06);
	          
	          switch (result06) {
	            case 1 : 
	            	result06 = "좋음";
	            	break;
	            case 2 : 
	            	result06 = "보통";
	            	break;
	            case 3 : 
	            	result06 = "나쁨";
	            	break;
	            case 4 : 
	            	result06 = "매우나쁨";
	            	break;
	            default: 
	            	result06 = "점검중";
	          }
	          
	          var weatherInfo = "<p class='top_text' >이도2동</p>";
	          
	          if (isNaN(result04) || result03 == null) {

	        	  weatherInfo += " <div class='text'><em  style='color:#5468E3;font-weight:bold;'>점검중</em></div>";
	          }
	          else {
	        	  
		          weatherInfo += " <div class='icon'> <em><img src='/images/kiosk/icon/weathers/weather_icon_"+ result02 +".png' alt='"+ result03 +"' ></em> </div>";
		          weatherInfo += " <div class='text'><strong>"+ result04 +"<span>℃</span></strong><em>"+ result03 +"</em> </div>";
	          }

	          var airInfo = "<p class='top_text'>미세먼지</p>";
	          if( $.trim(result06) == "점검중" ) {
	        	  
	              airInfo += "<div class='text'><em>"+ result06 +"</em></div>";
	          }
	          else {
	        	  
	              airInfo += "<div class='text'><strong>"+ result05 +"</strong><em>"+ result06 +"</em></div>";
	          }
	          
	                
	          $("#weatherInfo").html(weatherInfo);
	          $("#airInfo").html(airInfo);
	          
	          //-- 날씨/미세먼지 end
	          
	          
	          
	      },
	      error: function(){
	          //console.log("error~");
	      }
	  });
}

function startDate() { 
    date = setInterval( function(){ 
    	//setDatetime(); 
    	//setNowTime();  
    	ajaxGetDateTimeNow();
    	//console.log(" startDate() ");
    }, 60000);  //-- 60000 : 1마다 실행
} 

// 숫자앞에 0 채우기
function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}