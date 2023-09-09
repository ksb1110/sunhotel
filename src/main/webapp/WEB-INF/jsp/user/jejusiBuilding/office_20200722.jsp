<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>
 
<%@ include file="/WEB-INF/jsp/common/pageHeader_jejusi.jsp" %>

<script type="text/javascript" src="/js/jejusiBuilding/office.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>

<!-- 지도영역 ZoomIn ZoomOut script --> 
<script src="../../../js/comm/pinch-zoom.umd.js"></script>  



<title>메인페이지 - 제주시 스마트청사 안내</title> 
 
</head>
<body>
 
<div id="wrap">

    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            <div class="content_top_wrap">
               
    
              <%/* home btn, search area - content_top_wrap */%>
              <%@ include file="/WEB-INF/jsp/common/pageSearch_jejusi.jsp" %>

            </div>
    
 
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->         
                    
                      
                         
                        
                        <!--층 시설정보 리스트--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officeFloorList.jsp" %>  
                        <!--//층 시설정보 리스트-->
                        
                        
                        
                             
            
            <div class="content_area">          
                <div id="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->
                    <h2 class="title1"><span>${officeParam.bName}</span> <span class="inline">${officeParam.fCode}층</span>   <!--  ${officeParam.facilityCode}${officeParam.bCode} --></h2>
                         
                        
                    <div class="office_info_area">
                        <div class="sub_button">
                            <ul>
                                 <!-- <li ><button type="button" class="location" onclick="fn_pointerSpot('G15');">현위치</button></li> -->
                                 <li onclick="fn_pointerSpot('G04');" ><button type="button" class="toilet">화장실</button></li>
                                 <li onclick="fn_pointerSpot('G02');" ><button type="button" class="stairs">계단</button></li>    
                                 <li id="facility_G12" onclick="fn_pointerSpot('G12');"   style="display: none;" ><button type="button" class="elevator">엘리베이터</button></li> 
                                 <li id="facility_G14" onclick="fn_pointerSpot('G14');"  style="display: none;" ><button type="button" class="cigarette">흡연실</button></li>
                                 <li id="facility_G08" onclick="fn_pointerSpot('G08');"  style="display:none;" ><button type="button" class="bank">은행</button></li> 
                            </ul>
                        </div>
                        <div class="office_map_wrap pinch-zoom">                                                        
                            <div class="office_map"><img src="${officeParam.floorImgPath}" alt="${officeParam.bName} ${officeParam.fCode}층 이미지"   onerror='this.src="/images/kiosk/icon/noImg.png"'    ></div>                            
                            
                            <ul class="department_name">
                             <c:forEach items="${OF}" var="item" varStatus="status">
                                 <!-- 사무실, 회의실 --> 
                                 <c:if test="${item.facilityGubun eq 'G01' || item.facilityGubun eq 'G09' }" >
                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;" id="${item.facilityCode}" ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
                                 </c:if> 
                                 <!-- 은행 -->
                                 <c:if test="${item.facilityGubun eq 'G08' }" >
                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;" id="${item.facilityCode}" ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');"><img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '')}" onerror="this.style.display = 'none'">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
                                 </c:if>         
                             </c:forEach> 
                            </ul>
                            <ul class="facility_icon">
                             <c:forEach items="${OF}" var="item" varStatus="status"> 
                                 <c:if test="${item.facilityGubun ne 'G01' &&  item.facilityGubun ne 'G08' &&  item.facilityGubun ne 'G09'}" > 
                                     <li style="left:${item.pointX}px; top: ${item.pointY}px;" id="${item.facilityCode}" ><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">
                                         <img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '<br>')}" onerror="this.style.display = 'none'" id="fac_${item.facilityCode}" >
                                     <span class="pointer_none point_spot point_${item.facilityGubun} ">&nbsp</span></button>
                                     </li>
                                 </c:if>     
                             </c:forEach>    
                            </ul>
                        </div>
                    </div>
                        
                        
                     
                        
                        
                     <!--부서정보안내 레이어팝업--> 
                     <%@ include file="/WEB-INF/jsp/user/jejusiBuilding/officePopup.jsp" %>  
                     <!--//부서정보안내 레이어팝업-->
                         
                        
                        

                    <!--PC에서만 노출!-->    
                        
                        <!--부서정보안내 레이어팝업--> 
                        <%@ include file="/WEB-INF/jsp/user/main/officeBottomMenu.jsp" %>  
                        <!--//부서정보안내 레이어팝업-->
                         
                
                    <!--//PC에서만 노출!-->  
                        
                    <!--모바일에서만 노출!-->   
                    <div class="building_menu_mobile">
                        <div class="cell">
                            <select id="gomap_sel" title="" onchange="fn_changeSelGomap()" >
                                <option value="main" >전체보기</option>       
                                <option value="B01" <c:if test="${ officeParam.bCode eq 'B01' }">selected</c:if> >본관</option>     
                                <option value="B02" <c:if test="${ officeParam.bCode eq 'B02' }">selected</c:if> >1별관</option>
                                <option value="B03" <c:if test="${ officeParam.bCode eq 'B03' }">selected</c:if> >2별관</option>
                                <option value="B04" <c:if test="${ officeParam.bCode eq 'B04' }">selected</c:if> >3별관</option>
                                <option value="B05" <c:if test="${ officeParam.bCode eq 'B05' }">selected</c:if> >4별관</option>
                                <option value="B06" <c:if test="${ officeParam.bCode eq 'B06' }">selected</c:if> >5별관</option>
                                <option value="B07" <c:if test="${ officeParam.bCode eq 'B07' }">selected</c:if> >5별관 부속동</option>
                                <option value="B10" <c:if test="${ officeParam.bCode eq 'B10' }">selected</c:if> >6별관</option>
                                <option value="B08" <c:if test="${ officeParam.bCode eq 'B08' }">selected</c:if> >복지동</option>
                                <option value="B09" <c:if test="${ officeParam.bCode eq 'B09' }">selected</c:if> >상하수도과</option>
                                <!-- <option value="B10" <c:if test="${ officeParam.bCode eq 'B10' }">selected</c:if> >신축건물</option> -->
                            </select>
                        </div>
                        <div class="cell">
                            <select id="gomap_floor" title="" >
                                <option value="1" >1층</option>
                            </select>
                        </div>
                        <button type="button" class="search_btn" onclick="fn_gomapSel();" >검색</button>
                    </div>  
                    <!--//모바일에서만 노출!--> 
                    <!--//실제 컨텐츠--> 
                    </div>
                </div>
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

$(document).ready(function(){


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
    
    //-- 현재층 선택(모바일)
    setTimeout(function() {
    	
    	
    	fn_changeSelGomap();
    	$("#gomap_floor").val("${officeParam.fCode}").prop("selected", true);
    	//console.log("select change");
    }, 500);
    
    <c:if test="${officeParam.facilityCode ne '' }">
    $("#${officeParam.facilityCode}").addClass("active");
    console.log("${officeParam.facilityCode}");
    </c:if>
    
});


    var el = document.querySelector('.pinch-zoom');
    new PinchZoom.default(el, {
        minZoom: 1
    });
    
</script>   
</body>
</html>