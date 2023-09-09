<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" 			uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ taglib prefix="un" uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm" var="nowDate" />

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="author" content="(주)넥스트이지">
	<meta name="description" content="제주시 스마트 청사안내">
	<title>제주시 스마트 청사안내 </title>
	
	<!-- css -->
	<link rel="stylesheet" href="/css/comm/jquery-ui-1.12.1.css">
	<!-- css -->
	
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>"> 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/frame.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/contents.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">  
	 
	<!--ie9 미만-->
	<!--[if lt IE 9]>
	<script src="../../js/html5shiv.js"></script>
	<script src="../../js/IE9.js"></script>
	<![endif]-->
 
           
	<!-- script -->
	<script type="text/javascript" src="<c:url value='/js/comm/jquery-1.11.1.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/js/comm/jquery-ui-1.12.1.js'/>"></script>
	<!-- script -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/common.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/html_comm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/tts_qrcode.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/kiosk/pathFinder.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>

	<!-- jQuery Modal -->
	<link rel="stylesheet" type="text/css" href="/css/comm/jquery.modal.min.css" />
    <script type="text/javascript" src="/js/comm/jquery.modal.min.js" ></script> 
