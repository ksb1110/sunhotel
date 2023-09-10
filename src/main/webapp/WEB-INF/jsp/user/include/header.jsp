<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="un" 	   uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
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
                        
                    </ul>
                </nav>  
                              
                
                
            </div>
        </div> <!--//main-menu-wrapper-->
	</header>
	
	
	
	<aside class="left-gnb">
        <h1 class="logo"><a href="<c:url value="/main.ez"/>">제주 썬호텔</a></h1>
        
        <div class="menu-area">
            <ul id="depth1" class="depth1">
                
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
               
           </ul>
        </div>
        <nav class="foot-info">
            <!-- <a href="<c:url value="/smtmng/logout.ez"/>">로그아웃</a> -->
            <a href="<c:url value="/penta/sso/logout.jsp"/>">로그아웃</a>
        </nav>
	</aside>
	
	
	








