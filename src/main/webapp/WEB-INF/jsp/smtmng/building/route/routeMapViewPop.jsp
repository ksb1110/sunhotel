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

<script src="${pageContext.request.contextPath}/js/smtmng/routeMapViewPop.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>

<c:set var="positionX" value="330"/>
<c:set var="positionY" value="20"/>

<style>
#mydiv {
  position: absolute;
  z-index: 9;
  left:${positionX}px;
  top:${positionY}px;
}

#mydivheader {
  cursor: move;
  z-index: 10;
}

.circle {
	width:18px;
	height:18px;
	border-radius:50%;
	background:#000000;
	color:#ffffff;
	font-size:5px;
	text-align:center;
	position:absolute;
}

.circle2 {
	width:18px;
	height:18px;
	border-radius:50%;
	background:#000000;
	color:#ffffff;
	font-size:5px;
	text-align:center;
}

.map_svg .path_line2 {
fill-opacity: 0;
stroke: #ff4311;
stroke-width: 6;
stroke-linejoin: round;	
stroke-linecap: round;	
/*외곽선을 칠하는데 사용되는 dashes와 gaps의 패턴을 정의한다.*/
/*
stroke-dasharray: 1200;
*/

/*dasharray의 offset 정의*/
/*
stroke-dashoffset: 1200;
*/

/*
animation-name: draw;
*/

/*애니메이션의 이름*/
/*
animation-duration: 3s;
*/

/*한 싸이클의 애니메이션이 얼마에 걸쳐 일어날지 지정합니다.*/
/*
animation-iteration-count: 1;
*/
/*애니메이션이 몇 번 반복될지 지정합니다. infinite로 지정하여 무한히 반복할 수 있습니다.*/
/*
animation-timing-function: linear;
*/
/*중간 상태들의 전환을 어떤 시간간격으로 진행할지 지정합니다.*/
/*
animation-fill-mode: forwards;	
*/

/*재생 이전이나 이후에 애니메이션 효과를 표시할지 여부를 지정합니다.
none : 기본 동작이 변경되지 않습니다.
forwards : 애니메이션이 완료된 후에도 마지막 키 프레임에 정의된 최종 속성 값이 유지됩니다.
backwards : animation-delay에 정의된 기간 중 애니메이션을 표시하기 전에 첫 번째 키 프레임에 정의된 시작 속성 값이 적용됩니다.
both : 앞으로 및 뒤로 채우기 모드가 모두 적용됩니다.
*/	
}
</style>

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
						
						<div style="font-size:20px;">&lt;${mapTitle}&gt;</div>
						
						<c:if test="${not empty mapImagePath}">
							<div style="font-size:16px;padding:5px;">
								<img src="/images/kiosk/icon/pathArrow.png"> 아이콘을 이용하여 경로 포인트를 설정하세요.
								<button type="button" class="btn blue sm" style="font-size:13px;" onclick="applyPath();">저장</button>
								<button type="button" class="btn black sm" style="font-size:13px;" onclick="self.close();">취소</button>
								(* 드래그가 안되는 경우 새로고침을 해주세요. <button type="button" class="btn red sm" style="font-size:13px;" onclick="document.location.reload();">새로고침</button>)
							</div>
						</c:if>
						
						
						
						<div style="width:300px;position:absolute;z-index:999;opacity:0.5;">
							<table class="table center" style="border:1px solid red;">
								<colgroup>
									<col style="width: 50px;">
				                    <col style="width: 130px;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>순서</th>
										<th>X,Y</th>
										<th>기능</th>
									</tr>
								</thead>
								<tbody id="posTbody">
								
								</tbody>
							</table>
						</div>
						
						<!-- 원본 핀 -->
						<!-- <div class="circle" id="defaultPin" style="display:none;"></div> -->
						
						
						
						<c:if test="${not empty mapImagePath}">
							<div id="mydiv" style="z-index:999;">
							  	<div><img src="/images/kiosk/icon/pathArrow.png"></div>
							  	<div style="position:absolute;left:30px;top:-6px;width:310px;">
							  		<div>
							  			<button type="button" class="btn green sm" id="mydivheader" style="font-size:13px;font-weight:normal;">드래그</button>
							  			<button type="button" class="btn black sm" style="font-size:13px;font-weight:normal;" onclick="selectPos();">포인트생성</button>
							  			<br>
							  			<input type="text" id="positionButtonX" value="${positionX}" style="text-align:center;width:50px;">
							  			<input type="text" id="positionButtonY" value="${positionY}" style="text-align:center;width:50px;">
							  			<button type="button" class="btn sm" style="font-size:13px;" onclick="initPosition($('#mydiv'), $(this).prev().prev().val(), $(this).prev().val());">좌표이동</button>
							  			
							  		</div>
							  		<!--
							  		<div>
								  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn blue sm" style="font-size:13px;font-weight:normal;" onclick="moveTop();">&uarr;</button>
							  		</div>
							  		<div>
								  		<button type="button" class="btn blue sm" style="font-size:13px;font-weight:normal;" onclick="moveLeft();">&larr;</button>
								  		<button type="button" class="btn blue sm" style="font-size:13px;font-weight:normal;" onclick="moveRight();">&rarr;</button>
							  			<button type="button" class="btn black sm" style="font-size:13px;font-weight:normal;" onclick="selectPos();">선택</button>
							  		</div>
							  		<div>
								  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn blue sm" style="font-size:13px;font-weight:normal;" onclick="moveBottom();">&darr;</button>
							  		</div>
							  		-->
							  	</div>
							</div>
						</c:if>
						
						<div class="office_info_area" style="padding-top:5px;">
							<div class="office_map">
								<c:if test="${not empty mapImagePath}">
									<div class="office_map"><img src="${mapImagePath}" alt="" id="mapImg"></div>
									
									<div class="map_svg_area">
	                                    <svg class="map_svg" viewBox="0 -5 1520 920">
	                                    
	                                    </svg>
	                                </div> 
								</c:if>
								
								<c:if test="${empty mapImagePath}">
									<div style="font-size:20px;font-weight:bold;padding:30px;">등록된 이미지가 없습니다. 건물 및 층을 다시 선택해주세요.</div>
								</c:if>
							</div>
							<ul class="department_name">
							</ul>
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

//시설정보 셋팅 (출발시설 혹은 도착시설)
function facilityPosSet(pointX, pointY, facilityName) {
	
	var pin = "<div id='facility_" + pointX + "_" + pointY + "' class='name_box' style='position:absolute;'>";
	pin += "<span>" + facilityName + "</span>";
	pin += "</div>";
	
	$("body").append(pin);
	
	//위치 셋팅
	initPosition($("#facility_"+ pointX + "_" + pointY),pointX,pointY);
}

<c:if test="${not empty mapImagePath}">

	//Make the DIV element draggagle:
	dragElement(document.getElementById("mydiv"));
	
	//초기위치 설정
	initPosition($("#mydiv"),"${positionX}","${positionY}");
	
	<c:if test="${not empty mapInfo}">
	//맵정보를 파라메터로 가져온 경우 그려진 상태여야 한다.
	setMapInfo("${mapInfo}");
	</c:if>
	
	<c:if test="${not empty startFacilityPointX && not empty startFacilityPointY}">
	//출발시설 정보가 있으면 출발시설을 화면에 표시한다.
	facilityPosSet("${startFacilityPointX}", "${startFacilityPointY}", "${startFacilityName}");
	</c:if>
	
	<c:if test="${not empty arriveFacilityPointX && not empty arriveFacilityPointY}">
	//출발시설 정보가 있으면 출발시설을 화면에 표시한다.
	facilityPosSet("${arriveFacilityPointX}", "${arriveFacilityPointY}", "${arriveFacilityName}");
	</c:if>

</c:if>

</script>
</body>
</html>