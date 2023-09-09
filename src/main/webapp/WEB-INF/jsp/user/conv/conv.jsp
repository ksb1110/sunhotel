<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>편의시설  - 제주시 스마트청사 안내</title>  
 
</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/office.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    
    
<script language="javascript">


//-- 부서정보 팝업
function fn_layerPop(kioskCode, seq){

    var facility_code =  $("#"+seq+"_facilityCode").val()
    var facility_gubun =  $("#"+seq+"_facilityGubun").val(); 
    var kioskFcCode =  $("#"+seq+"_kioskFcCode").val(); 
    var facilityName =  $("#"+seq+"_facilityName").val(); 
    
    var buildingName =  $("#"+seq+"_buildingName").val(); 
    var floorName =  $("#"+seq+"_floorName").val();  
    
    //-- QR code
    fn_ajaxMakeQr(kioskCode, $("#"+seq+"_mobileUrl").val());

    //-- pathFinder Bind 
    fn_goPathFinder(kioskFcCode, facility_code,facility_gubun);
    
    //-- layer setting
    if(facility_gubun == "G08") {  //은행
        
    	$("#popup_header").html("<strong>"+facilityName+"</strong> 위치는<br><strong>"+buildingName+" "+floorName+"</strong> 입니다.");
    }
    else {
    	
        $("#popup_header").html("현 위치에서 가장 가까운 <strong>" + facilityName + "</strong> 위치는<br><strong>" + buildingName + " " + floorName + "</strong> 입니다.");
    }  
    
    $("#popup_all_view").html( $("#"+seq+"_codeName").val());
    
    $(".bathroom_popup").hide();
    $(".bathroom_popup2").hide();
    $(".bank_popup").hide();
    layer_popup('.location_popup');
    
    $("#now_kiosk").val(kioskCode);
    $("#now_seq").val(seq);
    $("#now_gubun").val(facility_gubun);
    
    console.log("----------- "+facility_gubun);
    

    //--TTS 적용 - 문구설정
    var tts_str = $("#popup_header").text();    

    //--TTS 적용
    //var tts_str = $("#popup_header").text();
    tts_str = $.trim(tts_str);
    console.log(" TTS_STR : " + tts_str);
    fn_ajaxTTS("${kioskCode}_"+facility_code,tts_str);
        
     
}

//-- 편의시설 목록full view
function fn_layerPopFull(kioskCode, seq, facilityName ){

    var facility_code =  $("#"+seq+"_facilityCode").val()
    var facility_gubun =  $("#"+seq+"_facilityGubun").val(); 
    var kioskFcCode =  $("#"+seq+"_kioskFcCode").val(); 
    //var facilityName =  $("#"+seq+"_facilityName").val(); 
    
    var buildingName =  $("#"+seq+"_buildingName").val(); 
    var floorName =  $("#"+seq+"_floorName").val();  
    
    
    $("#now_kiosk").val(kioskCode);
    $("#now_seq").val(seq);
    $("#now_gubun").val(facility_gubun);
    
    var kioskCode = $("#now_kiosk").val();
    var seq         = $("#now_seq").val();
    var fcGubun   = $("#now_gubun").val();
    
    
    //-- QR code
    fn_ajaxMakeQr(kioskCode, $("#"+seq+"_mobileUrl").val());

    //-- pathFinder Bind 
    fn_goPathFinder(kioskFcCode, facility_code,facility_gubun);
    
    //-- layer setting
    $("#popup_header02").html("현 위치에서 <br>가장 가까운 <strong>"+facilityName+"</strong> 위치는<br><strong>"+buildingName+" "+floorName+"</strong> 입니다.");  
    $("#popup_header03").html("<strong>"+facilityName+"</strong>");   
    
    //-- 회의실 G09, 수유실 G10, 엘리베이터 G12   
    if( facility_gubun == "G09" || facility_gubun == "G10" ||facility_gubun == "G12" ){
        $("#popup_header_full01").hide();
        $("#popup_header_full02").show();	

        //--TTS 적용 - 문구설정
        var tts_str = $("#popup_header03").text();    

    }else{
        $("#popup_header_full01").show();
        $("#popup_header_full02").hide();

        //--TTS 적용 - 문구설정
        var tts_str = $("#popup_header02").text();    

    }
    
    $("#fc_list").html("");
    //-- 동일 시설 리스트업
    console.log("fcGubun = "+ fcGubun +"-------------- facility_gubun : "+ facility_gubun);    
    $(".item_facilityCode").each(function(index, item){
    	var item_val = $(item).val();
        var kioskFcCode =  $("#"+item_val+"_kioskFcCode").val(); 
        var facility_code =  $("#"+item_val+"_facilityCode").val()
        var facility_gubun =  $("#"+item_val+"_facilityGubun").val(); 
        var facilityName =  $("#"+item_val+"_facilityName").val(); 
        var buildingName =  $("#"+item_val+"_buildingName").val(); 
        var floorName =  $("#"+item_val+"_floorName").val();  
    	
    	if( fcGubun == facility_gubun ){

            console.log("--------"+ item_val +" , "+ facility_gubun); 
            var list_append = "<tr><td class=\"align_center\">"+ buildingName +"</td>";
            list_append += "<td class=\"align_center\">"+floorName +"</td>";
            list_append += "<td class=\"align_center\">"+facilityName +"</td>";
            list_append += "<td class=\"align_center\"><button type=\"button\" class=\"location_btn\" onclick=\"fn_goDirectPath('"+kioskFcCode +"', '"+facility_code +"', '"+facility_gubun +"');\">";
            list_append += "<span class=\"icon\"><img src=\"/images/kiosk/icon/location_icon1.png\" ></span><span class=\"text\">위치안내</span></button></td></tr>";
            $("#fc_list").append(list_append);
    	}
    });
 
    /*$("#fc_list").
        <tr>
            <td class="align_center">본관</td>
            <td class="align_center">1층</td>
            <td class="align_center">화장실 (남) - 중앙</td>
            <td class="align_center">
                <!--버튼 클릭시 위치안내 레이어팝업 열림-->
                <button type="button" class="location_btn" onclick="layer_popup('.location_popup');"><span class="icon"><img src="../../../images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span></button>
            </td>
        </tr>
    */

    $(".bathroom_popup").hide();
    $(".bathroom_popup2").hide();
    $(".bank_popup").hide();
    $(".location_popup").hide();
    
    layer_popup('.fullview_popup');
    
    

    //--TTS 적용
    //var tts_str = $("#popup_header").text();
    tts_str = $.trim(tts_str);
    console.log(" TTS_STR : " + tts_str);
    fn_ajaxTTS("${kioskCode}_"+facility_code,tts_str);
        
    
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
                    
                    
                        
                        <!--층 시설정보 리스트--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officeFloorList.jsp" %>  
                        <!--//층 시설정보 리스트-->
                        
                             
                             
                             
                        <div class="facilites_item">
                            <div class="header_detail">
                                <h2 class="title2"><em>편의시설을 선택</em>하시면 가까운 시설 위치를 확인할 수 있습니다.</h2> 
                            </div>
                            <div class="detail_contents">
                                <div class="facilites_button">
                                <c:choose>
                                    <c:when test="${kioskCode eq 'k01' }"><!-- 키오스크1 : 본관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k02' }"><!-- 키오스크2 : 1별관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k03' }"><!-- 키오스크3 : 2별관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k04' }"><!-- 키오스크4 : 4별관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k05' }"><!-- 키오스크5 : 5별관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k06' }"><!-- 키오스크6 : 본관중앙 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                    <c:when test="${kioskCode eq 'k07' }"><!-- 키오스크7 : 6별관 -->
                                        <c:set var="conv11" value="B01_F01_G05_001"/><!-- 화장실남 -->
                                        <c:set var="conv12" value="B01_F01_G04_002"/><!-- 화장실여 -->
                                        <c:set var="conv21" value="B01_F01_G07_001"/><!-- 장애인 화장실남 -->
                                        <c:set var="conv22" value="B02_F01_G06_001"/><!-- 장애인 화장실여 -->
                                        <c:set var="conv30" value="B01_F02_G09_001"/><!-- 회의실 -->
                                        <c:set var="conv40" value="B02_F01_G12_001"/><!-- 엘리베이터 -->
                                        <c:set var="conv50" value="B01_F01_G13_001"/><!-- 장애인 경사로 -->
                                        <c:set var="conv60" value="B06_F01_G10_001"/><!-- 수유실 -->
                                    </c:when>
                                </c:choose>
                                
                                
                                
                                 <c:forEach items="${NF}" var="item" varStatus="status">
                                     <c:if test="${ item.nearbyOrder eq '1' }">
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G04' }">
                                             <c:set var="conv12" value="${item.nearbyFacilityCode}"/><!-- 화장실여 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G05' }">
                                             <c:set var="conv11" value="${item.nearbyFacilityCode}"/><!-- 화장실남 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G07' }">
                                             <c:set var="conv21" value="${item.nearbyFacilityCode}"/><!-- 장애인 화장실남 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G06' }">
                                             <c:set var="conv22" value="${item.nearbyFacilityCode}"/><!-- 장애인 화장실여 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G09' }">
                                             <c:set var="conv30" value="${item.nearbyFacilityCode}"/><!-- 회의실 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G12' }">
                                             <c:set var="conv40" value="${item.nearbyFacilityCode}"/><!-- 엘리베이터 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G13' }">
                                             <c:set var="conv50" value="${item.nearbyFacilityCode}"/><!-- 장애인 경사로 -->
                                         </c:if>
                                         <c:if test="${ item.nearbyFacilityGubun eq 'G10' }">
                                             <c:set var="conv60" value="${item.nearbyFacilityCode}"/><!-- 수유실 -->
                                         </c:if>
                                     </c:if>                             
                                 </c:forEach>
                                
                                
                                
                                    <ul>
                                        <li><span><button type="button" onclick="layer_popup('.bathroom_popup');">화장실</button></span></li>
                                        <li><span><button type="button" onclick="layer_popup('.bathroom_popup2');"">장애인 화장실</button></span></li>
                                        
                                        <li><span><button type="button" onclick="layer_popup('.bank_popup');">은행</button></span></li>
                                        
                                        <li><span><button type="button" onclick="fn_layerPopFull('${kioskCode}','${conv30}','회의실');">회의실</button></span></li>
                                        <li><span><button type="button" onclick="fn_layerPopFull('${kioskCode}','${conv60}','수유실');">수유실</button></span></li>
                                        
                                        <li><span><button type="button" onclick="layer_popup('.parking_popup');fn_ajaxTTS('${kioskCode}_parking_popup','주차장');">주차장</button></span></li>
                                        
                                        <li><span><button type="button" onclick="fn_layerPopFull('${kioskCode}','${conv40}','엘리베이터');">엘리베이터</button></span></li>
                                        <%-- <li><span><button type="button" onclick="fn_layerPopFull('${kioskCode}','${conv50}','장애인 경사로');">장애인 경사로</button></span></li> --%>
                                        <li><span><button type="button" onclick="layer_popup('.slope_popup');fn_ajaxTTS('${kioskCode}_slope_popup','장애인 경사로');">장애인 경사로</button></span></li>
                                         
                                        <li><span><button type="button" onclick="layer_popup('.smoking_popup'); fn_ajaxTTS('${kioskCode}_smoking_popup','흡연실');">흡연실</button></span></li>
                                    </ul>
                                </div>    
                                
                                <!--
                                <button type="button" onclick="fn_ajaxTTS('voice_6_20201118','주방 체험은 주거공간이 가장 오래 머물고 피로감을 많이 느끼는 공간으로써 높낮이 조절 주방가구 사용 등을 통해 유니버설디자인 디자인 편리성을 체험할 수 있습니다.');">샘플6</button>              
                                -->
                                
                                
                                <!--화장실안내 레이어팝업-->
                                <div class="popup_area bathroom_popup">
                                    <div class="detail_popup">
                                        <div class="detail max_width540">
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="man_bathroom" onclick="fn_layerPopFull('${kioskCode}','${conv11}','남자 화장실');">남자 화장실</button></li>
                                                    <li><button type="button" class="woman_bathroom" onclick="fn_layerPopFull('${kioskCode}','${conv12}','여자 화장실');">여자 화장실</button></li>
                                                </ul>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//화장실안내 레이어팝업-->
                                
                                <!--화장실안내 레이어팝업-->
                                <div class="popup_area bathroom_popup2">
                                    <div class="detail_popup">
                                        <div class="detail max_width540">
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="man_bathroom"     onclick="fn_layerPopFull('${kioskCode}','${conv21}','남자장애인화장실');">남자장애인화장실</button></li>
                                                    <li><button type="button" class="woman_bathroom" onclick="fn_layerPopFull('${kioskCode}','${conv22}','여자장애인화장실');">여자장애인화장실</button></li>
                                                </ul>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//화장실안내 레이어팝업-->
                                
                                
                                
                                <!--위치안내 레이어팝업-->
                                <div class="popup_area location_popup">
                                    <div class="detail_popup">
                                        <div class="detail max_width780">
                                            <div class="popup_header"  id="popup_header" >현 위치에서 가장 가까운 <strong>___</strong> 위치는<br><strong>_관 _층</strong> 입니다.</div>
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="location_search"  id="pathFinderAct" >길찾기</button></li>
                                                    <!--
                                                    <li><button type="button" class="all_view" onclick="fn_layerPopFull();" ><span class="font_color05"  id="popup_all_view">화장실</span><br>전체보기</button></li> 
                                                     -->
                                                    <li>
                                                        <div class="qrcode_wrap">
                                                            <div class="qrcode_box">
                                                                <div class="qrcode"><img src="../../../images/kiosk/icon/noImg.png" alt="" id="qrcode_id"  ></div>
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
                                
                                
                                <!--전체보기 레이어팝업-->
                                <div class="popup_area fullview_popup">
                                    <input type="hidden" id="now_kiosk" value="${kioskFcCode}" >
                                    <input type="hidden" id="now_seq" value="" >
                                    <input type="hidden" id="now_gubun" value="" >
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                
                                                <div id="popup_header_full01" >
	                                                <div class="info" id="popup_header02" >현 위치에서 <br>가장 가까운 <strong>___</strong> 위치는<br><strong>_관 _층</strong> 입니다.</div> 
	                                                <ul class="popup_button">
	                                                    <li><button type="button" class="location_search"   id="pathFinderAct02" >길찾기</button></li>
	                                                    <li>
	                                                        <div class="qrcode_wrap">
	                                                            <div class="qrcode_box">
	                                                                <div class="qrcode"><img src="../../../images/kiosk/icon/noImg.png" alt=""  id="qrcode_id02"  ></div>
	                                                            </div>
	                                                            <em>스마트폰<br>길안내 서비스</em>
	                                                        </div>
	                                                    </li>
	                                                </ul>
	                                            </div>
                                                <div id="popup_header_full02" style="display:none;" >
                                                    <div class="info" id="popup_header03"  style="text-align: center;"><strong>___</strong></div>                                                      
                                                </div> 
	                                            
                                            </div>
                                            <div class="popup_contents">
                                                <!--테이블(세로 스크롤)-->
                                                <div class="table_wrap">
                                                    <div id="divHeadScroll">
                                                        <table id="tblHead" class="table_col">
                                                            <caption class="hidden">
                                                                <strong></strong>
                                                                <p>건물, 위치, 편의시설, 위치안내로 구분되어 해당 정보를 나타냅니다.</p>
                                                            </caption>
                                                            <colgroup>
                                                                <col style="width: 200px">
                                                                <col style="width: 80px">
                                                                <col style="width: 275px">
                                                                <col style="width: 175px">
                                                                <col style="width: 50px"> <!--스크롤두께고정-->
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">건물</th>
                                                                    <th scope="col">위치</th>
                                                                    <th scope="col">편의시설</th>
                                                                    <th scope="col">위치안내</th>
                                                                    <th scope="col" class="bg_color1 pad0"></th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                    <div id="divBodyScroll">
                                                        <table id="tblBody" class="table_col">
                                                            <colgroup>
                                                                <col style="width: 190px">
                                                                <col style="width: 80px">
                                                                <col style="width: 275px">
                                                                <col style="width: 166px">
                                                            </colgroup>
                                                            <tbody id="fc_list" >
                                                                <tr>
                                                                    <td class="align_center">_관</td>
                                                                    <td class="align_center">_층</td>
                                                                    <td class="align_center">_______</td>
                                                                    <td class="align_center">
                                                                        <!--버튼 클릭시 위치안내 레이어팝업 열림-->
                                                                        <button type="button" class="location_btn" onclick="layer_popup('.location_popup');"><span class="icon"><img src="../../../images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span></button>
                                                                    </td>
                                                                </tr> 
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!--//테이블(세로 스크롤)-->
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//전체보기 레이어팝업-->
                            
                            
                            
                                
                                <!--은행안내 레이어팝업-->
                                <div class="popup_area bank_popup">
                                    <div class="detail_popup">
                                        <div class="detail max_width540">
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="jeju_bank" onclick="fn_layerPop('${kioskCode}','B01_F01_G08_001');"  >제주은행</button></li>
                                                    <li><button type="button" class="nonghyup_bank" onclick="fn_layerPop('${kioskCode}','B01_F01_G08_002')">농협</button></li>
                                                </ul>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//은행안내 레이어팝업-->
                                
                                
                                <!--주차장안내 레이어팝업-->
                                <div class="popup_area infoimg_view parking_popup">
                                    <div class="detail_popup">
                                        <div class="detail max_width1400">
                                            <div class="popup_header">
                                                <strong>주차장</strong>
                                            </div>
                                            <div class="popup_contents">
                                                <img src="../../../images/kiosk/sub/facilites/parking_img.jpg" alt="주차장 안내도">
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//주차장안내 레이어팝업-->
                                
                                
                            	<!--장애인 경사로안내 레이어팝업-->
								<div class="popup_area infoimg_view slope_popup">
									<div class="detail_popup">
										<div class="detail max_width1400">
											<div class="popup_header">
												<strong>장애인 경사로</strong>
											</div>
											<div class="popup_contents">
												<img src="../../../images/kiosk/sub/facilites/slope_img.jpg" alt="장애인 경사로 안내도">
											</div>
											<span class="close"><button type="button">닫기</button></span>
										</div>
									</div>
								</div>
								<!--//장애인 경사로안내 레이어팝업-->
								
								
								<!--흡연실 안내 레이어팝업-->
								<div class="popup_area infoimg_view smoking_popup">
									<div class="detail_popup">
										<div class="detail max_width1400">
											<div class="popup_header">
												<strong>흡연실</strong>
											</div>
											<div class="popup_contents">
												<img src="../../../images/kiosk/sub/facilites/smoking_img.jpg" alt="흡연실 안내도">
											</div>
											<span class="close"><button type="button">닫기</button></span>
										</div>
									</div>
								</div>
								<!--//흡연실 안내 레이어팝업-->
                            
                            
                            </div>  
                        </div>  
                        <!--//실제 컨텐츠--> 
 
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

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>  