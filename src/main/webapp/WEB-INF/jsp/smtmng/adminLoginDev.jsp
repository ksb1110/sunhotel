<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"      uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"    uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="un" 		uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="넥스트이지">
<meta name="format-detection" content="telephone=no">

<title>관리자 로그인</title>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/comm_default.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/comm_style.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/login.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">

<!--ie9 미만-->
<!--[if lt IE 9]>
<script src="/js/html5shiv.js"></script>
<script src="/js/IE9.js"></script>
<![endif]-->

<!-- script -->
<script src="${pageContext.request.contextPath}/js/comm/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/html_comm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
<script src="${pageContext.request.contextPath}/js/admin/html_style.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
<script src="${pageContext.request.contextPath}/js/admin/jquery.cookie.js"></script>

<c:if test="${isReal == 'Y'}">

<script type="text/javascript">

    var returnURL = "${fn:escapeXml(param.returnURL)}";
    
    if (returnURL == null || returnURL == "") {
    	
        returnURL = "/smtmng/main.ez";
    }   	
    
    if ($.cookie('penta_sso') == "Y" && $.cookie('penta_isSession') == "Y" && ${sessionUserVOFlag}) {
    	
    	//쿠키삭제
    	$.cookie('penta_sso',null); 
    	$.cookie('penta_isSession',null); 
    	
    	// 로그아웃처리
        document.location.href="${pageContext.request.contextPath}/penta/sso/logout.jsp";
    } 
    else if ($.cookie('penta_sso') == "Y" && $.cookie('penta_isSession') != "Y" && ${sessionUserVOFlag}) {
    	
    	//쿠키삭제
    	$.cookie('penta_sso',null); 
    	$.cookie('penta_isSession',null); 
    	    	
        // 로그아웃처리(session timeout)
        document.location.href="${pageContext.request.contextPath}/penta/sso/logout.jsp";
    } 
    else if ($.cookie('penta_sso') != "Y" && !${sessionUserVOFlag}) {
    	
    	//쿠키삭제
    	$.cookie('penta_sso',null); 
    	$.cookie('penta_isSession',null); 
    	    	
        // 로그아웃처리
        document.location.href="${pageContext.request.contextPath}/penta/sso/logout.jsp";
    } 
    else if ($.cookie('penta_sso') == "Y" && $.cookie('penta_isSession') == "Y" && !${sessionUserVOFlag}) {
    	    	
        // 세션이 존재하는데 튕기면 권한이 없는것임.. 메인화면으로 redirect
        document.location.href="${pageContext.request.contextPath}/smtmng/main.ez";
    } 
    else {
    	
    	//쿠키삭제
    	$.cookie('penta_sso',null); 
    	$.cookie('penta_isSession',null); 
    	
        document.location.href="${pageContext.request.contextPath}/penta/sso/business.jsp?returnURL=" + returnURL;
    }
</script>
</c:if>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

/**
 * 로그인 체크
 * 메소드명 : loginCheck
 * 작성일 : 2018. 8. 19. 오후 2:43:38
 * 작성자 : 김승범
 * @return
 * @throws Exception
 */
function loginCheck() {
	 	 
	//아이디 체크
	var id = $.trim($("#userID").val());
	
	if(id.length < 1) {
		alert("아이디를 입력하세요.");
		return false;
	}
	
	//패스워드 체크
	var pw = $.trim($("#userPW").val());
	
	if(pw.length < 1) {
		alert("패스워드를 입력하세요.");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
<div id="wrap">

	<main id="main">
	
		<section class="login-wrap">
			<h2>제주시 스마트청사안내 관리자</h2>
			
			<div class="login-box">
				<form method="post" action="/smtmng/actionTempLogin.ez" onsubmit="return loginCheck();">
					<div class="int-box">
						<label for="userID">아이디(전체관리자:administrator, 컨텐츠관리자:vlvl1002)</label>
						<input id="userID" name="tempId" type="text" placeholder="아이디를 입력해주세요." value="">
					</div>
					<div class="int-box">
						<label for="userPW">비밀번호</label>
						<input id="userPW" name="tempPwd" type="password" placeholder="비밀번호를 입력해주세요." value="">
					</div>
					<!-- <div class="int-check">
						<label>
							<input type="checkbox"> 아이디저장
						</label>
					</div> -->
					<div class="login-btn"><button type="submit">로그인</button></div>
				</form>
			</div>
			
			<p class="copy">Copyright 2019. NEXTEZ All Rights Reserved.</p>
            <p class="copy margin">크롬 브라우저에 최적화 되어있습니다.</p>
            
		</section> 
		<!--//login-wrap-->
		
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->
</body>
</html>