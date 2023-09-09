<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c"           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"          uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"          uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring"      uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"        uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"         uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ taglib prefix="un"          uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<un:useConstants var="Constant" className="nextez.com.util.Constant" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 하위버전(ie8이하) 대응에 따른 추가 (주석 그대로 추가) -->
<!--[if lt IE 9]>
<script src="../../../js/comm/html5shiv.js"></script>
<![endif]-->    
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="author" content="(주)넥스트이지">
<meta name="description" content="제주시 스마트 청사안내">
<title>제주시 청사안내</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jejusi/frame.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jejusi/jejusi_building.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">

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
    

    
<script language="javascript">

//-- bc 건물, fc 층
function fn_gomap(bc,fc){
    
    //alert(bc +", "+ fc);
    location.href="/jejusiBuilding/office.ez?bc="+bc+"&fc="+fc;
    
}

function fn_gomap02(bc,fc,dpt){
    
    //alert(bc +", "+ fc);
    location.href="/jejusiBuilding/office.ez?bc="+bc+"&fc="+fc+"&dpt="+dpt;
    
}

function fn_gomapSel(){
    
	var bc = $("#gomap_sel").val();
    var fc = $("#gomap_floor").val();
    
    //alert(bc +", "+ fc);
    
    if( bc == "main" ){
    	location.href="/jejusiBuilding/main.ez";
    }else{
        location.href="/jejusiBuilding/office.ez?bc="+bc+"&fc="+fc;    	
    }
}

function fn_changeSelGomap(){
	var bc = $("#gomap_sel").val();
	var bc_option = $("#floor_"+bc).html();
	$("#gomap_floor").empty();
    $("#gomap_floor").append(bc_option);
}


$(document).ready(function(){
       
    
});
</script>
 
<div style="display:none;">
    <div id="floor_main" >   
            <option value="1">1층</option>  
    </div>              
	<c:forEach items="${OB}" var="item" varStatus="status"> 
	    <div id="floor_${item.buildingCode}" >  
		    <c:forEach var="i" begin="1" end="${item.floorUpCnt}">
		        <option value="${i}">${i}층</option> 
		    </c:forEach> 
		</div>                                                        
	</c:forEach>
</div>       
                         
    