<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>GNB - 제주시 스마트청사 안내</title> 
 
  

</head>
<body>

<!--Side 영역-->
    <div id="side_wrap">
    
     

<script language="javascript">
 

$(document).ready(function(){
    
    //-- realtime Watch
    //setDatetime(); //-- 최초실행  
    startDate();    //-- 1분마다 재실행
      
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
    
    console.log(" menu_act : "+ menu_act +" , menu_url : "+ menu_url );
    
});

  

function fn_browserAgentchk(){
    var broswerInfo = navigator.userAgent;
    var kiosk_id = "web";
    
    if(broswerInfo.indexOf("k01") > -1 ){ kiosk_id = "k01"; }
    if(broswerInfo.indexOf("k02") > -1 ){ kiosk_id = "k02"; }
    if(broswerInfo.indexOf("k03") > -1 ){ kiosk_id = "k03"; }
    if(broswerInfo.indexOf("k04") > -1 ){ kiosk_id = "k04"; }
    if(broswerInfo.indexOf("k05") > -1 ){ kiosk_id = "k05"; }
    if(broswerInfo.indexOf("k06") > -1 ){ kiosk_id = "k06"; }
    if(broswerInfo.indexOf("k07") > -1 ){ kiosk_id = "k07"; }
    
    if( kiosk_id != "web" ){
        alert(kiosk_id + ", 키오스크 확인 완료");
    }else{
        alert("키오스크가 아닙니다.");
    }   
}

function fn_sendUseStat(ac,ur){
   
    console.log(ac);
    console.log(ur);
    
    $.ajax({
        type: 'POST',
        url: "/api/ajaxUseStat.ez?kioskCode=${kioskCode}&kioskAction="+ac+"&kioskUrl="+ur,
        success: function(data) { 
                        
            console.log("ajaxUseStat.ez  ");
        },
        error: function() {
        	
            console.log("error~");
        }
    });
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
        <header id="header_wrap">
            <div class="header_detail">
                <div class="gnb_menu_area">
                    <ul>
                        <li><a href="/sati.ez" target="f1" ><img src="/images/kiosk/menu/gnb_menu_satisfice_icon.png" alt=""><em>만족도조사</em></a></li>
                        <li><a href="/guide.ez" target="f1" ><img src="/images/kiosk/menu/gnb_menu_guide_icon.png" alt=""><em>이용가이드</em></a></li>
                        <!-- 
                        <li><a href="javascript:fn_browserAgentchk();"><em>키오스트 웹뷰확인</em></a></li>
                        <li><a href="/htmls/kiosk/page_list.htm"><em>page_list</em></a></li>
                         --> 
                    </ul>
                </div>         
           
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
                <fmt:formatDate var="time_str" value="${now}" pattern="hh" />
                <fmt:formatDate var="time_str02" value="${now}" pattern="HH : MM" />
                
                <c:set var="nowAMPM" value="오전" />
                <c:if test="${time_str > 11}"><c:set var="nowAMPM" value="오후" /></c:if>
                
                <div class="daily_info_area">
                
                    <div class="date_info" id="nowDatetime">
                        <span>${today_str }</span> <span class="day"><fmt:formatDate value="${now}" pattern="E"/></span> <span>${nowAMPM} ${time_str02 }</span>
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
                        <li><a href="/main.ez" onclick="fn_sendUseStat('GNB > 청사안내 이동','/main.ez');" target="f1"><span class="eng">Office Info</span><em>청사안내</em></a></li>
                        <li><a href="/deptList.ez" onclick="fn_sendUseStat('GNB > 부서바로찾기 이동','/deptList.ez');" target="f1"><span class="eng">Search</span><em>부서바로찾기</em></a></li> 
                        <li><a href="/conv.ez?bc=${kioskFcCode}&kioskCode=${kioskCode}" onclick="fn_sendUseStat('GNB > 편의시설 이동','/conv.ez?bc=${kioskFcCode}');"  target="f1"><span class="eng">Facilities</span><em>편의시설</em></a></li>
                        <li><a href="/news.ez" onclick="fn_sendUseStat('GNB > 제주시소식 이동','/news.ez');"  target="f1"><span class="eng">News</span><em>제주시소식</em></a></li>
                        <li><a href="/busInfo.ez" onclick="fn_sendUseStat('GNB > 시청주변 버스노선 이동','/busInfo.ez');" target="f1"><span class="eng">Bus Line</span><em>시청주변 버스노선</em></a></li>
                    </ul>
                </nav>
                <!--//주메뉴-->
          
            </div>
        </header>
        <!--//Header 영역--> 
    
    
    </div>
    <!--//Side 영역-->
    
</div>
</body>
</html> 

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>  