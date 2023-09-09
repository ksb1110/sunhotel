<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>메인페이지 - 제주시 스마트청사 안내</title> 
 
</head>
<body>


<c:set var="bCode" value="${officeInfoSVO.bCode}" />
<c:set var="nowCompass" value="${officeInfoSVO.nowCompass}" />
<!-- //${bCode}//${nowCompass}//  --> 

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/office.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    
<script language="javascript">

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
    
    //-- 현재키오스크 이미지 변경
    setTimeout(function() {
        $("#fac_${kioskFcCode}").attr("src","/images/kiosk/icon/ani_kiosk-location.png");
    }, 500);
    
   
    
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
                         
                        <div class="office_info_area">
                            <div class="sub_button">
                                <ul> 
                                    <!--  <li><button type="button" class="location" onclick="fn_pointerSpot('G15');">현위치</button></li> -->
                                    <li><button type="button" class="location" onclick="fn_gomap('${kioskCodeB}','${kioskCodeF}');">현위치</button></li>
                                    <li onclick="fn_pointerSpot('G04');"><button type="button" class="toilet">화장실</button></li>
                                    <li onclick="fn_pointerSpot('G02');"><button type="button" class="stairs">계단</button></li>    
                                    <li id="facility_G12" onclick="fn_pointerSpot('G12');" style="display: none;"><button type="button" class="elevator">엘리베이터</button></li> 
                                    <li id="facility_G14" onclick="fn_pointerSpot('G14');" style="display: none;"><button type="button" class="cigarette">흡연실</button></li>
                                    <li id="facility_G08" onclick="fn_pointerSpot('G08');" style="display:none;"><button type="button" class="bank">은행</button></li> 
                                </ul>
                            </div>
                            
                            <div class="office_map_area">

	                            <div class="office_map"><img src="${officeParam.floorImgPath}" alt="${officeParam.bName} ${officeParam.fCode}층 이미지"   onerror='this.src="/images/kiosk/icon/noImg.png"'    ></div>
	                          	     
	                            <ul class="department_name">
	                             <c:forEach items="${OF}" var="item" varStatus="status">
	                                 
	                                 <c:if test="${item.facilityGubun eq 'G01' || item.facilityGubun eq 'G09' }" >
	                                 	<!-- 사무실, 회의실 --> 
	                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;"><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
	                                 </c:if> 
	                                 
	                                 <c:if test="${item.facilityGubun eq 'G08' }" >
	                                 	<!-- 은행 -->
	                                    <li style="left:${item.pointX}px; top: ${item.pointY}px;"><button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');"><img src="${item.facilityImgPath}" alt="${item.facilityName}" onerror="this.style.display = 'none'">${fn:replace(item.facilityName, '_', '<br>')}</button></li>
	                                 </c:if>    
	                                      
	                             </c:forEach> 
	                            </ul>
	                            <ul class="facility_icon">
	               					<c:forEach items="${OF}" var="item" varStatus="status"> 
	                                 	<c:if test="${item.facilityGubun ne 'G01' &&  item.facilityGubun ne 'G08' &&  item.facilityGubun ne 'G09'}" > 
	                                     	<li style="left:${item.pointX}px; top: ${item.pointY}px;">
	                                     		<button type="button" onclick="fn_layerPop('${kioskCode}','${item.facilityCode}');">
		                                     		<img src="${item.facilityImgPath}" alt="${fn:replace(item.facilityName, '_', '')}" onerror="this.style.display='none'" id="fac_${item.facilityCode}" >
	                                     			<span class="pointer_none point_spot point_${item.facilityGubun}">&nbsp</span>
	                                     		</button>
	                                     	</li>
	                                 	</c:if>     
	                             	</c:forEach>    
	                            </ul>
	                            
                    		</div>        
                            
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