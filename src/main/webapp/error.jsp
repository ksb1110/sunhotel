<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="<c:url value="/css/res/common.css"/>">

</head>
<body>
	
	<div style="font-weight:bold;font-color:red;text-align:center;padding-top:200px;">
	페이지에 오류가 발생하였습니다.
	<br>
	${param.returnMsg}
	</div>
	
	<div style="text-align:center;padding-top:50px;">
		<a href="<c:url value="/"/>">[메인페이지로 이동]</a>
		&nbsp;&nbsp;&nbsp;
		<a href="#" onclick="self.close();">[닫기]</a>
	</div>
	
</body>
</html>