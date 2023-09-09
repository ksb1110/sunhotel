<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>길찾기 - 제주시 스마트청사 안내</title> 
 
</head>
<body>


<c:set var="bCode" value="${officeInfoSVO.bCode}" />
<c:set var="nowCompass" value="${officeInfoSVO.nowCompass}" />
<!--  //${bCode}//${nowCompass}//  -->


<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/office.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
   

<c:forEach items="${PF}" var="item" varStatus="status">   
    <c:set var="pathSort" value="${item.pathSort}" />
    
    <c:if test="${item.pathSort eq  '1' }" > 
    <c:set var="gaName" value="${item.buildingName}" /> 
    <c:set var="gaFName" value="${fn:replace(item.facilityName, '_', '')}" /> 
    <c:set var="gaFloorImgPath" value="${item.floorImgPath}" />
    <c:set var="gaPointX" value="${item.pointX}" />
    <c:set var="gaPointY" value="${item.pointY}" />
 
    </c:if> 
    <c:if test="${item.pathSort eq  '2' }" >  
    <c:set var="emName" value="${item.buildingName}" />
    <c:set var="emFName" value="${fn:replace(item.facilityName, '_', '')}" />
    <c:set var="emElevatorCnt" value="${item.elevatorCnt}" />  
    <c:set var="emPointX" value="${item.pointX}" />
    <c:set var="emPointY" value="${item.pointY}" />
    </c:if> 
</c:forEach>
 
 
<c:set var="gaPathLine" value="${pathSVO.gaPathLine}" />
<c:set var="gaBuildingImg" value="${pathSVO.gaBuildingImg}" />
<c:set var="emPathLine" value="${pathSVO.emPathLine}" />            

<c:set var="gaFloor" value="${fn:substring(pathSVO.gaCode,6,7) }" />  
<c:set var="emFloor" value="${officeParam.fCode}" />  
<c:set var="pathType" value="${pathSVO.pathType}" />
<c:set var="fullPathMap" value="${pathSVO.fullPathMap}" />

<!-- pt2 -->
<c:if test="${pathType eq 'pt3' }">
	<c:set var="kioskCodeX" value="${gaPointX }"/>
	<c:set var="kioskCodeY" value="${gaPointY }"/>
</c:if>
 
<!--   
${fn:substring(pathSVO.gaCode,6,7) } // ${emElevatorCnt }
    ( ${pathSVO.gaCode}// ${pathSVO.emCode} // ${pathSVO.facilityGubun} //  ${pathType} // ${fullPathMap })
   // ${gaFloor }//

<!-- 
  * pt5 : 건물,건물,1층,도착층,도착지
  * pt4 : 건물,건물,1층(도착층),도착지
  * pt3 : 건물,1층,도착층,도착지
  * pt2 : 건물,1층(도착층),도착지
  -->
  
 <div id="processBoxHtml" style="display:none;" >      
     <span>${gaName}</span><img src="/images/kiosk/sub/process-arrow.png" alt="" >
     <span>${emName}</span><img src="/images/kiosk/sub/process-arrow.png" alt="" >
     <span>${gaFloor}층</span><img src="/images/kiosk/sub/process-arrow.png" alt="" >
     <span>${emFloor}층</span><img src="/images/kiosk/sub/process-arrow.png" alt="" >
     <span>${emFName} </span>     
 </div>
                                                
            
<script language="javascript">
 
$(document).ready(function(){
    
	//--프로세스 span 내용
	var processBoxHtml = $("#processBoxHtml").html();
	$(".process_box").html(processBoxHtml);

    $("#processPath1 img:eq(0)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath1 span:eq(0)").addClass("active");
    $("#processPath1 span:eq(1)").addClass("ready");
    
    $("#processPath2 img:eq(1)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath2 span:eq(1)").addClass("active");
    $("#processPath2 span:eq(2)").addClass("ready");
    
    $("#processPath3 img:eq(2)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath3 span:eq(2)").addClass("active");
    $("#processPath3 span:eq(3)").addClass("ready");
    
    $("#processPath4 img:eq(3)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath4 span:eq(3)").addClass("active");
    $("#processPath4 span:eq(4)").addClass("ready");
    
    //--층간이동 ani
    $("#processPath5 img:eq(2)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath5 span:eq(2)").addClass("active");
    $("#processPath5 span:eq(3)").addClass("ready");
    
	$("#processPath6 img:eq(3)").attr("src","/images/kiosk/sub/ani_process-arrow.png");
    $("#processPath6 span:eq(4)").addClass("active");
	
    <c:choose> 
	    <c:when test="${pathType == 'pt4' }" >
        for(var i =0;i<=6;i++){
            $("#processPath"+i+" span:eq(2)").hide();  
            $("#processPath"+i+" img:eq(2)").hide();    
        }   
	    </c:when>
	    <c:when test="${pathType == 'pt3' }" >   
        for(var i =0;i<=6;i++){
            $("#processPath"+i+" span:eq(0)").hide();//$("#processPath"+i+" span:eq(2)").hide();   
            $("#processPath"+i+" img:eq(0)").hide();//$("#processPath"+i+" img:eq(2)").hide();    
        }   
	    </c:when>
	    <c:when test="${pathType == 'pt2' }" >
            for(var i =0;i<=6;i++){
                $("#processPath"+i+" span:eq(0)").hide();$("#processPath"+i+" span:eq(2)").hide();  
                $("#processPath"+i+" img:eq(0)").hide();$("#processPath"+i+" img:eq(2)").hide();	
            }   
	    </c:when>
	</c:choose>



    //길찾기
    $(".sub_button").hide(); //'현위치~계단 버튼' 숨기기    
    $(".moving_popup").hide(); // '레이어팝업' 모두 숨기기
    $(".path_process").hide(); //'이동 진행 프로세스' 모두 숨기기
    $(".office_map2 .current_location").hide(); //'목적지 도착 아이콘' 숨기기  
    $(".building_name").hide(); //전체조감도 건물이름 보이기
        
    $(".path_process.path1").show(); //'이동 진행 프로세스1' 보이기

    
    //-- 전체조감도에서 출발/도착지 건물 아이콘 노출
    $("#bn_${kioskCodeB}").addClass("active");
    $("#bn_${officeParam.bCode}").addClass("active");

    //-- 현재키오스크 이미지 변경
    $("#fac_${kioskFcCode}").attr("src","/images/kiosk/icon/ani_kiosk-location.png");
   
    
    var setTimeStart = 0;

    <c:if test="${ pathType eq 'pt5' || pathType eq 'pt4'  }">
        <!-- <c:set var="gaFloorImgPath" value="/images/kiosk/sub/office/map_full_view_3d.png" /> -->
        /*
        <!-- 전체 이미지 -->
        <c:set var="gaFloorImgPath" value="/data/floor/B11_F00.png" />
        <!-- 본관 > 2별관, 2별관 > 본관 -->
        <c:set var="gaFloorImgPath" value="/data/floor/B11_F01.png" />
        <!-- 본관 > 1별관, 1별관 > 본관-->
        <c:set var="gaFloorImgPath" value="/data/floor/B11_F02.png" />
        <!-- 1별관 > 2별관, 2별관 > 1별관  -->
        <c:set var="gaFloorImgPath" value="/data/floor/B11_F03.png" />
        */
        <c:set var="gaFloorImgPath" value="/data/floor/${fullPathMap}.png" />
        
        	
        	
        $(".building_name").show(); //전체조감도 건물이름 숨기기
        
        nowPathlength("ga_PathLine");
        

        <c:if test="${ fullPathMap eq 'B11_F00' }">
	    //-- 건물간 이동
	    	//2019.08.23 김승범 (3초후에 이동하는 요청사항 적용)
    		setTimeStart = setTimeStart+6000+3000;
	        //setTimeStart = setTimeStart+6000;
	        setTimeout(function() {
	            $(".path_process.path1").hide(); //'청사 전체보기'의 '이동 진행 프로세스1', 5초 후 숨기기
	            $(".moving_popup.path1").show(); //'청사 전체보기'의 '건물 안으로 이동 안내 레이어팝업' 5초 후 보이기
	            $(".path_process.path2").show(); //'이동 진행 프로세스2' 보이기
	            $('body').after('<div class="opacityBg"></div>'); //팝업 보일 때 불투명 배경 보이기
	        }, setTimeStart);
	     </c:if>
	    
    </c:if>
     

    <c:if test="${pathType eq 'pt5' }" >
    //층이동
    setTimeStart = setTimeStart+3000+6000;
    setTimeout(function() {
        $(".moving_popup.path1").hide(); //'청사 전체보기'의 '건물 안으로 이동 안내 레이어팝업' 숨기기
        $(".office_map1 .moving_popup.path1").hide();
        $(".moving_popup.path2").show(); // '층 이동 안내 레이어팝업' 보이기
        $(".path_process.path3").hide(); //'이동 진행 프로세스3' 숨기기
        $(".path_process.path5").show(); //'이동 진행 프로세스5' 보이기
    }, setTimeStart);
    </c:if>
    
    <c:if test="${ pathType eq 'pt3' }" >
    //층이동
    setTimeStart = 0;
    setTimeout(function() {
        $(".moving_popup.path1").hide(); //'청사 전체보기'의 '건물 안으로 이동 안내 레이어팝업' 숨기기
        $(".office_map1 .moving_popup.path1").hide();
        $(".moving_popup.path2").show(); // '층 이동 안내 레이어팝업' 보이기
        $(".path_process.path3").hide(); //'이동 진행 프로세스3' 숨기기
        $(".path_process.path5").show(); //'이동 진행 프로세스5' 보이기
    }, setTimeStart);
    </c:if>

    <c:if test="${pathType eq 'pt2' }" >
    $(".office_map1").hide(); //'청사 전체보기' 숨기기
    $(".office_map2").show(); //'본관2층' 보이기
    $(".moving_popup.path2").hide(); // '층 이동 안내 레이어팝업' 숨기기
    $(".office_map2 .path_process.path4").show(); //'이동 진행 프로세스4' 보이기
    </c:if>
     
    
    //--  도착층 
    //2019.08.23 김승범 (3초후에 이동하는 요청사항 적용)
    setTimeStart = setTimeStart+6000+3000;
    //setTimeStart = setTimeStart+6000;
    
        $(".findway .building_name li, .findway .department_name li").show(); //부서 보이기
        
    setTimeout(function() { //'본관2층' 10초 후 보이기
      <c:if test="${facilityVO.routeImgFlag ne 'Y' }"> <%-- 경로 이미지 사용이 아니면... --%>
        nowPathlength("em_PathLine");
      </c:if>
    
        $(".office_map1").hide(); //'청사 전체보기' 숨기기
        $(".office_map2").show(); //'본관2층' 보이기
        $(".moving_popup.path2").hide(); // '층 이동 안내 레이어팝업' 숨기기
        $(".office_map2 .path_process.path4").show(); //'이동 진행 프로세스4' 보이기
        $('.opacityBg').remove(); //팝업 보일 때 불투명 배경 삭제
        $(".findway .building_name li, .findway .department_name li").show(); //부서 보이기
        

        
    }, setTimeStart);

    //--  도착층  
    <c:if test="${pathType eq 'pt2' }" >
    setTimeStart = setTimeStart+1000;
    </c:if>
    
    <c:if test="${pathType ne 'pt2' }" >
    //2019.08.23 김승범 (3초후에 이동하는 요청사항 적용)
    setTimeStart = setTimeStart+6000+3000;
    //setTimeStart = setTimeStart+6000;
    </c:if>
    setTimeout(function() { 
        $(".office_map2 .path_process.path4").hide(); //본관2층에서의 '이동 진행 프로세스4' 숨기기
        $(".office_map2 .path_process.path_end").show(); //본관2층에서의 '이동 진행 프로세스 목적지 도착' 보이기
        //$(".office_map2 .current_location").show(); //'목적지 도착 아이콘' 보이기
        $(".findway .building_name li, .findway .department_name li").show(); //부서 보이기
        
        $(".add_function_popup").show(); //'부가기능 레이어팝업' 보이기        
        //"길을 찾으셨나요? 다시 보시려면 다시보기를 눌러주세요."
        fn_ajaxTTS("${kioskCode}_path_reload","길을 찾으셨나요? 다시 보시려면 다시보기를 눌러주세요.");
        
        $("#${pathSVO.emCode}").removeClass("active");
        $("#${pathSVO.emCode}").addClass("destination");
        

    }, setTimeStart);
   
    
    


    //편의시설 노출
    if($.find(".point_G14").length > 0){
        $("#facility_G14").show();
    }
    if($.find(".point_G12").length > 0){
        $("#facility_G12").show();
    }
    
    if($.find(".point_G08").length > 0){ 
        $("#facility_G08").show();
    } 
    
    
    
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
            
            
            <!--방위표시-->
            <div class="compass_area">
                <img src="../../../images/kiosk/sub/${nowCompass}" alt=" 방위표시">
                <!-- <img src="../../../images/kiosk/sub/compass2_welfare.png" alt="복지동에 표시되는 방위표시">
                <img src="../../../images/kiosk/sub/compass3.png" alt="3별관, 4별관, 5별관, 5별관 부속동, 신규별관에 표시되는 방위표시"> -->
            </div>
            <!--//방위표시-->
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->         
                    
                     
                        
                        <!--층 시설정보 리스트--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officeFloorList.jsp" %>  
                        <!--//층 시설정보 리스트-->
                        
                             
                        <h2 class="title1"><span>${officeParam.bName}</span> <span class="inline">${officeParam.fCode}층</span>  <!-- ${officeParam.bCode} --></h2>
                         
                        
                        <div class="office_info_area findway">
                            <div class="sub_button">
                                <ul>
                                    <!--  <li><button type="button" class="location" onclick="fn_pointerSpot('G15');">현위치</button></li> -->
                                    <li  ><button type="button" class="location" onclick="fn_gomap('${kioskCodeB}','${kioskCodeF}');">현위치</button></li>
                                    <li onclick="fn_pointerSpot('G04');" ><button type="button" class="toilet">화장실</button></li>
                                    <li onclick="fn_pointerSpot('G02');" ><button type="button" class="stairs">계단</button></li>    
                                    <li id="facility_G12" onclick="fn_pointerSpot('G12');"  style="display: none;" ><button type="button" class="elevator">엘리베이터</button></li> 
                                    <li id="facility_G14" onclick="fn_pointerSpot('G14');"  style="display: none;" ><button type="button" class="cigarette">흡연실</button></li>
                                    <li id="facility_G08" onclick="fn_pointerSpot('G08');"  style="display:none;" ><button type="button" class="bank">은행</button></li> 
                                </ul>
                            </div>
                            
                            
                            
                            
                                
                            <!--청사 전체보기-->  
                            <div class="office_map1">
                                <!-- <div class="office_map"><img src="/images/kiosk/sub/office/map_top_view_3d.png" alt=""></div> -->
                                <div class="office_map"><img src="${gaFloorImgPath}" alt="${gaName} ${gaFloor}층 이미지"   ></div> 
                                <div class="map_svg_area">
                                    <svg class="map_svg" viewBox="0 0 1520 740">
                                      <path class="path_line" d="M ${gaPathLine}" id="ga_PathLine" ></path>
                                    </svg>
                                </div> 
                                
                                <!-- 
                                <span class="current_location" style="left:${kioskCodeX}px; top:${kioskCodeY}px;"   ><img src="/images/kiosk/icon/ani_location.png" alt="현재위치"></span>
                                 -->
                            
 
                                <%//좌표수정필요 %>
	                            <ul class="building_name">
	                                <!-- 
	                                <li id="bn_B01" style="left: 820px; top: 260px;"><button type="button">본관</button></li>
	                                <li id="bn_B02" style="left: 470px; top: 260px;"><button type="button">1별관</button></li>
	                                <li id="bn_B03" style="left: 325px; top: 345px;"><button type="button">2별관</button></li>  -->
	                                <!-- 
	                                <li id="bn_B08" style="left: 210px; top: 260px;"><button type="button">복지동</button></li>
	                                <li id="bn_B09" style="left: 210px; top: 370px;"><button type="button">상하수도과</button></li>
	                                <li id="bn_B04" style="left: 545px; top: 530px;"><button type="button">3별관</button></li>
	                                <li id="bn_B05" style="left: 720px; top: 510px;"><button type="button">4별관</button></li>
	                                <li id="bn_B06" style="left: 1045px; top: 595px;"><button type="button">5별관</button></li>
	                                <li id="bn_B07" style="left: 1145px; top: 645px;"><button type="button">5별관 부속동</button></li>  -->
	                            </ul>
                                
                                
                                <!--이동 진행 프로세스1-->
                                <div class="path_process path1">
                                    <div class="process_box" id="processPath1" >
                                        <span class="active">__관</span>
                                        <img src="../../../images/kiosk/sub/ani_process-arrow.png" alt="">
                                        <span class="ready">_관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>1층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>2층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>기획예산과</span>
                                    </div>
                                </div>
                                <!--//이동 진행 프로세스1-->
                                
                                
                                <!-- 건물 안으로 이동 안내 레이어팝업-->
                                <div class="popup_area moving_popup path1">
                                    <!--이동 진행 프로세스2-->
                                    <div class="path_process path2">
                                        <div class="process_box" id="processPath2" >
                                            <span>__관</span>
                                            <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                            <span class="active">_관</span>
                                            <img src="../../../images/kiosk/sub/ani_process-arrow.png" alt="">
                                            <span class="ready">1층</span>
                                            <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                            <span>2층</span>
                                            <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                            <span>기획예산과</span>
                                        </div>
                                    </div>
                                    <!--//이동 진행 프로세스2-->
                                    

                                    <!--건물 이동 애니메이션-->
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_contents">
                                                <div class="walking_img"><img src="/images/kiosk/sub/ani_walking.png" alt=""></div>
                                                <div class="moving_img"><img src="${gaBuildingImg}" alt="제주시청 정문"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--//건물 이동 애니메이션-->
                                    
                                </div>
                                <!--//건물 안으로 이동 안내 레이어팝업-->
                                
                            </div>
                            <!--//청사 전체보기-->
                            
                            
                            
                            
                            
                            
                            
                            <!--층 이동 안내 레이어팝업-->
                            <div class="popup_area moving_popup path2">
                                <!--이동 진행 프로세스5--> 
                                <div class="path_process path5">
                                    <div class="process_box" id="processPath5" >
                                        <span>__관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>_관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span class="active">1층</span>
                                        <img src="../../../images/kiosk/sub/ani_process-arrow.png" alt="">
                                        <span class="ready">2층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>기획예산과</span>
                                    </div>
                                </div>
                                <!--//이동 진행 프로세스5--> 
                                <!--층 이동 애니메이션-->
                                <div class="detail_popup">
                                    <div class="detail">
                                        <div class="popup_contents">
                                            <div class="moving_img">
                                                <img src="/images/kiosk/sub/ani_stairs.png" alt="계단 이동">
                                                 
                                                <c:if test="${officeParam.bCode ne 'B05' && officeParam.bCode ne 'B06' && officeParam.bCode ne 'B07' && officeParam.bCode ne 'B08' && officeParam.bCode ne 'B09' }">
                                                    <img src="/images/kiosk/sub/ani_elevator.png" alt="엘리베이터 이동">
                                                    <c:if test="${officeParam.bCode eq 'B01' || officeParam.bCode eq 'B03' }">
                                                        <p class="text">계단 이용이 불편하신 분은 <br><em class="font_color05">1별관 엘리베이터를 이용</em>할 수 있습니다.</p>
                                                    </c:if>
                                                </c:if>
                                                
                                                <!-- 층간이동시 계단+엘리베이터 노출 정의
                                                                   본관 : 계단+엘리(문구)
                                                    1별관 : 계단+엘리
                                                    2별관 : 계단+엘리(문구)
                                                    3별관 : 계단+엘리
                                                    4별관 : 계단
                                                    5별관 : 계단
                                                    5별관 부속동 : 계단
			                                                  복지동 : 계단
			                                                  상하수도과 : 계단
			                                                  신축건물 : 계단+엘리
                                                -->
                                            </div>
                                            <div class="moving_text">
                                                <strong>${gaFloor}층</strong>
                                                <img src="/images/kiosk/sub/ani_moving-arrow.png" alt="">
                                                <strong>${emFloor}층</strong> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--//층 이동 애니메이션-->
                            </div>
                            <!--//층 이동 안내 레이어팝업-->
                            
                            
                            
                            
                            <!--도착 층 정보-->
                            <div class="office_map2" style="display: none">
                              <c:if test="${facilityVO.routeImgFlag ne 'Y' }"> <%-- 경로 이미지 사용이 아니면... --%>
	                            <div class="office_map"><img src="${officeParam.floorImgPath}" alt="${officeParam.bName} ${officeParam.fCode}층 이미지"   ></div>
	                            
                                <div class="map_svg_area">
                                    <svg class="map_svg" viewBox="0 0 1520 740">
                                      <path class="path_line" d="M  ${emPathLine}" id="em_PathLine"></path>
                                    </svg>
                                </div>
                                
                                <span class="current_location" style="left: ${emPointX}px; top: ${emPointY}px;"><img src="/images/kiosk/icon/ani_destination.png" alt="목적지 도착"></span>
                                 
	                            <!-- 도착층 부서목록 -->
	                            <ul class="department_name">
	                             <c:forEach items="${OF}" var="item" varStatus="status">
	                                 
	                                       <c:set var="class_active" value="" /> 
	                                 <c:if test="${item.facilityCode eq pathSVO.emCode }"><c:set var="class_active" value="active" /></c:if>
	                                  
	                                       <!-- 사무실, 회의실 --> 
	                                       <c:if test="${item.facilityGubun eq 'G01' || item.facilityGubun eq 'G09' }" >
	                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;" class="${class_active}" id="${item.facilityCode }" ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
	                                 </c:if>  
	                                       <!-- 은행 -->
	                                 <c:if test="${item.facilityGubun eq 'G08' }" >
	                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;" class="${class_active}"  id="${item.facilityCode }"  ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');"><img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '')}" onerror="this.style.display = 'none'">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
	                                 </c:if>         
	                             </c:forEach>                         
	                            </ul>
	                            <!--// 도착층 부서목록 -->
	                            <!-- 도착층 시설물목록 -->
	                            <ul class="facility_icon">
		                             <c:forEach items="${OF}" var="item" varStatus="status"> 
		                             
	                                        <c:set var="class_active" value="" /> 
	                                        <c:if test="${item.facilityCode eq pathSVO.emCode }"><c:set var="class_active" value="active" /></c:if>
	                                        
	                                           <c:if test="${item.facilityGubun ne 'G01' &&  item.facilityGubun ne 'G08' &&  item.facilityGubun ne 'G09'}" > 
		                                     <li style="left:${item.pointX}px; top: ${item.pointY}px;"  class="${class_active}"  id="${item.facilityCode }"  ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">
		                                     <img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '')}"  onerror="this.style.display = 'none'"  id="fac_${item.facilityCode}" >
		                                     <span class="pointer_none point_spot point_${item.facilityGubun} ">&nbsp;</span></button>
		                                     </li>
		                                 </c:if>     
		                             </c:forEach>   
	                              </ul>
	                              <!--// 도착층 시설물목록 -->
                              </c:if>
                              
                              <c:if test="${facilityVO.routeImgFlag eq 'Y' }"> <%-- 경로 이미지 사용이면... --%>
	                            <div class="office_map"><img src="${facilityVO.routeImgPath}" alt="${officeParam.bName} ${officeParam.fCode}층 이미지"   ></div>
	                          </c:if>
                                
                                <!--이동 진행 프로세스3-->
                                <div class="path_process path3">
                                    <div class="process_box" id="processPath3" >
                                        <span>__관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>_관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span class="active">1층</span>
                                        <img src="../../../images/kiosk/sub/ani_process-arrow.png" alt="">
                                        <span>2층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span class="ready">자치행정과</span>
                                    </div>
                                </div>
                                <!--//이동 진행 프로세스3-->
                                
                                <!--이동 진행 프로세스4-->
                                <div class="path_process path4">
                                    <div class="process_box" id="processPath4" >
                                        <span>__관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>_관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>1층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span class="active">2층</span>
                                        <img src="../../../images/kiosk/sub/ani_process-arrow.png" alt="">
                                        <span class="ready">기획예산과</span>
                                    </div>
                                </div>
                                <!--//이동 진행 프로세스4-->
                                
                                <!--이동 진행 프로세스 목적지 도착-->
                                <div class="path_process path_end">
                                    <div class="process_box" id="processPath6" >
                                        <span>__관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>_관</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>1층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span>2층</span>
                                        <img src="../../../images/kiosk/sub/process-arrow.png" alt="">
                                        <span class="active">기획예산과</span>
                                    </div>
                                </div>
                                <!--//이동 진행 프로세스 목적지 도착-->
                                 
                                
                                <!-- 부가기능 레이어팝업-->
                                <div class="add_function_popup">                
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_contents">
                                                <ul class="function_button">
                                                    <li><button type="button" class="replay" onclick="location.reload();">다시보기</button></li>
                                                    <!-- <li><button type="button" class="position" onclick="fn_gomap('${officeParam.bCode}','${officeParam.fCode}');" >현위치가기</button></li> -->
                                                    <li><button type="button" class="position" onclick="fn_gomap('${kioskCodeB}','${kioskCodeF}');" >현위치가기</button></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--//부가기능 레이어팝업-->
                                
                            </div>
                            <!--//도착 층 정보-->
                            
                        </div>
                     
                     
                     
                     
                        
                        <!--부서정보안내 레이어팝업--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officePopup.jsp" %>  
                        <!--//부서정보안내 레이어팝업-->
                        
                        
                        <!--부서정보안내 레이어팝업--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officeBottomMenu.jsp" %>  
                        <!--//부서정보안내 레이어팝업-->
                        
                        
                           
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