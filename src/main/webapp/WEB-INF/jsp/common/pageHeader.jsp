<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

 
<script language="javascript">
 
function setKeepOnApp() {	  

    console.log(": setKeepOnApp ");
    
    <c:if test="${webYN eq 'N' }">
    //window.Android.setKeepOnApp("Y");
    window.Android.setKeepOnApp("${SM.kioskAppAccessFlag}"); 
    </c:if> 
}

function setPlayOnApp() {     
    
	console.log(" - setPlayOnApp ");
    //alert(" - setPlayOnApp 6");

    <c:if test="${webYN eq 'N' }">
    window.Android.playIntro();
    </c:if> 
     
}

function clearCache(){
	
    //alert(" - clearCache 4 ");
	console.log(" - clearCache ");
	
    <c:if test="${webYN eq 'N' }">
    window.Android.clearCache();
    </c:if> 
}



$(document).ready(function(){
	
	//-- realtime Watch
    //setDatetime(); //-- 최초실행
    //setNowTime(); //-- 시간만 변경    
    
    ajaxGetDateTimeNow();
    
    
	startDate();    //-- 1분마다 재실행 
	
	//-- weather, PM10
    //weatherAjaxShow();
    	
	//-- right side menu OnOff
    var menu_url = $(location).attr('pathname')+""+$(location).attr('search');
    var menu_act = -1;
    if(menu_url.indexOf("main") > -1) { menu_act = 0; }  //-- 청사안내
    if(menu_url.indexOf("office") > -1) { menu_act = 0; }  //-- 청사안내
    if(menu_url.indexOf("dept") > -1) { menu_act = 1; }  //-- 부서바로찾기
    if(menu_url.indexOf("conv") > -1) { menu_act = 2; }  //-- 편의시설
    if(menu_url.indexOf("news") > -1) { menu_act = 3; }  //-- 제주시소식
    if(menu_url.indexOf("busInfo") > -1) { menu_act = 4; } //-- 버스노선안내
    if(menu_url.indexOf("infomain") > -1) { menu_act = -1; }     
        
    $("#lnb_mn_grp li").removeClass("active");
    if( menu_act > -1 ){
        $("#lnb_mn_grp li").eq(menu_act).addClass("active");
    }

    //-- right side menu OnOff 2
    var menu_act = -1;
    if(menu_url.indexOf("sati") > -1) { menu_act = 0; } //-- 만족도조사
    if(menu_url.indexOf("guide") > -1) { menu_act = 1; } //-- 이용가이드
    $("#lnb_top_mn_grp li").removeClass("active");
    if( menu_act > -1 ){
        $("#lnb_top_mn_grp li").eq(menu_act).addClass("active");
    }
	
    //console.log(" menu_act : "+ menu_act +" , menu_url : "+ menu_url ); 
    
    //-- 사용자 이용 테스트    
    $(document).bind('touchend', function(e) { 
    	//$("#msg").html("』");  //$("#msg").append("<div>터치이벤트가 종료되었어요</div>");
        //$("#touch_end_time").val(60000); //1분
        $("#touch_end_time").val(600000); //10분
        //-- 1000은 1초, 10000은 10초, 1분 : 60,000  // (10초 * 6 ) * 10 = 10분 600,000
    });
   
    //-- 메인페이지 외엔 사용없을시 타이머 작동. 
    var now_url = window.location.href.toLowerCase();
    if (now_url.indexOf("/main.ez") != -1) {
    	console.log(">>> 메인페이지 ");
        
        //-- 청사안내 들어오면 일단 안내인사
        /*
        setTimeout(function(){
            //fn_ajaxTTS("${kioskCode}_welcome","안녕하세요. 제주시청을 방문해주셔서 감사합니다.");
            fn_ajaxTTSmp3("welcome");
        }, 500);
        */
        
        
        //"안녕하세요. 제주시청을 방문해주셔서 감사합니다."
        /*
        $(document).bind('touchstart', function(e) { 
            if( $("#touch_start_time").val() > 0 ){
            	//fn_ajaxTTS("${kioskCode}_welcome","안녕하세요. 제주시청을 방문해주셔서 감사합니다.");
            	
            	//-- welcomTTS step1
            	fn_ajaxTTSmp3("welcome");              	
            	$("#touch_start_time").val(0);
            	
            	
                //console.log( $("#touch_start_time").val() );
                
            }            
        });
        */
        
        //-- 메인페이지로 오고 시간 지나면 터치인터벌시간을 늘려준다.
        var inteval_time_term = 60000 * 3; //60000은 1분
        setTimeout(function() {  $("#touch_start_time").val(inteval_time_term);}, inteval_time_term);
        
    }else{

        console.log("--->>> 메인페이지로 이동 ");
    	var inteval_time_term = 60000; //60000은 1분
        var timer = setInterval(function() { 
            
            var remain_time = $("#touch_end_time").val();
            remain_time = remain_time - inteval_time_term;
            $("#touch_end_time").val(remain_time);
            console.log(" remain_time >>>  "+ remain_time);
            
            if(remain_time < 0){
                //location.href="/infomain.ez";
                location.href="/main.ez";
            }
            /* //실행할 스크립트 
            clearInterval(timer); console.log("clearInteval~~~");     */
            
        }, inteval_time_term);
	
    }
       
 
 
    
});
 
/*
function weatherAjaxShow() {
	
  	//현재시간 구하기
	var today = new Date();
	var hour = today.getHours();
	hour = eval(hour);
	
    result01 = "${SM.wp_hour}";
    
    //날씨아이콘
    result02 = "${SM.wp_sky}";  //-- icon
    result02 = pad(result02, 2);
    
    //맑음이거나 구름많음이면
    if(result02 == "02" || result02 == "03") {
    	
    	//낮이면
		if(hour >= 6 && hour < 18) {
			
			result02 = result02 + "_day";
		}
		//밤이면
		else {

			result02 = result02 + "_night";
		}
    }
    
    result03 = "${SM.wp_wfKor}"; //날씨정보 한글
    result04 = "${SM.wp_temp}"; 
    result04 = parseInt(result04);
    
    result05 = "${SM.wp_pm10Val}";
    result06 = "${SM.wp_pm10Cai}"; //미세먼지 지수PM10 지수 ( CAI 지수 1.좋음 2.보통 3.나쁨 4.매우나쁨 )
    

    switch (result06) {
      case 1 : result06 = "좋음";break;
      case 2 : result06 = "보통";break;
      case 3 : result06 = "나쁨";break;
      case 4 : result06 = "매우나쁨";break;
      default: result06 = "좋음";break; 
    }
    
    var weatherInfo = "<p class='top_text' >이도2동 <em>"+ result01 +"</em><span>시</span> 기준</p>";
    weatherInfo += "<div class='icon'><em><img src='/images/kiosk/icon/weathers/weather_icon_"+ result02 +".png' alt='"+ result03 +"' ></em></div>";
    weatherInfo += "<div class='text'><strong>"+ result04 +"<span>℃</span></strong><em>"+ result03 +"</em> </div>";

    var airInfo = "<p class='top_text'>미세먼지</p>";
    if( $.trim(result06) == "점검중" ){
        airInfo += "<div class='text'><em>"+ result06 +"</em></div>";
    }else{
        airInfo += "<div class='text'><strong>"+ result05 +"</strong><em>"+ result06 +"</em></div>";
    } 
          
    $("#weatherInfo").html(weatherInfo);
    $("#airInfo").html(airInfo);
}
*/

function fn_browserAgentchk(){
	var broswerInfo = navigator.userAgent;
	      broswerInfo = broswerInfo.toLowerCase();
	var kiosk_id = "web";
	
	if(broswerInfo.indexOf("k01") > -1 ){ kiosk_id = "k01"; }
    if(broswerInfo.indexOf("k02") > -1 ){ kiosk_id = "k02"; }
    if(broswerInfo.indexOf("k03") > -1 ){ kiosk_id = "k03"; }
    if(broswerInfo.indexOf("k04") > -1 ){ kiosk_id = "k04"; }
    if(broswerInfo.indexOf("k05") > -1 ){ kiosk_id = "k05"; }
    if(broswerInfo.indexOf("k06") > -1 ){ kiosk_id = "k06"; }
    if(broswerInfo.indexOf("k07") > -1 ){ kiosk_id = "k07"; }
    
    //console.log(broswerInfo);
    
	if( kiosk_id != "web" ){
	    alert(kiosk_id + ", 키오스크 확인 완료");
	}else{
		alert("키오스크가 아닙니다.");
	}	
}

function fn_sendUseStat(ac,ur){
   
	//console.log(ac);
	//console.log(ur);
	
    $.ajax({
        type: 'POST',
        url: "/api/ajaxUseStat.ez?kioskCode=${kioskCode}&kioskAction="+ac+"&kioskUrl="+ur,
        success: function(data) { 
        	        	
            //console.log("ajaxUseStat.ez  ");
               
        },
        error: function(){
            //console.log("error~");
                
        }
    });
    
    /*
    //-- 날씨정보 호출
    $.ajax({
        type: 'POST',
        url: "/api/ajaxSetWeather.ez",
        success: function(data) { 
                        
            console.log("ajaxSetWeather.ez  ");
               
        },
        error: function(){
            //console.log("error~");
                
        }
    });
    */ 
} 

</script>

<!--   
Context : <%= request.getContextPath() %>
URL : <%= request.getRequestURL() %>
URI : <%= request.getRequestURI() %>
Path : <%= request.getServletPath() %>
-->
<% 
String url = request.getScheme() + "://" + request.getServerName() + (request.getServerPort()==80?"":":"+request.getServerPort()) + request.getAttribute("javax.servlet.forward.request_uri");
String url_domain = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
url = url.replace(url_domain,"");
//out.println(url);
%> 
        
        
        
        <!--Header 영역-->
        <header id="header_wrap" >
            <div class="header_detail">
                <div class="gnb_menu_area">
                    <ul id="lnb_top_mn_grp" >
                        <li><a href="/sati.ez" onclick="fn_sendUseStat('GNB > 만족도조사 이동','/sati.ez');setKeepOnApp();"><img src="/images/kiosk/menu/gnb_menu_satisfice_icon.png" alt=""><em>만족도조사</em></a>
                         
                        <input type="hidden" name="touch_end_time" id="touch_end_time" value="600000" >
                        <input type="hidden" name="touch_start_time" id="touch_start_time" value="0" >
                        <!-- 1000은 1초, 10000은 10초, 1분 : 60,000  // (10초 * 6 ) * 10 = 10분 600,000 -->
                        
                        </li>
                        <li><a href="/guide.ez" onclick="fn_sendUseStat('GNB > 이용가이드 이동','/guide.ez');"><img src="/images/kiosk/menu/gnb_menu_guide_icon.png" alt=""><em>이용가이드</em></a></li>
                        <!-- 
                        <li><a href="javascript:fn_browserAgentchk();"><em>키오스트 웹뷰확인</em></a></li>
                        <li><a href="/htmls/kiosk/page_list.htm"><em>page_list</em></a></li>
                         --> 
                    </ul>
                </div>         
               
               <!--  -->
               
               <c:choose>
               <c:when test="${SM.logoImgShowFlag eq 'Y'}" > 
                <h1><img src="${SM.logoImgPath}" alt="제주시"></h1> 
                </c:when>
                <c:otherwise>
                          <!-- 로고비노출 셋팅 -->
                </c:otherwise>
                </c:choose>
                
                
                
                <!--날짜 및 날씨정보-->
                <c:set var="now" value="<%=new java.util.Date()%>" /> 
                <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>  
                <fmt:formatDate var="today_str" value="${now}" pattern="yyyy. MM. dd" />
                <fmt:formatDate var="time_str" value="${now}" pattern="HH" />
                <fmt:formatNumber  var="time_str" value="${time_str}"   />
                <fmt:formatDate var="time_str02" value="${now}" pattern="hh : mm" />  
                
                <c:set var="nowDate" value="${SM.nowRealDateTime}" /> 
                <c:set var="today_str" value="${fn:substring(nowDate,0,10) }" />
                <c:set var="today_str" value="${fn:replace(today_str, '-','. ') }" />
                <c:set var="time_str" value="${fn:substring(nowDate,11,13) }" />
                <c:set var="time_str01" value="${fn:substring(nowDate,14,16) }" />
                <c:set var="time_str02" value="${fn:substring(nowDate,11,16) }" />
                <c:set var="time_str02" value="${fn:replace(time_str02, ':',' : ') }" />
                
                <c:set var="nowAMPM" value="오전" />
                <c:if test="${time_str > 11}"><c:set var="nowAMPM" value="오후" /></c:if>
                <c:if test="${time_str > 12}"><c:set var="time_str" value="${time_str - 12}" /></c:if>
                
                <fmt:formatNumber var="time_str" minIntegerDigits="2" value="${time_str}" type="number"/>
                 
                <div class="daily_info_area"  onclick="clearCache();" > 
                    <div class="date_info" id="nowDatetime">
                        <span>${today_str}</span>&nbsp;<span class="day">${SM.nowRealWeek}</span>&nbsp;<span id="nowTime">${nowAMPM} ${time_str} : ${time_str01 }</span>
                    </div>
                     
                     <fmt:formatNumber var="wp_sky" minIntegerDigits="2" value="${SM.wp_sky}" type="number"/>
                     <fmt:parseNumber var= "wp_temp" integerOnly= "true" value= "${SM.wp_temp}" />
                     <fmt:parseNumber var= "wp_pm10Cai" integerOnly= "true" value= "${SM.wp_pm10Cai}" /> 
                     <c:choose>
                         <c:when test = "${wp_pm10Cai eq 1}">                        
                             <c:set var="wp_om10CAI_NM" value="좋음"/>
                         </c:when>
                         <c:when test = "${wp_pm10Cai eq 2}">                        
                             <c:set var="wp_om10CAI_NM" value="보통"/>
                         </c:when>
                         <c:when test = "${wp_pm10Cai eq 3}">                        
                             <c:set var="wp_om10CAI_NM" value="나쁨"/>
                         </c:when>
                         <c:when test = "${wp_pm10Cai eq 4}">                        
                             <c:set var="wp_om10CAI_NM" value="매우나쁨"/>
                         </c:when>
                         <c:otherwise>                 
                             <c:set var="wp_om10CAI_NM" value="점검중"/>
                         </c:otherwise>
                      </c:choose>
                      
                    <c:choose>
                    <c:when test="${SM.weatherShowFlag eq 'Y'}" >
                        <div class="weather_info" >
                            <div class="weather_detail" id="weatherInfo" >
                                <p class="top_text" >이도2동</p>
                                
                                <div class="icon"> 
                                    <em>&nbsp;</em>
                                </div>
                                <div class="text"> 
                                    <strong><span>&nbsp;</span></strong> 
                                    <em>&nbsp;</em> 
                                </div>
                                
                            </div>  
                            <div class="air_detail" id="airInfo">
                                <p class="top_text">미세먼지</p>
                                
                                <div class="text"> 
                                    <strong>&nbsp;</strong>
                                    <em>&nbsp;</em> 
                                </div>
                                
                            </div>                        
                        </div>
                    </c:when>
                    <c:otherwise>
                              <!-- 날씨비노출 셋팅 -->
                    </c:otherwise>
                    </c:choose>
                    
                </div>
                <!--//날짜 및 날씨정보-->
                
                <!--주메뉴-->
                <nav class="lnb_menu">
                    <ul id="lnb_mn_grp" >
                        <li><a href="/main.ez" onclick="fn_sendUseStat('GNB > 청사안내 이동','/main.ez');" ><span class="eng">Office Info</span><em>청사안내</em></a></li>
                        <li><a href="/deptList.ez" onclick="fn_sendUseStat('GNB > 부서바로찾기 이동','/deptList.ez');" ><span class="eng">Search</span><em>부서바로찾기</em></a></li> 
                        <li><a href="/conv.ez?bc=${kioskFcCode}&kioskCode=${kioskCode}" onclick="fn_sendUseStat('GNB > 편의시설 이동','/conv.ez?bc=${kioskFcCode}');" ><span class="eng">Facilities</span><em>편의시설</em></a></li>
                        <li><a href="/news.ez" onclick="fn_sendUseStat('GNB > 제주시소식 이동','/news.ez');" ><span class="eng">News</span><em>제주시소식</em></a></li>
                        <li><a href="/busInfo.ez" onclick="fn_sendUseStat('GNB > 시청주변 버스노선 이동','/busInfo.ez');" ><span class="eng">Bus Line</span><em>시청주변 버스노선</em></a></li>
                    </ul>
                </nav>
                <!--//주메뉴-->

                
                <!--모바일 청사안내 QR코드-->
                <div class="qrcode_area">
                    <em class="qrcode"><img src="/images/kiosk/icon/frame_qrcode.png" alt=""></em>
                    <span class="text">모바일에서 확인하시려면<br>QR코드를 스캔하세요</span>
                </div>
                <!--//모바일 청사안내 QR코드-->
          
            </div>
        </header>
        <!--//Header 영역--> 
    