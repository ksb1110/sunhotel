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



	<header id="header" style="width:100%;">
        <div class="main-menu-wrapper">
            <div class="container">
               
                
                <nav class="main-menu" style="width:200px;">
                    <ul id="depth1" class="depth1">
                    	
                    	<li <c:if test="${param.admin_menu == 'main'}">class="active"</c:if>>
                            <a href="#firstChild" onclick="moveFirstChild($(this));">보고서</a>
                            <ul class="depth2">                            	
                            	<li><a href="<c:url value="/user/form/form1.ez"/>">보고서1</a></li>
                            	<li><a href="<c:url value="/user/form/form2.ez"/>">보고서2</a></li>
                            	<li><a href="<c:url value="/user/form/form3.ez"/>">보고서3</a></li>
                            	<li><a href="<c:url value="/user/form/form4.ez"/>">보고서4</a></li>
                            	<li><a href="<c:url value="/user/form/form5.ez"/>">보고서5</a></li>
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
                   	<a href="#firstChild" onclick="moveFirstChild($(this));">보고서</a>
                   	<ul class="depth2">                            	
                   		<li <c:if test="${param.admin_menu2 == 'form1'}">class="active"</c:if>><a href="<c:url value="/user/form/form1.ez"/>">보고서1</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'form2'}">class="active"</c:if>><a href="<c:url value="/user/form/form2.ez"/>">보고서2</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'form3'}">class="active"</c:if>><a href="<c:url value="/user/form/form3.ez"/>">보고서3</a></li>
                   		<li <c:if test="${param.admin_menu2 == 'form4'}">class="active"</c:if>><a href="<c:url value="/user/form/form4.ez"/>">보고서4</a></li>
                        <li <c:if test="${param.admin_menu2 == 'form5'}">class="active"</c:if>><a href="<c:url value="/user/form/form5.ez"/>">보고서5</a></li>
                   	</ul>
               	</li>
               
           </ul>
        </div>
	</aside>
	
	
	








