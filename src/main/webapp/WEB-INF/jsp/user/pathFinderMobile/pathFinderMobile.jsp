<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/common/headerMobile.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="author" content="(주)넥스트이지">
<meta name="description" content="제주시 스마트 청사안내">


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
<c:set var="pathDepthParam" value="${pathSVO.pathDepthParam}" />
<c:set var="fullPathMap" value="${pathSVO.fullPathMap}" />
 
<!-- pt2 -->
<c:if test="${pathType eq 'pt3' }">
    <c:set var="kioskCodeX" value="${gaPointX }"/>
    <c:set var="kioskCodeY" value="${gaPointY }"/>
</c:if>
 <!--  
${fn:substring(pathSVO.gaCode,6,7) } // ${emElevatorCnt }
    ( ${pathSVO.gaCode}// ${pathSVO.emCode} // ${pathSVO.facilityGubun} //  ${pathType} )
-->    
 
 
<c:set var="view_id" value="A" />
 <c:choose>
     <c:when test="${ pathType eq 'pt5' || pathType eq 'pt4'  }">
         <c:if test="${pathDepthParam eq '1' }">
             <c:set var="view_id" value="A" />
         </c:if>
         <c:if test="${pathDepthParam eq '2' }">
             <c:set var="view_id" value="B" />
         </c:if>
         <c:if test="${pathDepthParam eq '3' }">
             <c:set var="view_id" value="C" />
         </c:if>
     </c:when> 
     <c:otherwise>
         <c:if test="${pathDepthParam eq '1' }">
             <c:set var="view_id" value="B" />
         </c:if>
         <c:if test="${pathDepthParam eq '2' }">
             <c:set var="view_id" value="C" />
         </c:if>
     </c:otherwise>
 </c:choose>                  
     

<title>제주시 스마트 청사안내 </title>

<!-- (${pathSVO.pathType}.${pathDepthParam}) -->

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/mobile.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">

<!-- 지도영역 ZoomIn ZoomOut script --> 
<script src="../../../js/comm/pinch-zoom.umd.js"></script>  
  
</head>

<body>   
<div id="wrap">

 

    <header id="header_wrap">    
        <!--위치보기-->
        <div class="location_text">
            <div class="info">  
                  <strong  id="pop_departName02" >${emFName}</strong><br>
                  <span  id="pop_position02">${emName} ${emFloor}층</span>
            </div>
        </div>
        <!--//위치보기-->
    </header>
    
    
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container">
            <div id="contents">
                <!--실제 컨텐츠-->
                
                
<script language="javascript">
 
$(document).ready(function(){

    //-- 전체조감도에서 출발/도착지 건물 아이콘 노출
    $("#bn_${kioskCodeB}").addClass("active");
    $("#bn_${officeParam.bCode}").addClass("active");

    //-- 현재키오스크 이미지 변경
    $("#fac_${kioskFcCode}").attr("src","/images/kiosk/icon/ani_kiosk-location.png");
    
    
    <c:if test="${ pathType eq 'pt5' || pathType eq 'pt4'  }">
        <!-- <c:set var="gaFloorImgPath" value="/images/kiosk/sub/office/map_full_view_3d.png" /> -->
        <c:set var="gaFloorImgPath" value="/data/floor/${fullPathMap}.png" />
    </c:if>


        $("#${pathSVO.emCode}").removeClass("active");
        $("#${pathSVO.emCode}").addClass("destination");
        
    
});
</script>

                
                <div class="office_info_area">
                    
                    <c:if test="${view_id eq 'A'  }">
                    <!--청사 전체보기-->
                    <div class="office_map_wrap pinch-zoom">
                        <!--<div class="office_map"><img src="../../../images/kiosk/sub/office/map_top_view_3d.png" alt=""></div> -->
                        <div class="office_map"><img src="${gaFloorImgPath}" alt="${gaName} ${gaFloor}층 이미지"   ></div> 
                        <div class="map_svg_area">
                            <svg class="map_svg" viewBox="0 0 1520 920">
                                      <path class="path_line" d="M ${gaPathLine}"></path>
                            </svg>
                        </div>
                        <!--
                        <span class="current_location ${kioskCode}"  ><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span> 
                         -->

                        <ul class="building_name"> 
                                    <!-- 
                                    <li id="bn_B01" style="left: 820px; top: 260px;"><button type="button">본관</button></li>
                                    <li id="bn_B02" style="left: 470px; top: 260px;"><button type="button">1별관</button></li>
                                    <li id="bn_B03" style="left: 325px; top: 345px;"><button type="button">2별관</button></li>
                              <li id="bn_B08" style="left: 210px; top: 260px;"><button type="button">복지동</button></li>
                              <li id="bn_B09" style="left: 210px; top: 370px;"><button type="button">상하수도과</button></li>
                              <li id="bn_B04" style="left: 545px; top: 530px;"><button type="button">3별관</button></li>
                              <li id="bn_B05" style="left: 720px; top: 510px;"><button type="button">4별관</button></li>
                              <li id="bn_B06" style="left: 1045px; top: 595px;"><button type="button">5별관</button></li>
                              <li id="bn_B07" style="left: 1145px; top: 645px;"><button type="button">5별관 부속동</button></li>  -->                                    
                        </ul>
                    </div>
                    <!--//청사 전체보기--> 
                    </c:if>
                    
                    
                    
                    
                    <c:if test="${view_id eq 'B'  }">
                    <!-- 건물 안으로 이동 안내 레이어팝업-->
                    <div class="moving_popup path1">
                        <!--건물 이동 애니메이션-->
                        <div class="detail_popup">
                            <div class="detail">
                                <div class="popup_contents">
                                    <div class="walking_img"><img src="../../../images/kiosk/sub/ani_walking.png" alt=""></div>
                                    <div class="moving_img"><img src="${gaBuildingImg}" alt="${emName} 입구"></div>
                                </div>
                            </div>
                        </div>
                        <!--//건물 이동 애니메이션-->
                    </div>
                    <!--//건물 안으로 이동 안내 레이어팝업-->
                    </c:if>
                    
                    
                    
                    <c:if test="${view_id eq 'C'  }">
                    <!--도착 층 정보-->
                    <div class="office_map_wrap pinch-zoom">
                        <div class="office_map"><img src="${officeParam.floorImgPath}" alt="${officeParam.bName} ${officeParam.fCode}층 이미지"   ></div>
                        <div class="map_svg_area">
                            <svg class="map_svg" viewBox="0 0 1520 920">
                                      <path class="path_line" d="M  ${emPathLine}"></path>
                            </svg>
                        </div>
                        
                        <!-- <span class="current_location " style="left: ${emPointX}px; top: ${emPointY}px;"><img src="/images/kiosk/icon/ani_destination.png" alt="목적지 도착"></span>  -->

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
                                            <li style="left:${item.pointX}px; top: ${item.pointY}px;" class="${class_active}"  id="${item.facilityCode }"  ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');"><img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '<br>')}" onerror="this.style.display = 'none'">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
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
                                    
                    </div>
                    <!--//도착 층 정보-->
                    </c:if>
                    
                    
                    
                    
                    <!--이동 진행 프로세스-->
                    <!-- 
					  * pt5 : 건물,건물,1층,도착층,도착지
					  * pt4 : 건물,건물,1층(도착층),도착지
					  * pt3 : 건물,1층,도착층,도착지
					  * pt2 : 건물,1층(도착층),도착지
					  --> 
                    <div class="path_process">  
                    	<p class="service_info">각 버튼을 터치하시면 <span class="block">길안내 정보를 제공 받을 수 있습니다.</span></p>
                        <div class="process_box">
                             <!--  ${pathSVO.gaCode}// ${pathSVO.emCode} // ${pathSVO.facilityGubun} -->
                             <c:choose>
	                             <c:when test="${ pathType eq 'pt5' || pathType eq 'pt4'  }">
	                             
			                            <button type="button" onclick="fn_goNextDepth(1)" class="active" ><span>${gaName}</span></button>
			                            <img src="/images/kiosk/sub/ani_process-arrow.png" alt="" id="img_process_arrow_01" >
			                            
			                            <c:if test="${ fullPathMap eq 'B11_F00' }">
			                            <button type="button" onclick="fn_goNextDepth(2)" ><span>${emName}</span></button>
			                            <img src="/images/kiosk/sub/process-arrow.png" alt=""  id="img_process_arrow_02" >
			                            </c:if>
			                            <!-- //본관,1,2별관 이동시 정문 이미지 비노출 -->
                                        <c:if test="${ fullPathMap ne 'B11_F00' }">
                                        <button type="button" onclick="fn_goNextDepth(2)" style="display:none;" ><span>${emName}</span></button>
                                        <img src="/images/kiosk/sub/process-arrow.png" alt=""  id="img_process_arrow_02" style="display:none;" >
                                        </c:if>
			                            
			                            <button type="button" onclick="fn_goNextDepth(3)" ><span>${emFloor}층</span></button>
			                            
	                             </c:when> 
	                             <c:otherwise>
			                            <button type="button" onclick="fn_goNextDepth(1)"  class="active" ><span>${emName}</span></button>
			                            <img src="/images/kiosk/sub/ani_process-arrow.png" alt="" id="img_process_arrow_01">
			                            <button type="button" onclick="fn_goNextDepth(2)" ><span>${emFloor}층</span></button>
	                             </c:otherwise>
                             </c:choose>
                        </div>
                        
						<script type="text/javascript"> 
						    function fn_goNextDepth(depth){
						    	location.href="/pathFinderMobile.ez?ga=${pathSVO.gaCode}&em=${pathSVO.emCode}&fcg=${pathSVO.facilityGubun}&pdp="+depth;
						    }
						
						    $(document).ready(function(){
						    	
						 
						    	<c:choose>
	                                <c:when test="${ pathDepthParam eq '2'  }">
	                                    console.log(" pathDepthParam = ${pathDepthParam}");
	                                    $("#img_process_arrow_01").attr("src","/images/kiosk/sub/process-arrow.png");
	                                    $("#img_process_arrow_02").attr("src","/images/kiosk/sub/ani_process-arrow.png");
	                                    $(".process_box button:eq(0)").removeClass("active");
	                                    $(".process_box button:eq(1)").addClass("active");
	                                </c:when> 
	                                <c:when test="${ pathDepthParam eq '3'  }">
		                                console.log(" pathDepthParam = ${pathDepthParam}");
		                                $("#img_process_arrow_01").attr("src","/images/kiosk/sub/process-arrow.png");
		                                $("#img_process_arrow_02").attr("src","/images/kiosk/sub/process-arrow.png");
		                                $(".process_box button:eq(0)").removeClass("active");
		                                $(".process_box button:eq(1)").removeClass("active");
		                                $(".process_box button:eq(2)").addClass("active");
		                            </c:when> 
                                </c:choose>
						
						        
						    });
						</script>   


                    </div>
                    <!--//이동 진행 프로세스-->
                    
                    
                </div>
                <!--//실제 컨텐츠--> 
            </div>
        </section>
    </main>
    <!--//Contents 영역--> 
    
    <!--Footer 영역-->
    <footer id="footer_wrap">       
        <p>ⓒ JEJUSI. All rights reserved.</p>
    </footer>
    <!--//Footer 영역--> 
</div>

<!--지도영역 ZoomIn ZoomOut-->
<script type="text/javascript">
    var el = document.querySelector('.pinch-zoom');
    new PinchZoom.default(el, {
        minZoom: 2
    });
    

    $(document).ready(function(){
    	

        
    });
</script>   
</body>
</html>