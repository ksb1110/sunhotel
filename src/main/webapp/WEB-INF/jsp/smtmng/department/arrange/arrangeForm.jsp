<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 직원안내도 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script src="${pageContext.request.contextPath}/js/comm/bxslider/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath}/js/smtmng/arrangeForm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//이미지 보기
function viewFile(filePath) {
	window.open(filePath);
}

$(function() {
	
	//title 속성이 들어있으면 tooltip 적용
	$(document).tooltip();
});
</script>

</head>

<body>
<div id="wrap">

	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="arrange"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">직원안내도</h2>    
            
            <c:if test="${not empty facilityVO}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li class="active">
                        <a href="<c:url value="/smtmng/department/arrange/arrangeUpdateForm.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">직원안내도</a>
                    </li>
                    <li>
                        <a href="<c:url value="/smtmng/department/arrange/displayPromotionForm.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">홍보이미지관리</a>
                    </li>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
            </c:if>
            
            <!-- 배경이미지 삭제 폼 -->
            <form name="delete_img_form" id="delete_img_form" method="post">   
    			<input type="hidden" name="facilityCode" value="${searchVO.sFacilityCode}">
		    </form>
		    
		    <!-- 배치정보 > 일반이미지 삭제 폼 -->
		    <form name="delete_normal_img_form" id="delete_normal_img_form" method="post">   
    			<input type="hidden" name="facilityCode" value="${searchVO.sFacilityCode}"> 
    			<input type="hidden" name="arrangeCode" value="">
		    </form>
		    
            <form name="update_img_form" id="update_img_form" method="post" enctype="multipart/form-data">    
    		<input type="hidden" name="facilityCode" value="${searchVO.sFacilityCode}">
    		
           	<div class="table-wrapper"> 
	        	<table class="table-row th-left">
		            <colgroup>
		                <col style="width:200px;">
		                <col>
		            </colgroup>
		            <tbody>
		           		<tr>
		                    <th>
		                    	<div class="necessary-area">
		                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
		                            시설선택
		                            <input type="hidden" id="choiceFacilityCodeValue" value="">
		                        </div>                    	
		                    </th>
		                    <td id="choiceFacilityTd">
		                    	<select name="facilityCodeSelect" onchange="choiceFacility();">
		                    		<option value="">== 사무실을 선택해주세요. ==</option>		                    		
		                    		<c:if test="${not empty facilityVOList && fn:length(facilityVOList) > 0}">
		                    		<c:forEach var="item" items="${facilityVOList}">
		                    			<option value="${item.facilityCode}">[${item.facilityCode}] ${item.facilityName}</option>
		                    		</c:forEach>
		                    		</c:if>
		                    	</select>           	
		                    </td>
		                </tr>
		                
		                <tr id="refFlagTr" style="display:none;">
		                    <th>직원안내도 연결</th>
		                    <td>
                                <label><input type="radio" name="refFlag" value="N" onclick="selectRefFlag();" checked><span>안내도를 직접 구성합니다.</span></label>      
                                <label><input type="radio" name="refFlag" value="Y" onclick="selectRefFlag();"><span>타부서 직원안내도를 연결합니다.</span></label>  	
		                    </td>
		                </tr>
		                
		                
		           		<tr id="refFacilityTr" style="display:none;">
		                    <th>
		                    	<div class="necessary-area">
		                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
		                            연결할 시설선택
		                        </div>                    	
		                    </th>
		                    <td id="choiceRefFacilityTd">
		                    	<select name="refFacilityCodeSelect">
		                    		<option value="">== 사무실을 선택해주세요. ==</option>		                    		
		                    		<c:if test="${not empty refFacilityVOList && fn:length(refFacilityVOList) > 0}">
		                    		<c:forEach var="item" items="${refFacilityVOList}">
		                    			<option value="${item.facilityCode}">[${item.facilityCode}] ${item.facilityName}</option>
		                    		</c:forEach>
		                    		</c:if>
		                    	</select>           	
		                    </td>
		                </tr>
		                
		                <tr id="choiceCompleteTr">
		                    <td colspan="2">                                
								<button type="button" class="btn green sm" onclick="choiceFacilityCode('insert','','');">선택완료</button>		
		                    </td>
		                </tr>
		                
		                
		                
		                <c:if test="${not empty facilityVO}">
						<tr>
		                    <th>배경이미지 ( 1920 x 1080 )</th>
		                    <td>	
		                    	<c:if test="${facilityVO.arrangeBgImg == null || facilityVO.arrangeBgImg == ''}">
		                           	<div>
		                           		<input type="file" name="upfile">
										<button type="button" class="btn green sm" onclick="insertArrangeBgImg();">등록</button>
		                           	</div>
		                    	</c:if>
		           				<c:if test="${facilityVO.arrangeBgImg != null && facilityVO.arrangeBgImg != ''}">
		                           	<div>
		                           		<img src="${facilityVO.arrangeBgImg}" height="40">
		                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                           		<button type="button" class="btn green sm" onclick="viewFile('${facilityVO.arrangeBgImg}');">보기</button>
										<button type="button" class="btn red sm" onclick="deleteArrangeBgImg();">삭제</button>
		                           	</div>
		                      	</c:if>                  	
		                    </td>
		                </tr>
		                
		                <tr>
		                    <th>자막표시여부</th>
		                    <td>
                                <label><input type="radio" name="subtitleShowFlag" value="Y" onclick="udateSubtitleShowFlag();" <c:if test="${facilityVO.subtitleShowFlag == null || facilityVO.subtitleShowFlag == 'Y'}">checked</c:if>><span>표시함</span></label>
                                <label><input type="radio" name="subtitleShowFlag" value="N" onclick="udateSubtitleShowFlag();" <c:if test="${facilityVO.subtitleShowFlag == 'N'}">checked</c:if>><span>표시안함</span></label>        	
		                    </td>
		                </tr>
		                
		                <tr>
		                    <th>
		                    	<div style="display:inline-flex;align-item:center;">
		                    		<div style="padding-top:4px;">배치선택</div>			                    	
			                    	<span class="material-icons" style="color:#FF7E00;" title="배치가 겹쳐서 숨겨진 경우 특정 배치만 선택하여 설정할 수 있습니다.">help_center</span>
		                    	</div>
		                    </th>
		                    <td>
		                    	<div style="display:inline-flex;">
	                            	<div id="objectBtnDiv">
	                            		<button type='button' class='choice_all_obj_btn btn black sm' onclick="clickObjectBtn('all');">전체</button>	
	                            	</div>      
		                    	</div>    	
		                    </td>
		                </tr>
		                
		                </c:if>
		        	</tbody>
	    		</table>
	   		</div>
	   		
	   			<!-- 
					$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
					마지막은 다른 데이터로 변경하면 됨.
				-->
            	<input type="hidden" name="parsingPrevent" value="">
            
	   		</form>
	   			   		
	   		<form name="show_all_arrange_form" id="show_all_arrange_form" style="display:none;">
           		<input type="hidden" name="facilityCode" value="">
           	</form>
           	
           	<form name="delete_arrange_form" id="delete_arrange_form" style="display:none;">
           		<input type="hidden" name="facilityCode" value="">
           		<input type="hidden" name="arrangeCode" value="">
           	</form>
           	
	   		<form name="update_arrange_point_form" id="update_arrange_point_form" style="display:none;">
           		<input type="hidden" name="facilityCode" value="">
           		<input type="hidden" name="arrangeCode" value="">
           		<input type="hidden" name="pointX" value="">
           		<input type="hidden" name="pointY" value="">
           	</form>
	   		
	   		<!-- 배치 추가폼 레이어가 들어갈 영역 -->
	   		<div id="loadArrangeInsertLayerPopDiv">
	   		
	   		</div>
	   		
	   		<!-- 배치 수정폼 레이어가 들어갈 영역 -->
	   		<div id="loadArrangeUpdateLayerPopDiv">
	   		
	   		</div>
	   		
	   		<!-- 책상배치 수정폼 레이어가 들어갈 영역 -->
	   		<div id="loadArrangeDeskUpdateLayerPopDiv">
	   		
	   		</div>
	   		
	   		<!-- 버튼영역 시작 -->
		    <div class="btn-wrap" style="text-align:left;display:none;" id="manageToolDiv">
				<button type="button" class="btn blue sm" onclick="openInsertArrangeFormLayerPop();">배치추가</button>
				
				&nbsp;&nbsp;
				&nbsp;&nbsp;
				&nbsp;&nbsp;
				<button type="button" class="btn sm" onclick="goList();">목록</button>
				&nbsp;&nbsp;
				&nbsp;&nbsp;
				&nbsp;&nbsp;
				<button type="button" class="btn black sm" onclick="zoomOut();">화면축소</button>
				<button type="button" class="btn black sm" onclick="zoomIn();">화면확대</button>
				<button type="button" class="btn black sm" onclick="zoomReset();">기본화면</button>
				<span style="color:blue;font-size:12px;">* 화면축소/화면확대 버튼을 눌렀을 때 정상적으로 동작하지 않으면 확대(Ctrl 누른상태에서 +키), 축소(Ctrl 누른상태에서 -키), 기본(Ctrl 누른상태에서 0키)</span>
			</div>
			<!-- 버튼영역 끝 -->
			
			
			<br /><br />
			
			<div id="arrangeDivMapFullSize" style="font-weight:bold;font-size:11px;display:none;padding-bottom:5px;">( 1920 x 1080 )</div>
			
			<!-- 배치 베이스레이어 : 배치도가 겹쳤을 경우 특정 배치만 볼 경우 다른 배치를 가리는 용도의 레이어 -->
			<div id="choiceObjectBaseDiv" style="position:absolute;background:#94F375;width:1920px;height:1080px;z-index:95;opacity:0.5;display:none;"></div>
			
			<div id="arrangeMapDiv" style="padding-right:500px;padding-bottom:500px;background:#F4F0ED;width:1920px;height:1080px;display:none;<c:if test="${facilityVO.arrangeBgImg != null && facilityVO.arrangeBgImg != ''}">background-image:url('${facilityVO.arrangeBgImg}');background-position:left top;background-repeat:no-repeat;</c:if>">
				
				<!-- 격자 시작 -->
				<c:forEach begin="0" end="64" step="1" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 9 || status.count == 17 || status.count == 25 || status.count == 33 || status.count == 41 || status.count == 49 || status.count == 57}">
						</c:when>
						<c:otherwise>
							<div style="position:absolute;border-left:2px solid #ccc;width:1px;height:1080px;padding:0;margin-left:${(status.count-1) * 30 - 1}px;"></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:forEach begin="0" end="36" step="1" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 10 || status.count == 28}">
							<div style="position:absolute;border-top:2px solid #000;width:1920px;height:1px;padding:0;margin-top:${(status.count-1) * 30 - 1}px;"></div>
						</c:when>
						<c:when test="${status.count == 19}">
							<div style="position:absolute;border-top:2px solid #EB2C33;width:1920px;height:1px;padding:0;margin-top:${(status.count-1) * 30 - 1}px;"></div>
						</c:when>
						<c:otherwise>
							<div style="position:absolute;border-top:2px solid #ccc;width:1920px;height:1px;padding:0;margin-top:${(status.count-1) * 30 - 1}px;"></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:forEach begin="0" end="64" step="1" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 9 || status.count == 17 || status.count == 25 || status.count == 41 || status.count == 49 || status.count == 57}">
							<div style="position:absolute;border-left:2px solid #000;width:1px;height:1080px;padding:0;margin-left:${(status.count-1) * 30 - 1}px;"></div>
						</c:when>
						<c:when test="${status.count == 33}">
							<div style="position:absolute;border-left:2px solid #EB2C33;width:1px;height:1080px;padding:0;margin-left:${(status.count-1) * 30 - 1}px;"></div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 격자 끝 -->
				
				<!-- 배치도가 들어갈 영역 -->
				<div id="loadArrangeTableDivSpot">
					
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
				
			</div>
			
			
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

<script>

//하단 스크롤바 top 설정
function setSlidingNoticeTop() {
	
	var mapOffsetTop = $("#arrangeMapDiv").offset().top;
	
	$("div.sliding_notice").css("top", (1020 + mapOffsetTop) + "px");
}

$(function() {
	
	<c:if test="${not empty facilityVO}">
	//수정모드로 온 경우
	choiceFacilityCode('update','${facilityVO.facilityCode}','${facilityVO.facilityName}');
	
	//해당 시설에 적용되어 있는 배치정보 로딩 후 표시
	loadAllArrange('${facilityVO.facilityCode}');
	</c:if>
	
	//하단 스크롤바 top 설정
	setSlidingNoticeTop();
});
</script>

</body>
</html>