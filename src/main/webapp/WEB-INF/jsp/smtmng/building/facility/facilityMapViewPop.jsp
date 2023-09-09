<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="nextez.com.vo.SingletonData" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="format-detection" content="telephone=no">
<meta name="author" content="(주)넥스트이지">
<meta name="description" content="제주시 스마트 청사안내">
<title>제주시 스마트 청사안내</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/comm.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/frame.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/contents.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/comm_style.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/common.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">




<!-- script -->
<script src="${pageContext.request.contextPath}/js/comm/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery-ui-1.12.1.js"></script>
<script src="${pageContext.request.contextPath}/js/kiosk/html_comm.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>


<style>
#mydiv {
  position: absolute;
  cursor: move;
  z-index: 9;
  left:100px;
  top:160px;
}
</style>

<script>
//위치 적용
function applyPoint() {
	
	var pointX = $("#pointX").val();
	var pointY = $("#pointY").val();
	
	//부모창에 함수가 있으면 실행
	if(typeof(opener.applyPoint) == "function") {
		opener.applyPoint(pointX, pointY);
		self.close();
	}
	else {
		alert("호출페이지에 함수가 없습니다.");
	}
}

//건물코드 변경
function changeBuildingCode() {
	$("select[name='floorCode']").val("");
}

//층코드 변경
function changeFloorCode() {
	//건물코드
	var buildingCode = $("select[name='buildingCode']").val();
	
	//층코드
	var floorCode = $("select[name='floorCode']").val();
	
	//시설명
	var facilityName = "${facilityName}";
	
	//위치정보
	var pointX = $("#pointX").val();
	var pointY = $("#pointY").val();
	
	if(buildingCode != "" && floorCode != "") {
		
		var facilityMapViewPopSrc = "<c:url value='/smtmng/building/facility/facilityMapViewPop.ez'/>?buildingCode=" + buildingCode;
		facilityMapViewPopSrc += "&floorCode=" + floorCode;
		facilityMapViewPopSrc += "&pointX=" + pointX;
		facilityMapViewPopSrc += "&pointY=" + pointY;
		facilityMapViewPopSrc += "&facilityName=" + facilityName;
		
		document.location.href = facilityMapViewPopSrc;
	}
}
</script>
</head>

<body>
<div id="wrap" style="height:800px;">
	
	<!--Contents 영역-->
	<main id="main_wrap">
		<section id="container_wrap">
		
			<div class="content_area" style="margin:0;padding:5px;">  		
				<div class="container">
					<div id="contents"> 
						<!--실제 컨텐츠-->
						
						<form name="map_search_form" id="map_search_form" method="get">
						<input type="hidden" name="sFacilityCode" value="${searchVO.sFacilityCode}">
						
						<div>
	                        <select name="buildingCode" onchange="changeBuildingCode();">
	                        	<option value="">==건물선택==</option>
	                        	<c:forEach var="item" items="${buildingCodeList}">                        	
	                        		<option value="${item.code}" <c:if test="${item.code == buildingCode}">selected</c:if>>${item.name}</option>
	                        	</c:forEach>                    	
	                        </select>
	                    	<select name="floorCode" onchange="changeFloorCode();">
	                    		<option value="">==층선택==</option>   
	                        	<c:forEach var="item" items="${floorCodeList}">                        	
	                        		<option value="${item.code}" <c:if test="${item.code == floorCode}">selected</c:if>>${item.name}</option>
	                        	</c:forEach>                    		
	                        </select>
								<button type="button" class="btn black sm" style="font-size:13px;" onclick="self.close();">취소</button>
								<button type="button" class="btn blue sm" style="font-size:13px;" onclick="applyPoint();">저장</button>
                        </div>
                        
                        </form>
						
						<c:if test="${not empty floorImgPath}">
							<div style="font-size:16px;padding:5px;">
								<img src="/images/kiosk/icon/location_icon4.png"> 아이콘을 드래그하여 위치를 정하세요. 
								( 
								X : <input type="text" id="pointX" value="${pointX}" style="text-align:center;width:60px;">
								&nbsp;&nbsp;
								Y : <input type="text" id="pointY" value="${pointY}" style="text-align:center;width:60px;"> 
								&nbsp;&nbsp;
								<button type="button" class="btn sm" style="font-size:13px;" onclick="initPosition($(this).prev().prev().val(), $(this).prev().val());">좌표이동</button>
								)
							</div>
						</c:if>
						
						<c:if test="${not empty floorImgPath}">
						
						<!--
						<div id="mydiv">
						  	<div id="mydivheader"><img src="/images/kiosk/icon/location_icon4.png"></div>
						</div>
						-->
						
						<div id="mydiv" class="name_box">
		               		<span>${facilityName}</span>
		                </div>
								
								
						</c:if>
						
						<div class="office_info_area" style="padding-top:5px;">
							<div class="office_map">
								<c:if test="${not empty floorImgPath}">
								<img src="${floorImgPath}" alt="" id="mapImg">
								</c:if>
								
								<c:if test="${empty floorImgPath}">
								<div style="font-size:20px;font-weight:bold;padding:30px;">등록된 이미지가 없습니다. 건물 및 층을 다시 선택해주세요.</div>
								<div id="pointX" style="display:none;">${pointX}</div>
								<div id="pointY" style="display:none;">${pointY}</div>
								</c:if>
							</div>
						</div>	
							
						<!--//실제 컨텐츠--> 
					</div>
				</div>
			</div>
		</section>
	</main>
	<!--//Contents 영역--> 
</div>

<script>


function dragElement(elmnt) {
	
	var pos1 = 0;
	var pos2 = 0;
	var pos3 = 0;
	var pos4 = 0;
	
	//맵 이미지 좌측상단 offset 값
	var mapOffsetTop = $("#mapImg").offset().top;
	var mapOffsetLeft = $("#mapImg").offset().left;
	var mapWidth = $("#mapImg").width();
	var mapHeight = $("#mapImg").height();
	
	//아이콘 사이즈
	var iconWidth = $("#mydiv").width();
	var iconHeight = $("#mydiv").height();
	
	if (document.getElementById(elmnt.id + "header")) {
	  	/* if present, the header is where you move the DIV from:*/
	  	document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
	} 
	else {
	  	/* otherwise, move the DIV from anywhere inside the DIV:*/
	  	elmnt.onmousedown = dragMouseDown;
	}
	
	function dragMouseDown(e) {
	  	
		e = e || window.event;
	  	e.preventDefault();
	  	
	  	// get the mouse cursor position at startup:
	  	pos3 = e.clientX;
	  	pos4 = e.clientY;
	  	document.onmouseup = closeDragElement;
	  	
	  	// call a function whenever the cursor moves:
	  	document.onmousemove = elementDrag;
	}
	
	function elementDrag(e) {
	  	
		e = e || window.event;
	  	e.preventDefault();
	  	
	  	// calculate the new cursor position:
	  	pos1 = pos3 - e.clientX;
	  	pos2 = pos4 - e.clientY;
	  	pos3 = e.clientX;
	  	pos4 = e.clientY;
	  	
	  	//이미지 범위를 넘어가면 위치를 변경하지 않는다.
	  	if(elmnt.offsetTop - pos2 >= mapOffsetTop && elmnt.offsetTop - pos2 + iconHeight <= mapOffsetTop + mapHeight) {
	  		// set the element's new position:
		  	elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
	  	}
	  	
	  	//이미지 범위를 넘어가면 위치를 변경하지 않는다.
	  	if(elmnt.offsetLeft - pos1 >= mapOffsetLeft && elmnt.offsetLeft - pos1 + iconWidth <= mapOffsetLeft + mapWidth) {
	  		// set the element's new position:
		  	elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
	  	}
	  	
	  	//이미지기준 아이콘 위치
	  	var iconLeft = elmnt.style.left;
	  	iconLeft = iconLeft.replace("px","");
	  	iconLeft = eval(iconLeft);	  	
	  	
	  	var iconTop = elmnt.style.top;
	  	iconTop = iconTop.replace("px","");
	  	iconTop = eval(iconTop);
	  	
	  	var relativePosLeft = Math.round(iconLeft - mapOffsetLeft);
	  	var relativePosTop = Math.round(iconTop - mapOffsetTop);
	  	
	  	$("#pointX").val(relativePosLeft);
	  	$("#pointY").val(relativePosTop);
	}
	
	function closeDragElement() {
	 	
		/* stop moving when mouse button is released:*/
	  	document.onmouseup = null;
	  	document.onmousemove = null;
	  	
	  	var iconLeft = elmnt.style.left;
	  	iconLeft = iconLeft.replace("px","");
	  	iconLeft = eval(iconLeft);	  	
	  	
	  	var iconTop = elmnt.style.top;
	  	iconTop = iconTop.replace("px","");
	  	iconTop = eval(iconTop);
	  	
	  	//이미지기준 아이콘 위치
	  	//var relativePosLeft = Math.round(iconLeft - mapOffsetLeft);
	  	//var relativePosTop = Math.round(iconTop - mapOffsetTop);
	  	
	  	//값 세팅
		//$("#pointX").val(relativePosLeft);
		//$("#pointY").val(relativePosTop);
	}
}

//위치값이 있을 경우 해당 위치로 이동시킨다.
function initPosition(pointX, pointY) {
	
	var pointX = eval(pointX);
	var pointY = eval(pointY);
	
	//맵 이미지 좌측상단 offset 값
	var mapOffsetTop = $("#mapImg").offset().top;
	var mapOffsetLeft = $("#mapImg").offset().left;
	
	$("#mydiv").css("left", pointX + mapOffsetLeft + "px");
	$("#mydiv").css("top", pointY + mapOffsetTop + "px");
	
}


<c:if test="${not empty floorImgPath}">
//Make the DIV element draggagle:
dragElement(document.getElementById("mydiv"));

//초기위치 설정
initPosition('${pointX}','${pointY}');
</c:if>


</script>
</body>
</html>