<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c"           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"          uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"          uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring"      uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"        uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"         uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>

<%@ taglib prefix="un"          uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<head>
 
    

    <!-- css -->
    <link rel="stylesheet" href="/css/comm/jquery-ui-1.12.1.css">
    <!-- css -->
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/mobile.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
    
     
    <!--ie9 미만-->
    <!--[if lt IE 9]>
    <script src="../../js/html5shiv.js"></script>
    <script src="../../js/IE9.js"></script>
    <![endif]-->
    
    
 
<c:set var="gaCode" value="${pathSVO.gaCode}"/>
 
<%
String gaCode       = (String)pageContext.getAttribute("gaCode");
String browser      = request.getHeader("User-Agent");
String kioskName   = "본관";
String kioskCode    = "k01";
String kioskFcCode = "B01_F01_G15_001"; /** kiosk facility code*/
String kioskCodeX  = "860";
String kioskCodeY  = "220";

switch(gaCode){
	case "B02_F01_G15_001": kioskCode    = "k02"; break;
	case "B03_F01_G15_001": kioskCode    = "k03"; break;
	case "B05_F01_G15_001": kioskCode    = "k04"; break;
	case "B06_F01_G15_001": kioskCode    = "k05"; break;
	case "B01_F01_G15_002": kioskCode    = "k06"; break;
	case "B10_F01_G15_001": kioskCode    = "k07"; break;
}

if ( (browser != null && browser.indexOf("k01") != -1) || kioskCode == "k01" ) { kioskCode = "k01"; kioskFcCode = "B01_F01_G15_001"; kioskCodeX = "860"; kioskCodeY = "220"; kioskName = "본관";  } //본관
if ( (browser != null && browser.indexOf("k02") != -1) || kioskCode == "k02" ) { kioskCode = "k02"; kioskFcCode = "B02_F01_G15_001"; kioskCodeX = "460"; kioskCodeY = "220"; kioskName = "1별관";    } //1별관
if ( (browser != null && browser.indexOf("k03") != -1) || kioskCode == "k03" ) { kioskCode = "k03"; kioskFcCode = "B03_F01_G15_001"; kioskCodeX = "260"; kioskCodeY = "220"; kioskName = "2별관";    } //2별관
if ( (browser != null && browser.indexOf("k04") != -1) || kioskCode == "k04" ) { kioskCode = "k04"; kioskFcCode = "B05_F01_G15_001"; kioskCodeX = "160"; kioskCodeY = "220"; kioskName = "4별관";    } //4별관
if ( (browser != null && browser.indexOf("k05") != -1) || kioskCode == "k05" ) { kioskCode = "k05"; kioskFcCode = "B06_F01_G15_001"; kioskCodeX = "1190"; kioskCodeY = "360"; kioskName = "5별관";    } //5별관
if ( (browser != null && browser.indexOf("k06") != -1) || kioskCode == "k06" ) { kioskCode = "k06"; kioskFcCode = "B01_F01_G15_002"; kioskCodeX = "860"; kioskCodeY = "220"; kioskName = "본관중앙";    } //본관중앙
if ( (browser != null && browser.indexOf("k07") != -1) || kioskCode == "k07" ) { kioskCode = "k07"; kioskFcCode = "B10_F01_G15_001"; kioskCodeX = "860"; kioskCodeY = "220"; kioskName = "6별관";    } //6별관

String kioskCodeB = kioskFcCode.substring(0, 3);
String kioskCodeF = kioskFcCode.substring(6, 7); 
%>
<c:set var="browser" value="<%=browser %>"/>
<c:set var="kioskName" value="<%=kioskName %>"/>
<c:set var="kioskCode" value="<%=kioskCode %>"/>
<c:set var="kioskCodeX" value="<%=kioskCodeX %>"/>
<c:set var="kioskCodeY" value="<%=kioskCodeY %>"/>
<c:set var="kioskFcCode" value="<%=kioskFcCode %>"/>
<c:set var="kioskCodeB" value="<%=kioskCodeB %>"/>
<c:set var="kioskCodeF" value="<%=kioskCodeF %>"/>      
        
          
    <!-- script -->
    <script type="text/javascript" src="<c:url value='/js/comm/jquery-1.11.1.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/js/comm/jquery-ui-1.12.1.js'/>"></script>
    <!-- script -->
    <script type="text/javascript" src="/js/common/common.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    <script type="text/javascript" src="/js/kiosk/html_comm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    <script type="text/javascript" src="/js/kiosk/tts_qrcode.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>
    <script type="text/javascript" src="/js/kiosk/pathFinder.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>

    <!-- jQuery Modal -->
    <link rel="stylesheet" type="text/css" href="/css/comm/jquery.modal.min.css" />
    <script type="text/javascript" src="<c:url value='/js/comm/jquery.modal.min.js'/>" ></script> 
    
    


