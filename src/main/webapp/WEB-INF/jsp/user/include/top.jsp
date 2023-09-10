<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ taglib prefix="un" 		uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="유비즈정보기술">
<meta name="format-detection" content="telephone=no">

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/jquery-ui-1.12.1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/comm_default.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/comm_style.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/frame.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">

<!--ie9 미만-->
<!--[if lt IE 9]>
<script src="../../js/html5shiv.js"></script>
<script src="../../js/IE9.js"></script>
<![endif]-->

<!-- script -->
<script src="${pageContext.request.contextPath}/js/comm/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery-ui-1.12.1.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/html_comm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
<script src="${pageContext.request.contextPath}/js/admin/html_style.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common/multiFile.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
