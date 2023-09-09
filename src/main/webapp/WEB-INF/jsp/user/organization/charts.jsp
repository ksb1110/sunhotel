<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="nextez.com.vo.SingletonData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%@ taglib prefix="un" uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="viewport" content="height=1080, width=1920, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<meta name="author" content="(주)넥스트이지">
<meta name="description" content="제주시 부서안내">

<title>제주시 부서안내</title>

<script type="text/javascript" src="/js/comm/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/js/comm/jquery-ui-1.12.1.js"></script>
<script type="text/javascript" src="/js/display/html_comm.js"></script>
<script type="text/javascript" src="/js/comm/bxslider/jquery.bxslider.js"></script>
    
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/display/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/display/contents.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
     
<style type="text/css">
.bgimg {
	width: 100%;
    min-height: 100%;
}

.div_box {
    position:absolute;
    width:1000px;
    height:600px;
    color:#fff;
    top:50%;
    left:50%;
    margin: -300px 0 0 -500px;
}

.div_box2 img {
    position:absolute;
    width: 100%;
    height: 100%;
    color:#fff;
    top:0;
    left:0;
}
</style>
 
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("CRLF", "\r\n");
	pageContext.setAttribute("SP", "&nbsp;");
	pageContext.setAttribute("BR", "<br/>");
%> 

<script>

//1. 10분에 1분은 너무 길고 10분에 15초로 해달라고 함.
//2. 홍보이미지는 여러개 등록하게 하고 랜덤으로 1개만 10초동안 보여져야 함.
//3. 제주시알리미도 10초동안 2개 랜덤 알리미 이미지만 보여져야 함.
    
//알리미 이미지 호출
function fn_alimyList() {
    
    //제주시 알리미 ajax 호출
    $.ajax({
        type: 'POST',
        url: "/api/ajaxAlimyList.ez", 
        success: function(data) {  
        	
        	//랜덤 index 변수 초기화
            var rand01 = Math.floor(Math.random() * data.ajaxAlimyList.length);
            var rand02 = Math.floor(Math.random() * data.ajaxAlimyList.length);
            //console.log(" rand01= "+ rand01);
            
            //서로다른 두개의 랜덤 index를 구한다.
            if(rand01 == rand02) {
            	
            	if(rand02 > 0) {
            		
                    rand02 = rand02 - 1;
            	}
            	else {
            		
                    rand02 = rand02 + 1;
            	}
            }
			
            //제주시 알리미 개숫만큼 반복한다.
            $.each(data.ajaxAlimyList, function(index, val) { 
                
            	//console.log(val.imgName +" >>> "+ val.imgFullPath);
            	
            	//랜덤 index 에 해당하는 이미지를 셋팅한다.
            	if(index == rand01) {
            		
                    //$("#jjs_img01").attr("src",val.imgFullPath);
            		$("#jjs_img01").html("<img src='" + val.imgFullPath + "'>");
            	}
            	
            	//랜덤 index 에 해당하는 이미지를 셋팅한다.
                if(index == rand02) {
                	
                    //$("#jjs_img02").attr("src",val.imgFullPath);    
            		$("#jjs_img02").html("<img src='" + val.imgFullPath + "'>");
                }
            });
        },
        error: function() {
        	
            //console.log("error~");
        }
    });
}

//자릿수 맞추기
function addZeros(num, digit) {
	
	var zero = '';
    num = num.toString();

    if (num.length < digit) {
    	
   		for (i = 0; i < digit - num.length; i++) {
   			
        	zero += '0';
      	}
    }
    
    return zero + num;
}

//현재시간 셋팅
function setNowTime(timeGubun) { 
	
	var dateString = ""; 
	var amPm = '오전'; // 초기값 AM
	var newDate = new Date(); 
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var day = newDate.getDay();
	var currentHours = addZeros(newDate.getHours(),2);
	var currentMinute = addZeros(newDate.getMinutes() ,2);
	var currentSecond = addZeros(newDate.getSeconds() ,2);
	
	//12시간제이면
	if(timeGubun == "A") {
		
		// 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		if(currentHours >= 12) { 
			
	    	amPm = '오후';
		
	    	if(currentHours == 12) {
	    		
	        	currentHours = 12;
	    	}
	    	else {
	    		
	        	currentHours = addZeros(currentHours - 12,2);
	    	}
		}	
	}
	
	//시간 문자열 조합
	//dateString += currentHours + ":" + currentMinute + ":" + currentSecond;
	dateString += currentHours + ":" + currentMinute;

	//12시간제이면
	if(timeGubun == "A") {
		
		$("#ampm").html(amPm); 
	}
	//24시간제이면
	else {
		
		$("#ampm").html(""); 
	}
	
	$("#nowTime").html(dateString); 
}

//5초마다 시간을 셋팅한다. (분까지만 표시하기 때문에 1초에서 5초로 늘림)
function startDate(timeGubun) { 
	
	setInterval(function() {
    	
        setNowTime(timeGubun);  
    }, 5000);
} 

//현재 URL
var now_url = window.location.href;

//이미지 노출 시간(15초)
var imgTimeOut = 15 * 1000;

//조직도 노출 시간(9분 45초)
var delay_time =  (1000 * 60) * 9 + (1000 * 45);
//var delay_time =  (10000 * 6) * 1;

//알리미/홍보이미지는 숨기고 조직도는 보이게 한다.
function fn_shot_1() {
	
	 $("#bgimg").hide();
	 //$("#wrap").show();
	$("*","#wrap").css("opacity","1");
	$("#daily_info_utube_wrap").css("opacity","0.1");
	
	//알리미 이미지 초기화
	$("#jjs_img01").html("");
	$("#jjs_img02").html("");
}

//조직도는 숨기고 알리미/홍보이미지는 보이게 한다.
function fn_shot_2() {   
	
	//제주시 알리미 이면
    <c:if test="${facilityVO.promotionGubun eq 'A'}">
	fn_alimyList();
    </c:if>
	
    //$("#wrap").hide();
    $("*","#wrap").css("opacity","0");
    $("#bgimg").show();
}

//알리미/홍보이미지를 imgTimeOut초 동안 보여지게 하고 화면 리로드 시킨다.
function fn_timeoutShot() {
	
	//조직도는 숨기고 알리미/홍보이미지는 보이게 한다.
	fn_shot_2();
	
	//알리미 남은시간 표시
	runDecreaseAlimyTime();
	
	//imgTimeOut초 후에 실행한다.
	setTimeout(function() {
		
		//location.href = now_url;		
		//알리미/홍보이미지는 숨기고 조직도는 보이게 한다.
		fn_shot_1(); 
		//document.location.reload();	
		
		//imgTimeOut초 후에 실행
		intervalTimeoutShot();
		
	}, imgTimeOut);
}

//delay_time초 후에 실행
function intervalTimeoutShot() {
	
	//delay_time초 후에 실행
	setTimeout(function() {
    	
    	//알리미/홍보이미지를 imgTimeOut초 동안 보여지게 한다.
    	fn_timeoutShot();        
	}, delay_time);
}

//알리마 남은 시간 표시 타이머
var decreaseAlimyTimer; 

//알리미 보여지는 총 시간(초)
var alimyTime = imgTimeOut / 1000;
	
//알리미 보여지는 총 시간 감소 처리	
function decreaseAlimyTime() {
	
	//1초마다 알리미 보여지는 총시간 감소 표시
	decreaseAlimyTimer = setInterval(function() {
    	
        //남은 시간 계산
		alimyTime--;
        
        //남은 시간 표시
        $("#alimy_timer").html(alimyTime + "초");
        	
    }, 1000);
}

//알리미 남은시간 표시 처리
function runDecreaseAlimyTime() {
	
	//알리미 남은시간 표시 타이머 중지 처리
	clearInterval(decreaseAlimyTimer);
	
	//알리미 보여지는 총 시간(초) 초기화
	alimyTime = imgTimeOut / 1000;
	$("#alimy_timer").html(alimyTime + "초");
	
	//알리미 보여지는 총 시간 감소 처리	
	decreaseAlimyTime();
}

$(document).ready(function() {   

	<c:if test="${timeChartYn == 'Y'}"> <!-- 시간 배치타입이 있는 경우 -->
	
	//시간 셋팅
	startDate('${timeGubun}'); 
	
	</c:if>
	
	//delay_time초 후에 실행
	intervalTimeoutShot();
	
	//등록된 홍보이미지 갯수
  	<c:set var="imgSaveCnt" value="${fn:length(displayPromotionImgList)}"/> 
    
  	//홍보이미지 갯수
  	var promotionImgCnt = ${imgSaveCnt};
  	
  	//홍보이미지 랜덤 인덱스
  	var randTop = Math.floor(Math.random() * ${imgSaveCnt});
	
  	//등록된 홍보이미지 갯수만큼 반복한다.
  	<c:forEach items="${displayPromotionImgList}" var="item" varStatus="status"> 
  	
  		//홍보이미지
      	<c:set var="imgSavePath" value="${item.imgPath}"   />  
      
      	//반복문 인덱스
      	var status_index = ${status.index};
      	
      	//반복문 인덱스와 홍보이미지 랜덤 인덱스가 같은 경우
      	if(status_index == randTop) {
      		
          	$("#jjs_imgTop").attr("src","${item.imgPath}");    
      	}
      	
  	</c:forEach>
  
	//홍보 이미지 없으면 자동으로 알리미 호출
	if(promotionImgCnt <= 0) {
	  
		fn_alimyList();
	  	$("#jejusi_alimi_div").show();
  	}
});
 
 
//날씨 셋팅
function setWeather() {
	
	//현재시간 구하기
	var today = new Date();
	var hour = today.getHours();
	hour = eval(hour);
	
	//날씨명
	var weatherNm = "${weatherSaveVO.wfKor}";
	
	//날씨아이콘 코드
	var weatherIconCode = "01";
    
    //맑음
    if(weatherNm == "맑음") {
  	  
		//낮이면
  	  	if(hour >= 6 && hour < 18) {
			
  		  	weatherIconCode = "01_day";
  	  	}
  	  	//밤이면
  	  	else {
		
  		  	weatherIconCode = "01_night";
  	  	}
    }
    //구름 조금
    else if(weatherNm == "구름 조금") {
  	  
  	 	weatherIconCode = "02";
    }	          
    //구름 많음이면
    else if(weatherNm == "구름 많음") {
    	
  	  	//낮이면
  	  	if(hour >= 6 && hour < 18) {
			
  		  	weatherIconCode = "03_day";
  	  	}
  	  	//밤이면
  	  	else {
		
  		  	weatherIconCode = "03_night";
  	  	}
    }
    //흐림
    else if(weatherNm == "흐림") {
  	  
  	  	weatherIconCode = "04";
    }	 
    //비
    else if(weatherNm == "비") {
  	  
  	  	weatherIconCode = "05";
    }	 
    //눈/비
    else if(weatherNm == "눈/비") {
  	  
  	  	weatherIconCode = "06";
    }	  
    //눈
    else if(weatherNm == "눈") {
  	  
  	  	weatherIconCode = "07";
    }	 
    
    //날씨아이콘
    var weatherIcon = "/images/kiosk/icon/weathers/weather_icon_" + weatherIconCode + ".png";
    
	//기온
	<fmt:parseNumber var= "wp_temp" integerOnly= "true" value= "${weatherSaveVO.temp}" />
	var temp = "${wp_temp}";
	
	//미세먼지수치
	var pm10Val = "${weatherSaveVO.pm10Val}";
	
	//미세먼지 지수PM10 지수 ( CAI 지수 : 1.좋음, 2.보통, 3.나쁨, 4.매우나쁨, 5.점검중 )
	var pm10Cai = "${weatherSaveVO.pm10Cai}"; 
	var pm10CaiTxt = "좋음";
	
	//미세먼지상태아이콘 코드
	var pm10IconCode = "01";
	
	//좋음
	if(pm10Cai == "1") {
		
		pm10IconCode = "01";
		pm10CaiTxt = "좋음";
	}
	//보통
	else if(pm10Cai == "2") {
		
		pm10IconCode = "02";
		pm10CaiTxt = "보통";
	}
	//나쁨
	else if(pm10Cai == "3") {
		
		pm10IconCode = "03";
		pm10CaiTxt = "나쁨";
	}
	//매우나쁨
	else if(pm10Cai == "4") {
		
		pm10IconCode = "04";
		pm10CaiTxt = "매우나쁨";
	}
	//점검중
	else {
		
		pm10IconCode = "";
		pm10CaiTxt = "점검중";
	}
	
	//미세먼지상태아이콘
	var pm10Icon = "/images/kiosk/icon/weathers/fineDust_icon_" + pm10IconCode + ".png";
	
	//점검중이면
	if(pm10IconCode == "") {
		
		pm10Icon = "";		
	}
	
	//날씨아이콘 셋팅
	$("#weatherImgEm").html("<img src='" + weatherIcon + "' alt='" + weatherNm + "'>");
	
	//기온 셋팅
	$("#weatherTempSpan").html(temp);
	
	
	
	//미세먼지 아이콘 셋팅
	//점검중이면
	if(pm10CaiTxt == "점검중") {
		
		//미세먼지 수치 셋팅
		$("#pm10Strong").html("- <span>㎍/㎥</span>");
		
		$("#pm10IconTxtEm").html(pm10CaiTxt);	
	}
	//점검중이 아니면
	else {
		
		//미세먼지 수치 셋팅
		$("#pm10Strong").html(pm10Val + " <span>㎍/㎥</span>");
		
		$("#pm10IconTxtEm").html("<img src='" + pm10Icon + "' alt='" + pm10CaiTxt + "'> " + pm10CaiTxt);	
	}
}

//유튜브 셋팅
function setUtube(sizeGubun) {
	
	//크기 설정 (size880, size480, size320)
	$("#daily_info_utube").removeClass("size880");
	$("#daily_info_utube").removeClass("size480");
	$("#daily_info_utube").removeClass("size320");

	$("#daily_info_utube_wrap").removeClass("size880");
	$("#daily_info_utube_wrap").removeClass("size480");
	$("#daily_info_utube_wrap").removeClass("size320");
	
	//기본
	if(sizeGubun == "N") {
		
		$("#daily_info_utube").addClass("size480");
	}
	//작은사이즈
	else if(sizeGubun == "S") {
		
		$("#daily_info_utube").addClass("size320");
	}
	//큰사이즈
	else if(sizeGubun == "B") {
		
		$("#daily_info_utube").addClass("size880");
	}
	
	$("#daily_info_utube_wrap").width($("#daily_info_utube").width());
	$("#daily_info_utube_wrap").height($("#daily_info_utube").height());
}

//홍보이미지 셋팅
function setJejusiAlimy(sizeGubun, now_alimy_no) {
	
	//크기 설정 (size270, size400)
	$("#daily_info_alimy" + now_alimy_no).removeClass("size270");
	$("#daily_info_alimy" + now_alimy_no).removeClass("size400");
	
	//기본
	if(sizeGubun == "N") {
		
		$("#daily_info_alimy" + now_alimy_no).addClass("size400");
		$("#daily_info_alimy" + now_alimy_no).css("width","400px");
		$("#daily_info_alimy" + now_alimy_no).css("height","400px");
	}
	//작은사이즈
	else if(sizeGubun == "S") {
		
		$("#daily_info_alimy" + now_alimy_no).addClass("size270");
		$("#daily_info_alimy" + now_alimy_no).css("width","270px");
		$("#daily_info_alimy" + now_alimy_no).css("height","270px");
	}
	
	//제주시 알리미정보를 가져와서 표시한다.
	runJejusiAlimyList(now_alimy_no);
}

//제주시알리미 데이터
var alimyData;

//제주시알리미정보를 가져와서 표시한다. 
function runJejusiAlimyList(now_alimy_no) {
    
	//첫 홍보배너인 경우에만 호출
	if(now_alimy_no == 1) {
		
		//console.log("첫 홍보배너인 경우에만 ajax 호출");
		
		$.ajax({
	        type: 'POST',
	        url: "/api/ajaxAlimyList.ez", 
	        success: function(data) {  
	            
	        	//제주시알리미 데이터 셋팅
	        	alimyData = data;
	        	
	        	//알리미정보가 있으면
	        	if(data && data.ajaxAlimyList && data.ajaxAlimyList.length > 0) {
	        		
	        		//html 구성
	        		var html = "";
	        		
	        		//이미지 넓이를 구하기 위하여 감싸진 레이어의 넓이를 가져온다.
	        		var width = $("#daily_info_alimy" + now_alimy_no).width();
	        		
	        		//이미지 높를 구하기 위하여 감싸진 레이어의 높이를 가져온다.
	        		var height = $("#daily_info_alimy" + now_alimy_no).height();
	        		        		
	        		html += "<ul class='alimi_img public'>";
	        		
	        		//알리미정보 갯수 만큼 반복하면서 html 을 구성한다.
	        		$.each(data.ajaxAlimyList, function(index, val) { 
	                    
	        			//이미지 경로
	                	var imgSrc = val.imgFullPath;
	                	
	                	//이미지명
	                	var imgName = val.imgName;
	                	
	                	html += "<li><img src='" + imgSrc + "' alt='" + imgName + "' width='" + width + "' height='" + height + "'></li>";
	                });
	        		
	        		html += "</ul>";
	        		
	        		//html 삽입
	        		$("#daily_info_alimy" + now_alimy_no).html(html);
	        		
	        		//알리미슬라이더 실행
	        		alimySliderRun(now_alimy_no);
	        	}        
	        },
	        error: function() {
	        	
	            //console.log("error~");
	        }
	    });
	}
	//두번째 이상 홍보배너인 경우
	else {
		
		//console.log("두번째 이상 홍보배너인 경우호출");
		
		//이미 가져온 제주시알리미정보를 다른 배너로 표시한다. 
		runJejusiAlimyListRe(now_alimy_no);
	}   
}

//두번째 알리미 인터벌 오브젝트
var secondAlimyInterval;

//이미 가져온 제주시알리미정보를 다른 배너로 표시한다. 
function runJejusiAlimyListRe(now_alimy_no) {
	
	//console.log("0.5초마다 반복한다.");
	
	//0.5초마다 반복한다.
	secondAlimyInterval = setInterval(function() {
    	
		//알리미 데이터가 있는 경우
    	if(alimyData && alimyData.ajaxAlimyList && alimyData.ajaxAlimyList.length > 0) {
    		
    		//console.log("알리미 데이터가 있는 경우 두번째알리미 셋팅");
    		
    		//html 구성
    		var html = "";
    		
    		//이미지 넓이를 구하기 위하여 감싸진 레이어의 넓이를 가져온다.
    		var width = $("#daily_info_alimy" + now_alimy_no).width();
    		
    		//이미지 높를 구하기 위하여 감싸진 레이어의 높이를 가져온다.
    		var height = $("#daily_info_alimy" + now_alimy_no).height();
    		        		
    		html += "<ul class='alimi_img public'>";
    		
    		//알리미정보 갯수 만큼 반복하면서 html 을 구성한다.
    		$.each(alimyData.ajaxAlimyList, function(index, val) { 
                
    			//이미지 경로
            	var imgSrc = val.imgFullPath;
            	
            	//이미지명
            	var imgName = val.imgName;
            	
            	html += "<li><img src='" + imgSrc + "' alt='" + imgName + "' width='" + width + "' height='" + height + "'></li>";
            });
    		
    		html += "</ul>";
    		
    		//html 삽입
    		$("#daily_info_alimy" + now_alimy_no).html(html);
    		
    		//console.log("두번재 알리미슬라이더 실행");
    		
    		//알리미슬라이더 실행
    		alimySliderRun(now_alimy_no);
    		
    		//console.log("반복실행중지");
    		
    		//반복실행 중지
    		clearInterval(secondAlimyInterval);
    	}
        
	}, 1000);
}

//알리미슬라이더 실행
function alimySliderRun(now_alimy_no) {
	
	var slideImgLength = $("#daily_info_alimy" + now_alimy_no + " .alimi_img.public > li").length;
	
	//일반 사항 알리미
    if(slideImgLength > 1) {
    	
		var startSlideIndex = 0;
    	
    	if(now_alimy_no > 1) {
    		
    		//2020.07.22 ksb1110@gmail.com
    		//홍보배너가 2개 올라왔을 때 로딩문제로 겹치는 현상이 발생하여 두번째 홍보배너는 전체 배너중 중간 배너가 먼저 보여지게 수정
    		//startSlideIndex = slideImgLength - 1;    		
    		startSlideIndex = parseInt(slideImgLength / 2);
    	}
    	
    	var alimiPublic = $("#daily_info_alimy" + now_alimy_no + " .alimi_img.public").bxSlider({
    		auto: true,
    		speed: 500,
    		pause: 4000,
    		mode: 'horizontal', //fade, horizontal, vertical
    		autoControls: false,	//시작 중지 보튼 보임 여부
    		controls: false,
    		startSlide: startSlideIndex,	//최초 이미지 인덱스
    		pager: false	//페이지 바로가기 버튼 보임 여부
    	});    	
    }
}

//일반이미지 셋팅
function setNormalImg(arrangeCode, imgSrc, width, height) {
	
	var html = "";
	html += "<div id='daily_info_img_" + arrangeCode + "' class='jejusi_video' style='width:" + width + "px;height:" + height + "px;'>";
	html += "<img src='" + imgSrc + "' width='" + width + "' height='" + height + "'>";
	html += "</div>";
	
	//화면에 붙인다.
	$("div#wrap").append(html);
}





<c:if test="${isApp != 'Y'}"> /* 웹에서 실행되는 경우 */
//전화번호 보기
function show_tel(obj) {
	
	//선택된 전화번호가 닫혀있으면
	if($($(obj).next()).is(":hidden")) {
		
		//전체 전화번호 닫기
		hide_tel();
		
		//선택된 전화번호 열기
		$(obj).next().show();
	}
	//선택된 전화번호가 열려있으면
	else {
		
		//전체 전화번호 닫기
		hide_tel();
	}
}

//전화번호 닫기
function hide_tel() {
	
	//전체 전화번호 닫기
	$(".chart_tel").hide();
}

$(function() {
	$("body").on("click",function(e) {
		
		if(!$(e.target).hasClass("phone_c")) {
			
			hide_tel();
		}
	});
});
</c:if>

</script>
 
</head>
<body <c:if test="${facilityVO.arrangeBgImg != null && facilityVO.arrangeBgImg != ''}">style="background-image:url('${facilityVO.arrangeBgImg}');background-position:left top;background-repeat:no-repeat;"</c:if>> 

<div class="bgimg" id="bgimg" style="display:none;">
   
    <!--제주시 알리미-->
    <div class="jejusi_alimi_wrap" id="jejusi_alimi_div" <c:if test="${ facilityVO.promotionGubun eq 'I' }">style="display:none;"</c:if> >
        <div class="jejusi_alimi">
            <ul>
                <li id="jjs_img01"></li>   
                <li id="jjs_img02"></li>
            </ul>   
        </div>
    </div>
    <!--//제주시 알리미-->
     
    <div class="div_box2" id="promotion_div" <c:if test="${facilityVO.promotionGubun eq 'A'}">style="display:none;"</c:if>><img src="${imgSavePath}" id="jjs_imgTop" alt="조직도 화면 조정 시간입니다"></div>    
    
    <!--안내 메세지 출력-->
    <div class="text_field">
        <p class="text"><span class="timer" id="alimy_timer">15초</span> 후 시정홍보에서 직원안내도로 변경됩니다.</p>   
    </div>
    <!--//안내 메세지 출력-->
    
</div>

    

<div id="wrap"> 
	
	<c:if test="${buildingChartYn == 'Y'}"> <!-- 청사안내버튼 배치타입이 있는 경우 -->
	
	<!-- 청사안내 버튼 -->
	<div id="daily_info_building" class="jejusiMap_button" style="display:none;z-index:999;">
		<button type="button" class="jejusiMap" onclick="layer_popup('.jejusiMap_popup');">청사안내보기</button>
	</div>
	
	<!--청사안내 레이어팝업-->
	<div class="popup_area jejusiMap_popup">
		<div class="detail_popup">
			<div class="detail">
				<div class="popup_contents">
					<div class="jejusiMap_view">
						
						<c:if test="${buildingImgPath == null || buildingImgPath == ''}">
						등록된 이미지가 없습니다.
						</c:if>
						
						<c:if test="${buildingImgPath != null && buildingImgPath != ''}">
						<img src="${buildingImgPath}" alt="청사안내도">
						</c:if>
						
					</div>
				</div>
				<span class="close"><button type="button">청사안내 닫기</button></span>
			</div>
		</div>
	</div>
	<!--//청사안내 레이어팝업-->
	
	</c:if>
	
	
	
	<c:if test="${timeChartYn == 'Y'}"> <!-- 시계 배치타입이 있는 경우 -->
	
    <!-- 시계 -->
    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>  
    <fmt:formatDate var="today_str" value="${now}" pattern="yyyy. MM. dd" />
    
    <fmt:formatDate var="time_str" value="${now}" pattern="HH" />
    <fmt:formatNumber var="time_str" value="${time_str}"   />
    
    <fmt:formatDate var="time_str02" value="${now}" pattern="HH:mm" /> 
	<c:set var="nowAMPM" value="" />
	
	<c:if test="${timeGubun == 'A'}"> <!-- 12시간제이면 -->
		<fmt:formatDate var="time_str02" value="${now}" pattern="hh:mm" /> 
	    <c:set var="nowAMPM" value="오전" />
	    <c:if test="${time_str > 11}">
	    	<c:set var="nowAMPM" value="오후" />
	    </c:if>
    </c:if>
                
    <div id="daily_info_time" class="info_box daily_info_area" style="display:none;z-index:998;">
		<strong class="title"><img src="/images/display/icon/daily_info_icon1.png" alt="날짜 및 시간정보"></strong>
		<div class="info">
			<div class="date_info">
				<span>${today_str}</span> <span class="day"><fmt:formatDate value="${now}" pattern="E"/></span> 
			</div>
			<div class="time_info">
				<span class="ampm" id="ampm">${nowAMPM}</span> <span class="time" id="nowTime">${time_str02}</span>
			</div>
		</div>
	</div>
    <!--//시계-->
    
    </c:if>
	
	
	
	
	
	<c:if test="${weatherChartYn == 'Y'}"> <!-- 날씨 배치타입이 있는 경우 -->
	
	<!-- 날씨, 미세먼지 정보 -->
	<div id="daily_info_weather" class="info_box weather_info_area" style="display:none;z-index:997;">
		<div class="info_area weather">
			<strong class="title">제주시</strong>
			<div class="info_view">
				<div class="icon"> 
					<em id="weatherImgEm"></em>
				</div>
				<div class="text"> 
					<fmt:parseNumber var= "wp_temp" integerOnly= "true" value="${weatherSaveVO.temp}" />
					<strong><span id="weatherTempSpan">${wp_temp}</span><span>℃</span></strong> 
				</div>
			</div>
		</div>
		<div class="info_area air">
			<strong class="title">미세<br>먼지</strong>
			<div class="info_view">
				<div class="text"><strong id="pm10Strong">${weatherSaveVO.pm10Val} <span>㎍/㎥</span></strong></div>
				<div class="icon"><em id="pm10IconTxtEm"></em></div>
			</div>
		</div>
	</div>
	<!--//날씨, 미세먼지 정보-->
	
	</c:if>
	
	
	
	
	
	
	<c:if test="${utubeChartYn == 'Y'}"> <!-- 유튜브 배치타입이 있는 경우 -->
	
	<!-- 제주시 영상 -->
	<div id="daily_info_utube_wrap" style="display:none;position:absolute;background:#ccc;z-index:999;opacity:0.1;"></div>
	<div id="daily_info_utube" class="jejusi_video" style="display:none;z-index:996;"> <!--제주시 영상 크기 size880, size480, size320-->
		
		<!-- 
		<iframe src="<c:out value="${utubeMap.utubeUrl}"/>?controls=0&autoplay=1&mute=1&loop=1&playlist=${utubeMovieId}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		-->		
	</div>
	<!-- //제주시 영상 -->
	
	</c:if>
     
     
     
   	<c:if test="${alimyChartYn == 'Y'}"> <!-- 홍보이미지 배치타입이 있는 경우 -->
   	
   	<!-- 홍보이미지 -->
	<div id="daily_info_alimy1" class="alimi_area sliding_banner" style="display:none;z-index:995;">
	
		<!-- 
		<ul>
			<li><img src="http://www.jejusi.go.kr/storage/files/banner/1587453113252_69b3bc436b7c43168a1e9f58a5efec3a.png" alt=""></li>
			<li><img src="http://www.jejusi.go.kr/storage/files/banner/1589848466796_74517090839841d5a0b7d1389c43d081.png" alt=""></li>
		</ul>
		-->
		
	</div>
	
	<div id="daily_info_alimy2" class="alimi_area sliding_banner" style="display:none;z-index:995;">
	
		<!-- 
		<ul>
			<li><img src="http://www.jejusi.go.kr/storage/files/banner/1587453113252_69b3bc436b7c43168a1e9f58a5efec3a.png" alt=""></li>
			<li><img src="http://www.jejusi.go.kr/storage/files/banner/1589848466796_74517090839841d5a0b7d1389c43d081.png" alt=""></li>
		</ul>
		-->
		
	</div>
	<!-- 홍보이미지 -->
	
	</c:if>
	
	
    <div class="org_wrap">
        
    <c:forEach items="${chartsVOList}" var="item" varStatus="status">   
         
		<c:set var="seq" value="${item.employeeSeq}" /> 
		<c:set var="arrangeCode" value="${item.arrangeCode}" /> 
             
		<!-- jstl로 변환처리 -->
		<c:set var="deskJob" value="${fn:replace(item.deskJob,CRLF, BR)}" />
		<c:set var="deskJob" value="${fn:replace(deskJob,CR, BR)}" />
              
		<!-- 배치타입이 제목이면 -->
		<c:if test="${item.arrangeType eq 'A'}">
			<h1 class="org_main_title" style="left:${item.pointX}px; top:${item.pointY}px;">${item.arrangeName}</h1>
		</c:if>

		<!-- 배치타입이 부서장이면 -->
		<c:if test="${item.arrangeType eq 'B'}">
				
		<div class="org_section <c:if test="${item.sizeGubun == 'S'}">small</c:if> big_boss" style="left:${item.pointX}px;top:${item.pointY}px;">
		
			<c:if test="${item.arrangeName ne ''}">
			<h2 class="org_section_title ${item.bgColor}">
				<c:if test="${item.nameFlowFlag == 'Y'}">
				<div class="slide_title">
					<span class="slide" style="animation-duration: 10s;">${item.arrangeName}</span>
				</div>
				</c:if>
				<c:if test="${item.nameFlowFlag == 'N'}">
				${item.arrangeName}
				</c:if>
			</h2>
			</c:if> 
		
			<c:if test="${item.showFlag eq 'Y'}">
			<div class="org_info ${item.bgColor2}">
				
				<c:if test="${item.sizeGubun == 'S'}">
				<span class="photo"><img src="${item.memberImgPath}" onerror='this.src="/images/display/org_photo/noimg_93x128.png"' width="58" height="80"></span>
				</c:if>
				<c:if test="${item.sizeGubun != 'S'}">
				<span class="photo"><img src="${item.memberImgPath}" onerror='this.src="/images/display/org_photo/noimg_93x128.png"' width="106" height="150"></span>
				</c:if>
				
				<c:if test="${not empty fn:trim(item.name)}" >
					<div class="text">
						<div class="name">
						    <strong>${item.name}</strong>
						    <em>${item.positionNm}</em>
						</div>
						<div class="work">${deskJob}</div> 
					</div>
				</c:if>
				
				<c:if test="${empty fn:trim(item.name)}">
				<div class="text noInfo">
				    <p>정보를 준비중 입니다.</p>
				</div>
				</c:if>
				
				<c:if test="${isApp != 'Y'}"> /* 웹에서 실행되는 경우 */
				<c:if test="${not empty item.tel}">
				<!-- 전화번호 -->
				<div class="phone_area phone_c">
					<button type="button" class="phoneNumber phone_c" onclick="show_tel(this);">전화번호 보기</button>
					<div class="number chart_tel phone_c" style="display: none;">
						<strong class="phone_c">${item.tel}</strong> 
						<span class="close phone_c"><button type="button" class="phone_c" onclick="hide_tel()">닫기</button></span>
					</div>
				</div>
				<!-- //전화번호 -->
				</c:if>
				</c:if>
				
				<c:if test="${item.emptyGubun eq 'A'}">
				<div class="absent_tag">
				    <img src="/images/display/icon/absent_tag1.png" alt="휴가">
				</div>
				</c:if>
				<c:if test="${item.emptyGubun eq 'B'}">
				<div class="absent_tag">
				    <img src="/images/display/icon/absent_tag2.png" alt="출장">
				</div>
				</c:if>
				
			</div>
			</c:if>
    
		</div>
		</c:if>
		<!-- 부서장급// -->
              
		<!-- 배치타입이 팀 > 팀장이면 -->
		<c:if test="${item.arrangeType eq 'C' && item.col2 eq '0'}">
		
			<c:choose>			
				<c:when test="${item.sizeGubun == 'S'}"> <!-- 팀배치도 사이즈가 작은 사이즈이면 -->
				
					<c:set var="cell_width" value="155" />			
					<c:if test="${item.col > 1}"><c:set var="cell_width" value="${item.col * 155}" /></c:if>
					
				</c:when>
				<c:otherwise> <!-- 팀배치도 사이즈가 작은 사이즈가 아니면 -->
					
					<c:set var="cell_width" value="300" />			
					<c:if test="${item.col > 1}"><c:set var="cell_width" value="${item.col * 230}" /></c:if>
					
				</c:otherwise>
			</c:choose>
	  
			<div class="org_section <c:if test="${item.sizeGubun == 'S'}">small</c:if>" id="${arrangeCode}" style="left:${item.pointX}px;top:${item.pointY}px;width:${cell_width}px;"> 
				
				<div class="title_cell_group">
				
					<c:if test="${item.arrangeName ne ''}">
					<h2 class="org_section_title ${item.bgColor}">
						<c:if test="${item.nameFlowFlag == 'Y'}">
						<div class="slide_title">
							<span class="slide" style="animation-duration: 10s;">${item.arrangeName}</span>
						</div>
						</c:if>
						<c:if test="${item.nameFlowFlag == 'N'}">
						${item.arrangeName}
						</c:if>
					</h2>
					</c:if> 
		
					<c:if test="${item.teamLeaderPos eq 'T'}"> <!-- 팀장위치가 상단이면 -->	
									
						<!-- 팀장일 때 class="org_cell"에 team_leader 추가 -->
						<div class="org_cell team_leader">
						
			         		<c:if test="${item.showFlag eq 'Y'}">          		
							<div class="org_info ${item.bgColor2}">
								
								<span class="photo"><img src="${item.memberImgPath}" onerror='this.src="/images/display/org_photo/noimg_93x128.png"' width="90" height="128"></span>
								
								<c:if test="${not empty fn:trim(item.name)}" >
								<div class="text">
								    <div class="name">
								        <strong>${item.name}</strong>
										<em>${item.positionNm}</em>
								  	</div>
								  	<div class="work">${deskJob}</div>
								</div>
								</c:if>
								
								<c:if test="${empty fn:trim(item.name)}">
								<div class="text noInfo">
								    <p>정보를 준비중 입니다.</p>
								</div>
				          		</c:if>
								
								<c:if test="${isApp != 'Y'}"> /* 웹에서 실행되는 경우 */
								<c:if test="${not empty item.tel}">
								<!-- 전화번호 -->
								<div class="phone_area phone_c">
									<button type="button" class="phoneNumber phone_c" onclick="show_tel(this);">전화번호 보기</button>
									<div class="number chart_tel phone_c" style="display: none;">
										<strong class="phone_c">${item.tel}</strong>
										<span class="close phone_c"><button type="button" class="phone_c" onclick="hide_tel()">닫기</button></span>
									</div>
								</div>
								<!-- //전화번호 -->
								</c:if>
								</c:if>
								
								<c:if test="${item.emptyGubun eq 'A'}">
								<div class="absent_tag">
								    <img src="/images/display/icon/absent_tag1.png" alt="휴가">
								</div>
								</c:if>
								<c:if test="${item.emptyGubun eq 'B'}">
								<div class="absent_tag">
								    <img src="/images/display/icon/absent_tag2.png" alt="출장">
								</div>
								</c:if>
								
							</div>
				   			</c:if>
		   			
		   				</div>		
		   				<!--// 팀장일 때 class="org_cell"에 team_leader 추가 -->
		   						
					</c:if>
					
					
					<div class="org_cell_group">
						<div id="${arrangeCode}_cell">
						
						</div>
					</div>		
		
					<c:if test="${item.teamLeaderPos eq 'B'}"> <!-- 팀장위치가 하단이면 -->		
							
						<!-- 팀장일 때 class="org_cell"에 team_leader 추가 -->
						<div class="org_cell team_leader">
						
			         		<c:if test="${item.showFlag eq 'Y'}">          		
							<div class="org_info ${item.bgColor2}">
								
								<span class="photo"><img src="${item.memberImgPath}" onerror='this.src="/images/display/org_photo/noimg_93x128.png"' width="90" height="128"></span>
								
								<c:if test="${not empty fn:trim(item.name)}" >
								<div class="text">
								    <div class="name">
								        <strong>${item.name}</strong>
										<em>${item.positionNm}</em>
								  	</div>
								  	<div class="work">${deskJob}</div>
								</div>
								</c:if>
								
								<c:if test="${empty fn:trim(item.name)}">
								<div class="text noInfo">
								    <p>정보를 준비중 입니다.</p>
								</div>
				          		</c:if>
								
								<c:if test="${isApp != 'Y'}"> /* 웹에서 실행되는 경우 */
								<c:if test="${not empty item.tel}">
								<!-- 전화번호 -->
								<div class="phone_area phone_c">
									<button type="button" class="phoneNumber phone_c" onclick="show_tel(this);">전화번호 보기</button>
									<div class="number chart_tel phone_c" style="display:none;">
										<strong class="phone_c">${item.tel}</strong>
										<span class="close phone_c"><button type="button" class="phone_c" onclick="hide_tel()">닫기</button></span>
									</div>
								</div>
								<!-- //전화번호 -->
								</c:if>
								</c:if>
								
								<c:if test="${item.emptyGubun eq 'A'}">
								<div class="absent_tag">
								    <img src="/images/display/icon/absent_tag1.png" alt="휴가">
								</div>
								</c:if>
								<c:if test="${item.emptyGubun eq 'B'}">
								<div class="absent_tag">
								    <img src="/images/display/icon/absent_tag2.png" alt="출장">
								</div>
								</c:if>
				               
							</div>
				   			</c:if>
		   			
		   				</div>		
		   				<!--// 팀장일 때 class="org_cell"에 team_leader 추가 -->			
					</c:if>
	   				
				</div>
				
			</div>
		
		</c:if>
		<!-- 팀장 //-->
                            
	</c:forEach> 
 
    </div>
    
    <c:if test="${facilityVO.subtitleShowFlag == 'Y' && fn:length(subtitleList) > 0}">
	<!--슬라이드 텍스트-->
	<div class="sliding_notice">
		<marquee behavior="scroll">
			<ul class="notice_text">
				<c:forEach var="subtitle" items="${subtitleList}">
					<li>${subtitle.subtitle}</li>
      			</c:forEach>
			</ul>
		</marquee>
	</div>
	<!--//슬라이드 텍스트-->
	</c:if>
	
</div>

<script> 

//홍보이미지는 최대 2개이다.
var now_alimy_no = 1;

//팀원을 화면에 표시한다.
$(document).ready(function() {  
	
	//날짜/시간 부분 숨김처리
    $("#daily_info_time").hide();
	
	//조직도정보 갯수만큼 반복
	<c:forEach items="${chartsVOList}" var="item" varStatus="status">
    
		<c:set var="seq" value="${item.employeeSeq}" /> 
 		<c:set var="arrangeCode" value="${item.arrangeCode}" />  
             
      	<!-- jstl로 변환처리 -->
      	<c:set var="deskJob" value="${fn:replace(item.deskJob,CRLF, BR)}" />
      	<c:set var="deskJob" value="${fn:replace(deskJob,CR, BR)}" />
        
      	<!-- 배치타입이 시계이면 -->
  		<c:if test="${item.arrangeType eq 'D'}">
			$("#daily_info_time").show();
			$("#daily_info_time").css("left","${item.pointX}px");
			$("#daily_info_time").css("top","${item.pointY}px");
		</c:if>
		
		<!-- 배치타입이 날씨이면 -->
  		<c:if test="${item.arrangeType eq 'H'}">
  		
  			//날씨 셋팅
			setWeather();
  			
			$("#daily_info_weather").show();
			$("#daily_info_weather").css("left","${item.pointX}px");
			$("#daily_info_weather").css("top","${item.pointY}px");
		</c:if>
		
		<!-- 배치타입이 유튜브이면 -->
  		<c:if test="${item.arrangeType eq 'E'}">
  			
  			//유튜브셋팅
  			setUtube("${item.sizeGubun}");

			$("#daily_info_utube").show();
			$("#daily_info_utube").css("left","${item.pointX}px");
			$("#daily_info_utube").css("top","${item.pointY}px");
			
			$("#daily_info_utube_wrap").show();
			$("#daily_info_utube_wrap").css("left","${item.pointX}px");
			$("#daily_info_utube_wrap").css("top","${item.pointY}px");
  		</c:if>
  		
  		<!-- 배치타입이 홍보이미지이면 -->
  		<c:if test="${item.arrangeType eq 'F'}">
      		
  			//홍보이미지 셋팅
			setJejusiAlimy("${item.sizeGubun}", now_alimy_no);
  	
	  		$("#daily_info_alimy" + now_alimy_no).show();
			$("#daily_info_alimy" + now_alimy_no).css("left","${item.pointX}px");
			$("#daily_info_alimy" + now_alimy_no).css("top","${item.pointY}px");		
			
			now_alimy_no++;
  		</c:if>
  		
  		<!-- 배치타입이 청사안내버튼이면 -->
  		<c:if test="${item.arrangeType eq 'I'}">
      		$("#daily_info_building").show();
			$("#daily_info_building").css("left","${item.pointX}px");
			$("#daily_info_building").css("top","${item.pointY}px");			
  		</c:if>
  		
  		
  		<!-- 배치타입이 일반이미지이면 -->
  		<c:if test="${item.arrangeType eq 'G'}">
  		
  			//일반이미지 셋팅
  			setNormalImg('${item.arrangeCode}', '${item.imgSavePath}', '${item.imgWidth}', '${item.imgHeight}');
  		
      		$("#daily_info_img_${item.arrangeCode}").show();
			$("#daily_info_img_${item.arrangeCode}").css("left","${item.pointX}px");
			$("#daily_info_img_${item.arrangeCode}").css("top","${item.pointY}px");			
  		</c:if>
  		
		<!-- 배치타입이 팀 > 팀원이면 -->
		<c:if test="${item.arrangeType eq 'C' && item.col2 ne '0'}"> 
	
			strHtml = "";
            strHtml += "<div class=\"org_cell\">";
                 
            <c:if test="${item.showFlag eq 'Y'}"> 
            
	        	strHtml += "<div class=\"org_info ${item.bgColor2} \">";
	            strHtml += "    <span class=\"photo\"><img src=\"${item.memberImgPath}\" onerror='this.src=\"/images/display/org_photo/noimg_75x102.png\"' width='72' height='102' ></span>";

                <c:if test="${not empty fn:trim(item.name)}">
			        strHtml += "    <div class=\"text\">";
			        strHtml += "        <div class=\"name\">";
			        strHtml += "             <strong>${item.name}</strong>";
			        strHtml += "        </div>";
			        strHtml += "        <div class=\"work\">${deskJob}</div>";
			        strHtml += "	</div>";
                </c:if>
                
                <c:if test="${empty fn:trim(item.name)}" >
		            strHtml += "    <div class=\"text noInfo\">";
		            strHtml += "        <p>정보를 준비중 입니다.</p> ";
		            strHtml += "    </div>";
                </c:if>
                
                <c:if test="${isApp != 'Y'}"> /* 웹에서 실행되는 경우 */
				<c:if test="${not empty item.tel}">
                //전화번호////////////////////////////////
				strHtml += "    <div class=\"phone_area phone_c\">";
				strHtml += "    	<button type=\"button\" class=\"phoneNumber phone_c\" onclick='show_tel(this);'>전화번호 보기</button>";
				strHtml += "    	<div class=\"number chart_tel phone_c\" style=\"display: none;\">";
				strHtml += "    		<strong class=\"phone_c\">${item.tel}</strong>";
				strHtml += "    		<span class=\"close phone_c\"><button type=\"button\" class=\"phone_c\" onclick=\"hide_tel()\">닫기</button></span>";
				strHtml += "    	</div>";
				strHtml += "    </div>";
				//전화번호//////////////////////////////////
				</c:if>
				</c:if>
                
                <c:if test="${item.emptyGubun eq 'A'}"> 
               	 	strHtml += "    <div class=\"absent_tag\"><img src=\"/images/display/icon/absent_tag1.png\" alt=\"휴가\"></div>";
                </c:if>
                <c:if test="${item.emptyGubun eq 'B'}"> 
           	 		strHtml += "    <div class=\"absent_tag\"><img src=\"/images/display/icon/absent_tag2.png\" alt=\"출장\"></div>";
                </c:if>
                     
	            strHtml += "</div>";
	            
       		</c:if>
                 
     		strHtml += "</div>";
             
    		$("#${arrangeCode}_cell").append(strHtml);
    		
		</c:if>
              
     </c:forEach> 
});


<c:if test="${utubeChartYn == 'Y'}"> <!-- 유튜브 배치타입이 있는 경우 -->

// 1. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";

var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 2. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;

function onYouTubeIframeAPIReady() {
	
  	player = new YT.Player('daily_info_utube', {
    	height: '100%',
    	width: '100%',
    	playerVars: {
	 		playlist: '${utubeMovieId}',
	      	autoplay: 1,
	   		loop: 1,
			controls: 0,
	   		showinfo: 0,
	  		autohide: 1,
	   		modestbranding: 1,  
	   		wmode: 'opaque',
	   		mute:1,
	   		vq: 'hd1080'
	   	},
	   	videoId: '${utubeMovieId}',
	   	events: {
	   		'onReady': onPlayerReady,
	   		'onStateChange': onPlayerStateChange
   		}
	});
}

// 3. The API will call this function when the video player is ready.
function onPlayerReady(event) {
	
 	event.target.playVideo();
 	player.mute();
}

var done = false;

function onPlayerStateChange(e) { 

	var id = '${utubeMovieId}';

	if(e.data === YT.PlayerState.ENDED) {
		
		player.loadVideoById(id);
	}
}

function stopVideo() {
	
 	player.stopVideo();
}
</c:if>

$(function() {
	
	<c:if test="${isApp == 'Y'}"> /* 앱에서 실행되는 경우 */
	//2020.07.29 ksb1110@gmail.com
	//직원안내도 앱에서 호출되면 모니터링 로그를 남겨야 한다. (관리자에서 모니터링 하기 위해)
    $.ajax({
        type: 'POST',
        url: "/api/monitoringInsert.ez?facilityCode=${facilityVO.facilityCode}", 
        success: function(data) {  
        	
        	//console.log("success");
        },
        error: function() {
        	
            //console.log("error~");
        }
    });
	</c:if>
	
});
</script>

</body>
</html>