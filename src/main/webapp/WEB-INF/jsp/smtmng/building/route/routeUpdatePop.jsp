<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 경로정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateRoute() {
	
	// confirm.ins=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/route/routeUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					document.location.reload();
				}
			}
		});
	}
}

//이동경로 보기
function routeMapViewPop() {
	
	//경로타입
	var pathType = "${routeVO.pathType}";
	
	//도착건물코드를 구한다.
	var buildingCode = "${arriveFacilityVO.buildingCode}";
	
	//도착층코드를 구한다.
	var floorCode = "${arriveFacilityVO.floorCode}";
	
	//경로데이터 값을 구한다.
	var mapInfo = $("textarea[name=mapInfo]").val();
	
	//출발시설 코드를 구한다.
	var startFacilityCode = "${routeVO.startFacilityCode}";
	
	//도착시설 코드를 구한다.
	var arriveFacilityCode = "${routeVO.arriveFacilityCode}";
	
	if(buildingCode == "" || floorCode == "") {
		
		alert("도착시설 정보를 입력해주세요.");
		return false;
	}
	
	var routeMapViewPopSrc = "<c:url value='/smtmng/building/route/routeMapViewPop.ez'/>";
	routeMapViewPopSrc += "?pathType=" + pathType;
	routeMapViewPopSrc += "&buildingCode=" + buildingCode;
	routeMapViewPopSrc += "&floorCode=" + floorCode;
	routeMapViewPopSrc += "&mapInfo=" + mapInfo;
	routeMapViewPopSrc += "&startFacilityCode=" + startFacilityCode;
	routeMapViewPopSrc += "&arriveFacilityCode=" + arriveFacilityCode;
	
	window.open(routeMapViewPopSrc, "routeMapViewPop", 'resizable=yes,scrollbars=yes,width=1550,height=860');
}

//이동경로 팝업으로 부터 호출되는 경로데이터 적용 함수
function applyPath(pathInfo) {
	
	$("textarea[name=mapInfo]").val(pathInfo);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">경로정보 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
        		    
    <form name="update_form" id="update_form" method="post" onsubmit="updateRoute();return false;">
        
    <input type="hidden" name="routeCode" value="${routeVO.routeCode}">
    <input type="hidden" name="pathType" value="${routeVO.pathType}">
    <input type="hidden" name="moveType" value="${routeVO.moveType}">
    <input type="hidden" name="startFacilityCode" value="${routeVO.startFacilityCode}">
    <input type="hidden" name="arriveFacilityCode" value="${routeVO.arriveFacilityCode}">
    
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 20%">
                <col style="width: 30%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            경로코드
                        </div>    
                    </th>
                    <td colspan="3" style="color:blue;">
                    	${routeVO.routeCode}
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            경로타입
                        </div>                    	
                    </th>
                    <td>${pathNameMap.get(routeVO.pathType)}</td>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            이동타입
                        </div>  
                    </th>
                    <td>${moveNameMap.get(routeVO.moveType)}</td>
                </tr>
                <tr id="startFacilityTr" id="startFacilityTr" style="display:none;">
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            출발시설
                        </div>    
                    </th>
                    <td colspan="3">${routeVO.startFacilityName} <span style="color:blue;">(${routeVO.startFacilityCode})</span></td>
                </tr>
                <tr id="arriveFacilityTr" style="display:none;">
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            도착시설
                        </div>    
                    </th>
                    <td colspan="3">${routeVO.arriveFacilityName} <span style="color:blue;">(${routeVO.arriveFacilityCode})</span></td>
                </tr>
                <tr id="routeDataTr" style="display:none;">                    
                    <th>경로데이터</th>
                    <td colspan="3">
                    	<div style="padding-bottom:5px;color:blue;">
                    		* x,y x,y x,y ... 형태로 입력되어야 합니다.
                    	</div>
                    	
                    	<textarea name="mapInfo" style="width:100%;height:100px;">${routeVO.mapInfo}</textarea>
                    	
                    	<button type="button" class="btn green sm" onclick="routeMapViewPop();">이동경로보기</button>
                    </td>
                </tr>
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">수정</button>
        <button type="button" class="btn" onclick="self.close();">닫기</button>
    </div>
	
		<!-- 
			$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
			마지막은 다른 데이터로 변경하면 됨.
		-->
   		<input type="hidden" name="parsingPrevent" value="">
            
	</form>
    
</div> <!--//win-popup-->

<script>
$(function() {

	<c:if test="${searchVO.sPathType == 'O'}">
		//건물외부일 경우 출발시설 검색 부분은 숨겨져야 한다.
		$("#startFacilityTr").hide();
	</c:if>
	
	<c:choose>
		<c:when test="${searchVO.sMoveType == 'P'}">
			//이동타입이 경로이동인 경우에는 출발시설, 도착시설 보임
			$("#startFacilityTr").show();
			$("#arriveFacilityTr").show();
			
			//이동타입이 경로이동인 경우에만 경로데이터 textarea 활성화
			$("#routeDataTr").show();	
		</c:when>		
		<c:when test="${empty searchVO.sMoveType}">
			//이동타입이 공백인 경우 출발시설, 도착시설 숨김
			$("#startFacilityTr").hide();
			$("#arriveFacilityTr").hide();
			
			//이동타입이 경로이동이 아닌 경우 경로데이터 textarea 숨김
			$("#routeDataTr").hide();
			$("textarea[name='mapInfo']").val("");
		</c:when>		
		<c:otherwise>
			//이동타입이 엘리베이터, 계단, 계단+엘리베이터인 경우에는 출발시설은 숨기고, 도착시설은 보임
			$("#startFacilityTr").hide();
			$("#arriveFacilityTr").show();
			
			//이동타입이 경로이동이 아닌 경우 경로데이터 textarea 숨김
			$("#routeDataTr").hide();
			$("textarea[name='mapInfo']").val("");
		</c:otherwise>
		
	</c:choose>	
});
</script>
</body>
</html>