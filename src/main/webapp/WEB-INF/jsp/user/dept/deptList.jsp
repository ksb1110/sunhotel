<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>부서바로찾기  - 제주시 스마트청사 안내</title> 
 

</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    
      

      
<script language="javascript">


function fn_layerPop(dept){
	 
    
    if(dept != "" ){

            var dept_img = "<img src=\"../../../images/kiosk/sub/search/dept_noimg.jpg\" alt=\"이미지 준비중입니다\">";
    	 
	    	if( dept == "health01" || dept == "health02" || dept == "health03"  || dept == "parking_popup" ){
	    	    
	    		switch(dept){
	    	        case "health01": 
	    	            var dept_nm = "제주보건소";
	    	            var dept_position = "<dt>제주보건소：</dt><dd>제주특별자치도 제주시 연삼로 264<br>(우) 63219 (지번) 도남동 567-1</dd>";
	    	            var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg\" alt=\"제주보건소\" >";
	    	        break;
	                case "health02": 
	                    var dept_nm = "동부보건소";
	                    var dept_position = "<dt>동부보건소：</dt><dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>(우) 63357 (지번) 구좌읍 김녕리 1696</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg\" alt=\"동부보건소\">";
	                break;
	                case "health03": 
	                    var dept_nm = "서부보건소";
	                    var dept_position = "<dt>서부보건소：</dt><dd>제주특별자치도 제주시 한림읍 강구로5<br>(우) 63028 (지번) 한림읍 한림리 966-1</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg\" alt=\"서부보건소\">";
	                break;
                    case "parking_popup": 
                        var dept_nm = "주차지도팀";
                        var dept_position = "<dd>제주특별자치도 제주시 서광로2길 24<br>(제주 종합경기장내 자동차등록사업소 옆)</dd>";
                        var dept_img = "<img src=\"../../../images/kiosk/sub/search/traffic_img.jpg\" alt=\"주차지도팀\">";
                    break;
	    	        default:
	    	    } 	 
                
	          
	            $("#pop_name03").html(dept_nm);         
	            $("#pop_position03").html(dept_position);
	            $("#popup_photo03").html(dept_img);
	    		
	    		layer_popup('.Health');

                //--TTS 적용 - 문구설정
                var tts_str = $("#popup_header03").text();
	    		
	    	}else{
	            //-- layer setting
	            $("#pop_name").html($("#"+dept+"_facilityName").val());
	         
	            $("#pop_position").html( $("#"+dept+"_buildingName").val() +" "+  $("#"+dept+"_floorName").val() );
	            
	            //-- QR code
	            fn_ajaxMakeQr('${kioskCode}', $("#"+dept+"_mobileUrl").val()); 
	            
	            //-- pathFinder Bind
	            var facility_code =  $("#"+dept+"_facilityCode").val(); 
	            var facility_gubun =  $("#"+dept+"_facilityGubun").val(); 
	            
	            fn_goPathFinder('${kioskFcCode}', facility_code, facility_gubun);
	            
	            layer_popup('.location_popup'); 

	            //--TTS 적용 - 문구설정
	            var tts_str = $("#popup_header").text();   		
	    	}
	    	

	        //--TTS 적용
	        //var tts_str = $("#popup_header").text();
	        tts_str = $.trim(tts_str);
	        console.log(" TTS_STR : " + tts_str);
	        fn_ajaxTTS("${kioskCode}_"+dept,tts_str);
	            
    	
    }else{
        
    	//alert("부서코드 입력이 필요합니다.");
    	alert("준비중인 부서정보 입니다.");
    	
    } 
    
}
 

$(document).ready(function(){
       
    
});
</script>





    <%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
    
    </div>
    <!--//Side 영역-->
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            
            <%/* home btn, search area - content_top_wrap */%>
            <%@ include file="/WEB-INF/jsp/common/pageSearch.jsp" %>
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->    
                     
                     
                     
                         <div style="display:none;" >
                         <c:forEach items="${SL}" var="item" varStatus="status">   
                             <c:set var="seq" value="${item.facilityCode}" />              
                                 <input type="text" id="${seq}_deptName" value="${item.departName}">
                                 <input type="text" id="${seq}_deptCode" value="${item.departCode}">  
                                 <input type="text" id="${seq}_facilityCode" value="${item.facilityCode}">
                                 <input type="text" id="${seq}_facilityGubun" value="${item.facilityGubun}">
                                 <input type="text" id="${seq}_mobileUrl" value="${item.mobileUrl}__ga=${kioskFcCode}__fcg=${item.facilityGubun}">                                                            
                                 <input type="text" id="${seq}_buildingName" value="${item.buildingName}">
                                 <input type="text" id="${seq}_facilityName" value="${fn:replace(item.facilityName, '_', '')}">
                                 <input type="text" id="${seq}_floorName" value="${item.floorName}">  
                         </c:forEach>
                         </div>
                           
                                                
                                                
                                                
                        <div class="department_search">
                            <div class="header_detail">
                                <h2><img src="../../../images/kiosk/icon/title_icon1.png" alt=""> 생활밀접분야</h2>   
                            </div>
                            <div class="detail_contents">
                                <!--생활밀접분야 버튼-->
                                <div class="department_button">
                                    <ul>
                                        <li><span><button type="button" onclick="fn_layerPop('B03_F02_G01_002');">차고지증명제<em>[ 차량관리과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B03_F01_G01_003');">건축허가<em>[ 건축과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B09_F01_G01_001');">상하수도<em>[ 상하수도과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B05_F02_G01_002');">쓰레기배출<em>[ 생활환경과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_007');">재산세, 자동차세<em>[ 재산세과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B03_F01_G01_004');">식품위생<em>[ 위생관리과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_010');">기초생활지원<em>[ 기초생활보장과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_003');">다문화·보육·청소년<em>[ 여성가족과 ]</em></button></span></li> 
                                        
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_011');">노인 / 장애인<em>[ 노인장애인과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_011');">장애인 전용주차구역 위반<em>[ 노인장애인과 ]</em></button></span></li>
                                        
                                        <li><span><button type="button" onclick="fn_layerPop('B06_F01_G01_001');">주민등록/가족관계<em>[ 종합민원실 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B06_F01_G01_001');">지적·공시지가<em>[ 종합민원실 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B01_F01_G01_005');">주택가격<em>[ 세무과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B04_F05_G01_001');">정보화교육<em>[ 정보화지원과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B05_F03_G01_002');">환경개선부담금<em>[ 환경관리과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('B03_F03_G01_001');">개발행위·도시계획<em>[ 도시계획과 ]</em></button></span></li> 
                                        <li><span><button type="button" onclick="fn_layerPop('B03_F02_G01_003');">건설기계·도로점용<em>[ 건설과 ]</em></button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPop('parking_popup');">불법주정차 민원<br>(일반자동차)<em>[ 주차지도팀 ]</em></button></span></li>
                                        
                                    </ul>
                                </div>                  
                                <!--//생활밀접분야 버튼-->
                                
                                <!--분야별 메뉴-->
                                <div class="field_menu">
                                    <ul class="menu">
                                        <li class="active"><a href="javascript:void(0)"><span>자치행정</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F02_G01_001');">공보실</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B06_F01_G01_001');">종합민원실</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F02_G01_008');">총무과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F02_G01_015');">기획예산과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F02_G01_014');">자치행정과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_002');">마을활력과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_005');">세무과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_007');">재산세과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>안전교통</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F03_G01_003');">안전총괄과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F02_G01_001');">교통행정과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F02_G01_002');">차량관리과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B04_F05_G01_001');">정보화지원과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>복지위생</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_009');">주민복지과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_011');">노인장애인과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_010');">기초생활보장과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B01_F01_G01_003');">여성가족과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F01_G01_004');">위생관리과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>문화관광 체육</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B06_F02_G01_001');">문화예술과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B06_F03_G01_001');">관광진흥과</button></li>
                                                    <li><button type="button" onclick="layer_popup('.sports_popup');">체육진흥과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>청정환경</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B05_F03_G01_002');">환경관리과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B05_F03_G01_003');">환경지도과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B05_F02_G01_002');">생활환경과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B05_F01_G01_001');">공원녹지과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>농수축산 경제</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B02_F03_G01_004');">농정과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B02_F04_G01_001');">해양수산과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B02_F03_G01_001');">축산과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B02_F03_G01_002');">경제일자리과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>도시건설</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F03_G01_001');">도시계획과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F02_G01_004');">도시재생과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F02_G01_003');">건설과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F01_G01_001');">주택과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B03_F01_G01_003');">건축과</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('B09_F01_G01_001');">상하수도과</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li><a href="javascript:void(0)"><span>보건소</span></a>
                                            <div class="depth">
                                                <ul>
                                                    <li><button type="button" onclick="fn_layerPop('health01');">제주보건소</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('health02');">동부보건소</button></li>
                                                    <li><button type="button" onclick="fn_layerPop('health03');">서부보건소</button></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!--//분야별 메뉴-->                             
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                <!--위치안내 레이어팝업-->
                                <div class="popup_area location_popup">
                                
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header"  id="popup_header" >
                                                <strong  id="pop_name" >_____과</strong> 위치는<br>
                                                <strong id="pop_position">_관 _층</strong> 입니다. 
                                            </div>
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="location_search"  id="pathFinderAct" >길찾기</button></li>
                                                    <li>
                                                        <div class="qrcode_wrap">
                                                            <div class="qrcode_box">
                                                                <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png" alt="" id="qrcode_id"  ></div>
                                                                <p class="text">QR코드를 스캔하세요.</p>
                                                            </div>
                                                            <em>스마트폰<br>길안내 서비스</em>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!--//위치안내 레이어팝업-->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업-->
                                <div class="popup_area location_popup2 Health">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header"  id="popup_header03" >
                                                <strong   id="pop_name03" >__보건소</strong> 의 위치입니다.<br>
                                                <dl class="dl_text" id="pop_position03" >
                                                    <dt>제주보건소：</dt>
                                                    <dd>제주특별자치도 제주시 연삼로 264<br>
                                                    (우) 63219 (지번) 도남동 567-1</dd>
                                                    <!-- 동부보건소, 서부보건소 주소
                                                    <dt>동부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>
                                                    (우) 63357 (지번) 구좌읍 김녕리 1696</dd>
                                                    <dt>서부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 한람읍 강구로5<br>
                                                    (우) 63028 (지번) 한림읍 한림리 966-1</dd>-->
                                                </dl>
                                            </div>
                                            <div class="popup_contents">
                                                <div class="popup_photo" id="popup_photo03" >
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg" alt="제주보건소" >
                                                    <!--동부보건소, 서부보건소 이미지
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg" alt="동부보건소">
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg" alt="서부보건소">-->
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내 레이어팝업-->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업 - 체육진흥과 -->
                                <div class="popup_area location_popup2 sports_popup">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                <strong>체육진흥과</strong> 의 위치입니다.<br>
                                                <dl class="dl_text">
                                                    <dd>제주특별자치도 제주시 광양9길 10<br>
                                                    (우) 63208 (지번) 이도이동 1176-1</dd>
                                                </dl>
                                            </div>
                                            <div class="popup_contents ">
                                                <div class="popup_photo">
                                                    <img src="../../../images/kiosk/sub/search/sports_img.jpg" alt="체육진흥과">
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내(외부 부서일 때) 레이어팝업 - 체육진흥과 -->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업 - 주차지도팀 -->
                                <div class="popup_area location_popup2 parking_popup">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                <strong>주차지도팀</strong> 의 위치입니다.<br>
                                                <dl class="dl_text">
                                                    <dd>제주특별자치도 제주시 광양9길 10<br>
                                                    (우) 63208 (지번) 이도이동 1176-1</dd>
                                                </dl>
                                            </div>
                                            <div class="popup_contents ">
                                                <div class="popup_photo">
                                                    <img src="../../../images/kiosk/sub/search/dept_noimg.jpg" alt="이미지 준비중입니다.">
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내(외부 부서일 때) 레이어팝업 - 주차지도팀 -->
                                
                                
                            </div>  
                        </div>  
 
 
                                                
                    <!--//실제 컨텐츠--> 
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!--//Contents 영역--> 
    
    
</div>
</body>
</html> 
