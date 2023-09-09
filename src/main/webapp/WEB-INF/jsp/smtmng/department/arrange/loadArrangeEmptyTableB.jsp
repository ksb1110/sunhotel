<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
pageContext.setAttribute("cr", "\r");
pageContext.setAttribute("cn", "\n");
pageContext.setAttribute("crcn", "\r\n");
pageContext.setAttribute("sp", "&nbsp;");
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("lt1", "&lt;");
pageContext.setAttribute("gt1", "&gt;");
pageContext.setAttribute("lt2", "<");
pageContext.setAttribute("gt2", ">");
%>

<!--  
	관리자 > 부서관리 > 직원안내도 > 부서추가/수정 > 부서장용 배치도 HTML
	
	onmouseout="outArrangeDiv();"
	onmouseover="selectArrangeDiv('oneArrangeDiv_${arrangeInfo.arrangeCode}');"
-->

<div id="oneArrangeDiv_${arrangeInfo.arrangeCode}" class="arrangeDiv" style="position:absolute;text-align:center;z-index:90;">
					
	<div class="buttonDiv" style="border-radius: 10px;position:absolute;margin-top:-85px;text-align:center;width:232px;display:none;padding:10px 20px;background:#877F7F;z-index:90;">
		<input type="text" name="arrangePointX" value="${arrangeInfo.pointX}" style="width:70px;text-align:center;padding:0;margin:0;height:29px;" maxlength="4">
		<input type="text" name="arrangePointY" value="${arrangeInfo.pointY}" style="width:70px;text-align:center;padding:0;margin:0;height:29px;" maxlength="4">
		<button type="button" class="btn sm" onclick="movePoint($(this).parent().parent(), $(this).prev().prev().val(), $(this).prev().val());">좌표이동</button>
		<br>
		<button type="button" class="btn blue sm" onclick="openUpdateArrangeFormLayerPop('${arrangeInfo.arrangeCode}');">수정</button>
		<button type="button" class="btn red sm" onclick="deleteArrange('${arrangeInfo.arrangeCode}');">삭제</button>
		<button type="button" class="btn green sm" id="oneArrangeDiv_${arrangeInfo.arrangeCode}_Header" style="cursor:move;">드래그</button>
		<button type="button" class="btn black sm" onclick="outArrangeDiv2();">닫기</button>
	</div>
	
	<div onmouseout="hideSetupBtnDiv();" onmouseover="showSetupBtnDiv('${arrangeInfo.arrangeCode}');" id="setupButtonDiv_${arrangeInfo.arrangeCode}" class="setupButtonDiv" style="display:none;position:absolute;margin-top:-30px;text-align:center;width:60px;padding:0;z-index:90;opacity:0.9;padding-bottom:4px;">
		<button type="button" class="btn sm" style="background:orange;width:120px;" onclick="selectArrangeDiv('oneArrangeDiv_${arrangeInfo.arrangeCode}');">설정</button>
	</div>
	
	<!-- 과장일 때 class="org_section"에 big_boss 추가 -->
	
	<c:set var="deskInfo_0_0" value="${arrangeDeskMap.get('0_0')}"/>
	
	<div class="org_section big_boss">
		
		<c:if test="${not empty arrangeInfo.arrangeName}">
		<h2 onmouseout="hideSetupBtnDiv();" onmouseover="showSetupBtnDiv('${arrangeInfo.arrangeCode}');" class="org_section_title ${arrangeInfo.bgColor}">
			<c:if test="${arrangeInfo.nameFlowFlag == 'Y'}">
			<div class="slide_title">
				<span class="slide" style="animation-duration: 10s;">${arrangeInfo.arrangeName}</span>
			</div>
			</c:if>
			<c:if test="${arrangeInfo.nameFlowFlag == 'N'}">
			${arrangeInfo.arrangeName}
			</c:if>
		</h2>
		</c:if>
		
		<div onmouseout="hideSetupBtnDiv();" onmouseover="showSetupBtnDiv('${arrangeInfo.arrangeCode}');" class="org_info ${deskInfo_0_0.bgColor}" <c:if test="${deskInfo_0_0.showFlag == 'N'}">style="background:#ccc;"</c:if>>
		
			<span class="photo">
				<c:if test="${not empty deskInfo_0_0.memberImgPath}">
				<img src="${deskInfo_0_0.memberImgPath}" alt="" width="106" height="150">
				</c:if>
				<c:if test="${empty deskInfo_0_0.memberImgPath}">
				<img src="/images/display/org_photo/noimg_93x128.png" width="106" height="150">
				</c:if>
			</span>
			
			<div class="edit_btn">
				<img src="/images/admin/icon/temp/blue_edit.png" alt="edit" width="18" style="cursor:pointer;" onclick="openUpdateDeskFormLayerPop('${deskInfo_0_0.deskSeq}');">
			</div>
					
			<c:choose>
				<c:when test="${not empty deskInfo_0_0.employeeSeq && deskInfo_0_0.employeeSeq > 0}">
					
				<div class="text" <c:if test="${deskInfo_0_0.showFlag == 'N'}">style="background:#ccc;"</c:if>>
			
					<div class="name">
						<strong>
							<c:if test="${not empty deskInfo_0_0.name}">
							${deskInfo_0_0.name}
							</c:if>
						</strong>
						<em>${deskInfo_0_0.positionNm}</em>
					</div>
					
					<div class="work">
						<c:if test="${not empty deskInfo_0_0.deskJob}">
						
						<!-- jstl로 변환처리 -->
						<c:set var="cmt" value="${fn:replace(deskInfo_0_0.deskJob,lt2,lt1)}" />
						<c:set var="cmt" value="${fn:replace(cmt,gt2,gt1)}" />
						<c:set var="cmt" value="${fn:replace(cmt,crcn,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
						<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
						
						<!-- 화면에 출력하기 -->
						<c:out value="${cmt}" escapeXml="false"/> 
						
						</c:if>
					</div>
					
				</div>
		
				</c:when>
				<c:otherwise>
					
					<div class="text <c:if test="${deskInfo_0_0.showFlag != 'N'}">noInfo</c:if>" <c:if test="${deskInfo_0_0.showFlag == 'N'}">style="background:#ccc;"</c:if>>
						
						<c:if test="${deskInfo_0_0.showFlag != 'N'}">
					
						<p>정보를 준비중 입니다.</p>
							
						</c:if>
						
					</div>
					
				</c:otherwise>
			</c:choose>
		</div>
				
	</div>
	<!--// 과장일 때 class="org_section"에 big_boss 추가 -->
		
</div>



