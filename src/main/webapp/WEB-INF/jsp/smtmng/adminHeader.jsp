<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="un" 		uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />


<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

/**
 * 2depth의 첫번째 링크로 이동
 * 메소드명 : moveFirstChild
 * 작성일 : 2018. 9. 28. 오후 12:20:41
 * 작성자 : 김승범
 * @param
 * @return
 */
function moveFirstChild(obj) {
	var fistHref = $('a',$(obj).next()).eq(0).attr("href");
	document.location.href = fistHref;
}
</script>



	<header id="header">
        <div class="main-menu-wrapper">
            <div class="container">
               
                
                <nav class="main-menu">
                    <ul id="depth1" class="depth1">
                    	
                    	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'main'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">메인관리</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/main/setting/settingUpdateView.ez"/>">설정</a></li>
                            	<li><a href="<c:url value="/smtmng/main/promotionMovie/promotionMovieList.ez"/>">홍보영상관리</a></li>
                            	<li><a href="<c:url value="/smtmng/main/campaign/campaignList.ez"/>">캠페인이미지관리</a></li>
                            	<li><a href="<c:url value="/smtmng/main/subtitle/subtitleList.ez"/>">자막관리</a></li>
                            	<li><a href="<c:url value="/smtmng/main/find/findList.ez"/>">부서바로찾기관리</a></li>
                            </ul>
                        </li>
                        </c:if>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'building'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">청사관리</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/building/building/buildingList.ez"/>">건물정보</a></li>
                            	<li><a href="<c:url value="/smtmng/building/facility/facilityList.ez"/>">시설정보</a></li>
                            	<li><a href="<c:url value="/smtmng/building/convenience/convenienceList.ez"/>">편의시설</a></li>
                            	<li><a href="<c:url value="/smtmng/building/nearbyFacility/nearbyFacilityList.ez"/>">가까운시설</a></li>
                            	<li><a href="<c:url value="/smtmng/building/route/routeList.ez"/>">경로정보</a></li>
                            </ul>
                        </li>
                        </c:if>
                        
                        <li <c:if test="${param.admin_menu == 'department'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">부서관리</a>
                            <ul class="depth2">    
                            	
                            	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">                        	
                            	<li><a href="<c:url value="/smtmng/department/department/departmentList.ez"/>">부서정보</a></li>
                            	</c:if>
                            	
                            	<li><a href="<c:url value="/smtmng/department/employee/employeeList.ez"/>">직원정보</a></li>
                            	<li><a href="<c:url value="/smtmng/department/arrange/arrangeList.ez"/>">직원안내도</a></li>
                            	<li><a href="<c:url value="/smtmng/department/emptyLog/emptyLogList.ez"/>">직원부재중관리</a></li>
                            	
                            	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}"> 
                            	<li><a href="<c:url value="/smtmng/department/monitoring/monitoringList.ez"/>">직원안내도 모니터링</a></li>
                            	<li><a href="<c:url value="/smtmng/department/monitoring/monitoringKioskList.ez"/>">키오스크 모니터링</a></li>
                            	</c:if>
                            </ul>
                        </li>
                        
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'equipment'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">장비관리</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/equipment/kiosk/kioskList.ez"/>">키오스크장비</a></li>
                            	<li><a href="<c:url value="/smtmng/equipment/display/displayList.ez"/>">디스플레이장비</a></li>
                            </ul>
                        </li>
                        </c:if>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'community'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">커뮤니티</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/community/satiList.ez"/>">이용만족도관리</a></li>
                            </ul>
                        </li>
                        </c:if>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'kioskstat'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">통계</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/kioskstat/keywordList.ez"/>">키워드통계</a></li>
                            	<li><a href="<c:url value="/smtmng/kioskstat/useList.ez"/>">키오스크 이용통계</a></li>
                            </ul>
                        </li>
                        </c:if>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                        <li <c:if test="${param.admin_menu == 'system'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">시스템관리</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/smtmng/system/admin/adminList.ez"/>">관리자</a></li>
                            	<li><a href="<c:url value="/smtmng/system/adminLog/adminLogList.ez"/>">관리자접속로그</a></li>
                            	<li><a href="<c:url value="/smtmng/system/code/codeList.ez"/>">코드관리</a></li>
                            	<li><a href="<c:url value="/smtmng/system/ip/ipList.ez"/>">접근IP설정관리</a></li>
                            	
                            	<!-- 
                            	<li><a href="<c:url value="/smtmng/system/sms/smsSend.ez"/>">문자발송테스트</a></li>
                            	-->
                            	
                            </ul>
                        </li>
                        </c:if>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel != '1'}">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        </c:if>
                        
                    </ul>
                </nav>  
                              
                
                
            </div>
        </div> <!--//main-menu-wrapper-->
	</header>
	
	
	
	<aside class="left-gnb">
        <h1 class="logo"><a href="<c:url value="/smtmng/main.ez"/>">스마트청사안내<br />관리자</a></h1>
        
        <div class="menu-area">
            <ul id="depth1" class="depth1">
                
                <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">    
				<li <c:if test="${param.admin_menu != 'main'}">style="display:none;"</c:if>>
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">메인관리</a>
                   	<ul class="depth2">                            	
                   		<li <c:if test="${param.admin_menu2 == 'setting'}">class="active"</c:if>><a href="<c:url value="/smtmng/main/setting/settingUpdateView.ez"/>">설정</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'promotionMovie'}">class="active"</c:if>><a href="<c:url value="/smtmng/main/promotionMovie/promotionMovieList.ez"/>">홍보영상관리</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'campaign'}">class="active"</c:if>><a href="<c:url value="/smtmng/main/campaign/campaignList.ez"/>">캠페인이미지관리</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'subtitle'}">class="active"</c:if>><a href="<c:url value="/smtmng/main/subtitle/subtitleList.ez"/>">자막관리</a></li>
                        <li <c:if test="${param.admin_menu2 == 'find'}">class="active"</c:if>><a href="<c:url value="/smtmng/main/find/findList.ez"/>">부서바로찾기관리</a></li>
                   	</ul>
               	</li>
               	</c:if>
               
               	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
               	<li <c:if test="${param.admin_menu != 'building'}">style="display:none;"</c:if>>
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">청사관리</a>
                   	<ul class="depth2">                            	
                   		<li <c:if test="${param.admin_menu2 == 'building'}">class="active"</c:if>><a href="<c:url value="/smtmng/building/building/buildingList.ez"/>">건물정보</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'facility'}">class="active"</c:if>><a href="<c:url value="/smtmng/building/facility/facilityList.ez"/>">시설정보</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'convenience'}">class="active"</c:if>><a href="<c:url value="/smtmng/building/convenience/convenienceList.ez"/>">편의시설</a></li>
                        <li <c:if test="${param.admin_menu2 == 'nearbyFacility'}">class="active"</c:if>><a href="<c:url value="/smtmng/building/nearbyFacility/nearbyFacilityList.ez"/>">가까운시설</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'route'}">class="active"</c:if>><a href="<c:url value="/smtmng/building/route/routeList.ez"/>">경로정보</a></li>
                   	</ul>
               	</li>
               	</c:if>               
               	
               	<li <c:if test="${param.admin_menu != 'department'}">style="display:none;"</c:if>>
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">부서관리</a>
                   	<ul class="depth2">        
                   		
                   		<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">                    	
                   		<li <c:if test="${param.admin_menu2 == 'department'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/department/departmentList.ez"/>">부서정보</a></li>
                   		</c:if>
                   		
                   		<li <c:if test="${param.admin_menu2 == 'employee'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/employee/employeeList.ez"/>">직원정보</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'arrange'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/arrange/arrangeList.ez"/>">직원안내도</a></li>
                        <li <c:if test="${param.admin_menu2 == 'emptyLog'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/emptyLog/emptyLogList.ez"/>">직원부재중관리</a></li>
                        
                        <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
                   		<li <c:if test="${param.admin_menu2 == 'monitoring'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/monitoring/monitoringList.ez"/>">직원안내도 모니터링</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'monitoringKiosk'}">class="active"</c:if>><a href="<c:url value="/smtmng/department/monitoring/monitoringKioskList.ez"/>">키오스크 모니터링</a></li>
                   		</c:if>
                   	</ul>
               	</li>
               
               	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
               	<li <c:if test="${param.admin_menu != 'equipment'}">style="display:none;"</c:if>>
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">장비관리</a>
                   	<ul class="depth2">                            	
                   		<li <c:if test="${param.admin_menu2 == 'kiosk'}">class="active"</c:if>><a href="<c:url value="/smtmng/equipment/kiosk/kioskList.ez"/>">키오스크장비</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'display'}">class="active"</c:if>><a href="<c:url value="/smtmng/equipment/display/displayList.ez"/>">디스플레이장비</a></li>
                   	</ul>
               	</li>
               	</c:if>
               	
               	<c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
               	<li <c:if test="${param.admin_menu != 'community'}">style="display:none;"</c:if>>
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">커뮤니티</a>
                   	<ul class="depth2">                            	
                   		<li <c:if test="${param.admin_menu2 == 'community'}">class="active"</c:if>><a href="<c:url value="/smtmng/community/satiList.ez"/>">이용만족도관리</a></li>
                   	</ul>
               	</li>
               	</c:if>
               
               <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
               <li <c:if test="${param.admin_menu != 'kioskstat'}">style="display:none;"</c:if>>
                   <a href="#firstChild" onclick="moveFirstChild($(this));">통계</a>
                   <ul class="depth2">                            	
                   	<li <c:if test="${param.admin_menu2 == 'keywordList'}">class="active"</c:if>><a href="<c:url value="/smtmng/kioskstat/keywordList.ez"/>">키워드통계</a></li>
                   	<li <c:if test="${param.admin_menu2 == 'useList'}">class="active"</c:if>><a href="<c:url value="/smtmng/kioskstat/useList.ez"/>">키오스크 이용통계</a></li>
                   </ul>
               </li>
               </c:if> 
               
               <c:if test="${sessionScope.sessionUserVO.adminLevel == '1'}">
               <li <c:if test="${param.admin_menu != 'system'}">style="display:none;"</c:if>>
                   <a href="#firstChild" onclick="moveFirstChild($(this));">시스템관리</a>
                   <ul class="depth2">                            	
                   	<li <c:if test="${param.admin_menu2 == 'admin'}">class="active"</c:if>><a href="<c:url value="/smtmng/system/admin/adminList.ez"/>">관리자</a></li>
                   	<li <c:if test="${param.admin_menu2 == 'adminLog'}">class="active"</c:if>><a href="<c:url value="/smtmng/system/adminLog/adminLogList.ez"/>">관리자접속로그</a></li>
                   	<li <c:if test="${param.admin_menu2 == 'code'}">class="active"</c:if>><a href="<c:url value="/smtmng/system/code/codeList.ez"/>">코드관리</a></li>
                   	<li <c:if test="${param.admin_menu2 == 'ip'}">class="active"</c:if>><a href="<c:url value="/smtmng/system/ip/ipList.ez"/>">접근IP설정관리</a></li>
                   	
                   	<!-- 
                   	<li <c:if test="${param.admin_menu2 == 'sms'}">class="active"</c:if>><a href="<c:url value="/smtmng/system/sms/smsSend.ez"/>">문자발송테스트</a></li>
                   	-->
                   	
                   </ul>
               </li>
               </c:if>
               
           </ul>
        </div>
        <nav class="foot-info">
            <!-- <a href="<c:url value="/smtmng/logout.ez"/>">로그아웃</a> -->
            <a href="<c:url value="/penta/sso/logout.jsp"/>">로그아웃</a>
        </nav>
	</aside>
	
	
	








