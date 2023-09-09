<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 경로정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertRoute() {
	
	//경로타입
	var pathType = $.trim($("select[name=pathType]").val());
	if(pathType.length < 1) {
		alert("경로타입을 선택해주세요.");
		$("select[name=pathType]").focus();
		
		return false;
	}
	
	//이동타입
	var moveType = $.trim($("select[name=moveType]").val());
	if(moveType.length < 1) {
		alert("이동타입을 선택해주세요.");
		$("select[name=moveType]").focus();
		
		return false;
	}
	
	
	<c:if test="${searchVO.sMoveType == 'P'}">
	//이동타입이 경로이동인 경우 필수여부 체크
	//출발시설
	var startFacilityCode = $.trim($("select[name=startFacilityCode]").val());
	if(startFacilityCode.length < 1) {
		alert("출발시설을 선택해주세요.");
		$("select[name=startFacilityCode]").focus();
		
		return false;
	}
	</c:if>
	
	<c:if test="${searchVO.sMoveType == 'P' || searchVO.sMoveType == 'E' || searchVO.sMoveType == 'F' || searchVO.sMoveType == 'D'}"> 
	//이동타입이 경로이동, 계단, 엘리베이터, 계단+엘리베이터인 경우 필수여부 체크
	//도착시설
	var arriveFacilityCode = $.trim($("select[name=arriveFacilityCode]").val());
	if(arriveFacilityCode.length < 1) {
		alert("도착시설을 선택해주세요.");
		$("select[name=arriveFacilityCode]").focus();
		
		return false;
	}
	</c:if>
	
	// confirm.ins=등록하시겠습니까?
	if(confirm("<spring:message code='confirm.ins'/>")){
		
		var parameters = new FormData($('#insert_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/route/routeInsert.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}

//시설명 검색
function searchFacilityCodeList(startArriveGubun, isSearch) {
	
	//건물
	var sBuildingCode = $("select[name='s" + startArriveGubun + "BuildingCode']").val();
	
	//층
	var sFloorCode = $("select[name='s" + startArriveGubun + "FloorCode']").val();
	
	//시설구분
	var sFacilityGubun = $("select[name='s" + startArriveGubun + "FacilityGubun']").val();
	
	//검색조건 셋팅
	$("form[name='search_facility_form'] input[name='sBuildingCode']").val(sBuildingCode);
	$("form[name='search_facility_form'] input[name='sFloorCode']").val(sFloorCode);
	$("form[name='search_facility_form'] input[name='sFacilityGubun']").val(sFacilityGubun);
	
	
	//검색조건이 없는 경우 시설명을 초기화시켜준다.
	if(sBuildingCode == "" && sFloorCode == "" && sFacilityGubun == "") {		
		
		var html_empty_options = "<option value='''>== 시설명 ==</option>";
		
		$("select[name='" + startArriveGubun.toLowerCase() + "FacilityCode']").html(html_empty_options);
		
		return;
	}
	
	//선택된 시설코드
	var sFacilityCode = "";
	
	if(startArriveGubun == "Start") {
		
		sFacilityCode = "${searchVO.sStartFacilityCode}";
	}
	else if(startArriveGubun == "Arrive") {
		
		sFacilityCode = "${searchVO.sArriveFacilityCode}";
	}
	
	//사용자가 검색정보를 직접 변경한 경우는 시설명이 초기화 되어야 한다.
	if(isSearch == true) {
		
		sFacilityCode = "";
	}
	
	
	var parameters = new FormData($('#search_facility_form')[0]);
	
	$.ajax({
		type:"post", 
		dataType:"json",
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		async:false,
		url:"<c:url value='/smtmng/building/route/searchFacilityCodeList.ezax'/>",
		data:parameters ,
		success:function(data) {
			
			if(data.result == "${Constant.FLAG_N}") {
				
				alert(data.errorMessage);
			} 
			else {
				
				var html_options = "<option value='''>== 시설명 ==</option>";
				
				if(data.facilityList.length > 0) {
					
					$.each(data.facilityList,function(i,item) {
						
						var selected = "";
						if(item.facilityCode == sFacilityCode) {
						
							selected = "selected";
						}
						
						html_options += "<option value='" + item.facilityCode + "' " + selected + ">" + item.facilityName + "</option>";
						
					});
				}
				
				$("select[name='" + startArriveGubun.toLowerCase() + "FacilityCode']").html(html_options);
			}
		}
	});
}

//층 검색
function searchFloorList(buildingCode) {
	
	$("form[name='search_floor_form'] input[name='sBuildingCode']").val(buildingCode);
	
	var parameters = new FormData($('#search_floor_form')[0]);
	
	$.ajax({
		type:"post", 
		dataType:"json",
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		async:false,
		url:"<c:url value='/smtmng/building/route/searchFloorCodeList.ezax'/>",
		data:parameters ,
		success:function(data) {
			
			if(data.result == "${Constant.FLAG_N}") {
				
				alert(data.errorMessage);
			} 
			else {
				
				var html_options = "<option value='''>== 층 ==</option>";
				
				if(data.floorList.length > 0) {
					
					$.each(data.floorList,function(i,item) {
						
						html_options += "<option value='" + item.code + "' >" + item.name + "</option>";						
					});
				}
				
				$("select[name='sStartFloorCode']").html(html_options);
				$("select[name='sArriveFloorCode']").html(html_options);
			}
		}
	});
	
}

//경로타입 변경
function changePathType() {
	
	//이동타입 초기화
	$("select[name='moveType']").val("");
	
	var pathType = $("select[name='pathType']").val();
	var moveType = $("select[name='moveType']").val();
	
	document.location.href = "${pageContext.request.contextPath}/smtmng/building/route/routeInsertPop.ez?sPathType=" + pathType + "&sMoveType=" + moveType;
}

//이동경로 보기
function routeMapViewPop() {
	
	//경로타입
	var pathType = $("select[name='pathType']").val();
	
	//도착건물코드를 구한다.
	var buildingCode = $("select[name='sArriveBuildingCode']").val();
	
	//도착층코드를 구한다.
	var floorCode = $("select[name='sArriveFloorCode']").val();
	
	//경로데이터 값을 구한다.
	var mapInfo = $("textarea[name=mapInfo]").val();
	
	//출발시설 코드를 구한다.
	var startFacilityCode = $("select[name='startFacilityCode']").val();
	
	//도착시설 코드를 구한다.
	var arriveFacilityCode = $("select[name='arriveFacilityCode']").val();	
	
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

//이동타입 변경
function changeMoveType() {
	
	var pathType = $("select[name='pathType']").val();
	var moveType = $("select[name='moveType']").val();
	
	document.location.href = "${pageContext.request.contextPath}/smtmng/building/route/routeInsertPop.ez?sPathType=" + pathType + "&sMoveType=" + moveType;
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">경로정보 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="search_facility_form" id="search_facility_form" >
		<input type="hidden" name="sBuildingCode" value="">
		<input type="hidden" name="sFloorCode" value="">
		<input type="hidden" name="sFacilityGubun" value="">
	</form> 
        	
    <form name="search_floor_form" id="search_floor_form" >
       	<input type="hidden" name="sBuildingCode" value="">
    </form> 
           	
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertRoute();return false;">
    
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
                    	경로코드는 자동 생성됩니다. (출발시설코드 + 도착시설코드 조합으로 생성)
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            경로타입
                        </div>                    	
                    </th>
                    <td>
                        <select name="pathType" onchange="changePathType();">
                        	<option value="">== 경로타입 ==</option>
                        	<c:forEach var="item" items="${pathCodeList}">
                        	<option value="${item.code}" <c:if test="${searchVO.sPathType == item.code}">selected</c:if>>${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
                    </td>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            이동타입
                        </div>  
                    </th>
                    <td>
                    	<select name="moveType" onchange="changeMoveType();">
                        	<option value="">== 이동타입 ==</option>
                        	<c:forEach var="item" items="${moveCodeList}">
                        	<option value="${item.code}" <c:if test="${searchVO.sMoveType == item.code}">selected</c:if>>${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
                    </td>
                </tr>
                <tr id="startFacilityTr" style="display:none;">
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            출발시설
                        </div>    
                    </th>
                    <td colspan="3">
			   			<select name="sStartBuildingCode" onchange="searchFacilityCodeList('Start', true);">
                        	<option value="">== 건물 ==</option>
                        	<c:forEach var="item" items="${buildingCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
			   			<select name="sStartFloorCode" onchange="searchFacilityCodeList('Start', true);">
                        	<option value="">== 층 ==</option>
                        	
                        	<c:if test="${searchVO.sPathType != 'I'}"> 
                        	<c:forEach var="item" items="${floorCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                        	</c:if>
                        </select>
			   			<select name="sStartFacilityGubun" onchange="searchFacilityCodeList('Start', true);">
                        	<option value="">== 시설구분 ==</option>
                        	<c:forEach var="item" items="${startFacilityGubunCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
			   			<select name="startFacilityCode">
                        	<option value="">== 시설명 ==</option>
                        </select>
                    </td>
                </tr>
                <tr id="arriveFacilityTr" style="display:none;">
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            도착시설
                        </div>    
                    </th>
                    <td colspan="3">
			   			<select name="sArriveBuildingCode" onchange="searchFacilityCodeList('Arrive', true);">
                        	<option value="">== 건물 ==</option>
                        	<c:forEach var="item" items="${buildingCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
			   			<select name="sArriveFloorCode" onchange="searchFacilityCodeList('Arrive', true);">
                        	<option value="">== 층 ==</option>
                        	
                        	<c:if test="${searchVO.sPathType != 'I'}"> 
                        	<c:forEach var="item" items="${floorCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                         	</c:if>
                         	
                        </select>
			   			<select name="sArriveFacilityGubun" onchange="searchFacilityCodeList('Arrive', true);">
                        	<option value="">== 시설구분 ==</option>
                        	<c:forEach var="item" items="${arriveFacilityGubunCodeList}">
                        	<option value="${item.code}">${item.name}</option>				                        	
                        	</c:forEach>
                        </select>
			   			<select name="arriveFacilityCode">
                        	<option value="">== 시설명 ==</option>
                        </select>
                    </td>
                </tr>
                <tr id="routeDataTr" style="display:none;">                    
                    <th>경로데이터</th>
                    <td colspan="3">
                    	<textarea name="mapInfo" style="width:100%;height:100px;"></textarea>
                    	<button type="button" class="btn green sm" onclick="routeMapViewPop();">이동경로보기</button>
                    </td>
                </tr>
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">등록</button>
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
	<c:if test="${searchVO.sPathType == 'I'}">
		//건물내부일 경우 출발건물과 도착건물은 동일해야 한다.
		$("select[name='sStartBuildingCode']").change(function() {
			$("select[name='sArriveBuildingCode']").val($(this).val());
			searchFloorList($(this).val());
			searchFacilityCodeList("Arrive", true);
		});	
		$("select[name='sArriveBuildingCode']").change(function() {
			$("select[name='sStartBuildingCode']").val($(this).val());
			searchFloorList($(this).val());
			searchFacilityCodeList("Start", true);
		});
		
		
		<c:choose>
			<c:when test="${searchVO.sMoveType == 'P'}">
			//건물내부이면서 경로이동인 경우 출발층과 도착층은 동일해야 한다.
			$("select[name='sStartFloorCode']").change(function() {
				$("select[name='sArriveFloorCode']").val($(this).val());
				searchFacilityCodeList("Arrive", true);
			});	
			$("select[name='sArriveFloorCode']").change(function() {
				$("select[name='sStartFloorCode']").val($(this).val());
				searchFacilityCodeList("Start", true);
			});
			</c:when>
			<c:otherwise>
			//건물내부이면서 경로이동인 경우 출발층과 도착층은 동일할 필요가 없다.
			$("select[name='sStartFloorCode']").change(function() {
				//$("select[name='sArriveFloorCode']").val($(this).val());
				searchFacilityCodeList("Start", true);
			});	
			$("select[name='sArriveFloorCode']").change(function() {
				//$("select[name='sStartFloorCode']").val($(this).val());
				searchFacilityCodeList("Arrive", true);
			});
			</c:otherwise>
		</c:choose>
		
		
		
	</c:if>
	
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
			
			//값 초기화
			$("select[name='sStartBuildingCode']").val("");
			$("select[name='sStartFloorCode']").val("");
			$("select[name='sStartFacilityGubun']").val("");
			$("select[name='startFacilityCode']").val("");
	
			$("select[name='sArriveBuildingCode']").val("");
			$("select[name='sArriveFloorCode']").val("");
			$("select[name='sArriveFacilityGubun']").val("");
			$("select[name='arriveFacilityCode']").val("");
			
			//이동타입이 경로이동이 아닌 경우 경로데이터 textarea 숨김
			$("#routeDataTr").hide();
			$("textarea[name='mapInfo']").val("");
		</c:when>		
		<c:otherwise>
			/*
			//이동타입이 엘리베이터, 계단, 계단+엘리베이터인 경우에는 출발시설은 숨기고, 도착시설은 보임
			$("#startFacilityTr").hide();
			$("#arriveFacilityTr").show();
			
			//값 초기화
			$("select[name='sStartBuildingCode']").val("");
			$("select[name='sStartFloorCode']").val("");
			$("select[name='sStartFacilityGubun']").val("");
			$("select[name='startFacilityCode']").val("");
	
			$("select[name='sArriveBuildingCode']").val("");
			$("select[name='sArriveFloorCode']").val("");
			$("select[name='sArriveFacilityGubun']").val("");
			$("select[name='arriveFacilityCode']").val("");
			*/
			
			//이동타입이 엘리베이터, 계단, 계단+엘리베이터인 경우에는 출발시설, 도착시설은 보임
			$("#startFacilityTr").show();
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