<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>경로정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertRoutePop() {
	
	window.open("${pageContext.request.contextPath}/smtmng/building/route/routeInsertPop.ez?sPathType=${searchVO.sPathType}", "routeInsert", 'resizable=yes,scrollbars=yes,width=900,height=750');	
}

//수정 팝업
function updateRoutePop(routeCode) {
	
    window.open("${pageContext.request.contextPath}/smtmng/building/route/routeUpdatePop.ez?sRouteCode=" + routeCode, "routeUpdate", 'resizable=yes,scrollbars=yes,width=900,height=750');
}

//삭제
function deleteRoute(routeCode) {
	
	//키 셋팅
	$("#delete_route_form input[name=routeCode]").val(routeCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = $("#delete_route_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/route/routeDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					document.location.reload();
				}
			}
		});
	}
}

//이미지 보기
function viewFile(filePath) {
	
	window.open(filePath);
}

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex) {
	
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/building/route/routeList.ez'/>";
	document.frm.submit();
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
		$("select[name='s" + startArriveGubun + "FacilityCode']").html(html_empty_options);
		
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
	
	
	var parameters = $("#search_facility_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
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
				
				$("select[name='s" + startArriveGubun + "FacilityCode']").html(html_options);
			}
		}
	});
}

//층 검색
function searchFloorList(buildingCode, startArriveGubun) {
	
	$("form[name='search_floor_form'] input[name='sBuildingCode']").val(buildingCode);
	
	//선택된 cmd코드
	var sFloorCode = "";
	
	if(startArriveGubun == "Start") {
		
		sFloorCode = "${searchVO.sStartFloorCode}";
	}
	else if(startArriveGubun == "Arrive") {
		
		sFloorCode = "${searchVO.sArriveFloorCode}";
	}
	
	var parameters = $("#search_floor_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
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
						
						var selected = "";
						
						if(item.code == sFloorCode) {
							
							selected = "selected";
						}
						
						html_options += "<option value='" + item.code + "' " + selected +">" + item.name + "</option>";						
					});
				}
				
				$("select[name='s" + startArriveGubun + "FloorCode']").html(html_options);
			}
		}
	});	
}

//이동타입 변경
function changeMoveType() {
	
	var moveType = $("select[name='sMoveType']").val();
	document.location.href = "${pageContext.request.contextPath}/smtmng/building/route/routeList.ez?sPathType=${searchVO.sPathType}&sMoveType=" + moveType;
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="building"/>
		<jsp:param name="admin_menu2" value="route"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">경로정보</h2>     
            
           <nav class="depth3-menu">
                <ul>
                	<c:forEach var="item" items="${pathCodeList}">
                    <li <c:if test="${item.code == searchVO.sPathType}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/building/route/routeList.ez?sPathType=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
           	
           	<form name="delete_route_form" id="delete_route_form" style="display:none;">
           	<input type="hidden" name="routeCode" value="">
           	</form>
           	
           	<form name="search_facility_form" id="search_facility_form" >
	           	<input type="hidden" name="sBuildingCode" value="">
	           	<input type="hidden" name="sFloorCode" value="">
	           	<input type="hidden" name="sFacilityGubun" value="">
           	</form>
           	
           	<form name="search_floor_form" id="search_floor_form" >
	           	<input type="hidden" name="sBuildingCode" value="">
           	</form> 
           	
           	<br />
           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="get" onSubmit="fn_Search('1');return false;">
		    	
					<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
					<input type="hidden" name="sPathType" value="${searchVO.sPathType}"/>
				
					<div class="table-wrapper">
						<table class="table">
							<colgroup>
								<col style="width:80px;">
								<col style="width:300px;">
								<col style="width:80px;">
								<col style="width:300px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">이동타입</th>
							   		<td>
							   			<select name="sMoveType" onchange="changeMoveType();">
				                        	<option value="">== 전체 ==</option>
				                        	<c:forEach var="item" items="${moveCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sMoveType}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        </select>
							   		</td>
							   		
							   		<th class="text-left">경로코드</th>
							   		<td><input type="text" id="sRouteCode" class="width100" name="sRouteCode" value="" title="경로코드를 입력하세요." /></td>
									
									<td style="border:0;">
									</td>									
							    </tr>
							   	<tr id="startFacilityTr" style="display:none;">
							   		<th class="text-left">출발시설</th>
							   		<td colspan="3">
							   			<select name="sStartBuildingCode" onchange="searchFacilityCodeList('Start', true);">
				                        	<option value="">== 건물 ==</option>
				                        	<c:forEach var="item" items="${buildingCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sStartBuildingCode}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        </select>
							   			<select name="sStartFloorCode" onchange="searchFacilityCodeList('Start', true);">
				                        	<option value="">== 층 ==</option>
				                        	
				                        	<c:if test="${searchVO.sPathType != 'I'}">
				                        	<c:forEach var="item" items="${floorCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sStartFloorCode}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        	</c:if>
				                        </select>
							   			<select name="sStartFacilityGubun" onchange="searchFacilityCodeList('Start', true);">
				                        	<option value="">== 시설구분 ==</option>
				                        	<c:forEach var="item" items="${startFacilityGubunCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sStartFacilityGubun}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        </select>
							   			<select name="sStartFacilityCode">
				                        	<option value="">== 시설명 ==</option>
				                        </select>
							   		</td>
									
									<td style="border:0;">
									</td>									
							    </tr>
							   	<tr id="arriveFacilityTr" style="display:none;">
							   		<th class="text-left">도착시설</th>
							   		<td colspan="3">
							   			<select name="sArriveBuildingCode" onchange="searchFacilityCodeList('Arrive', true);">
				                        	<option value="">== 건물 ==</option>
				                        	<c:forEach var="item" items="${buildingCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sArriveBuildingCode}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        </select>
							   			<select name="sArriveFloorCode" onchange="searchFacilityCodeList('Arrive', true);">
				                        	<option value="">== 층 ==</option>
				                        	
				                        	<c:if test="${searchVO.sPathType != 'I'}">
				                        	<c:forEach var="item" items="${floorCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sArriveFloorCode}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        	</c:if>
				                        </select>
							   			<select name="sArriveFacilityGubun" onchange="searchFacilityCodeList('Arrive', true);">
				                        	<option value="">== 시설구분 ==</option>
				                        	<c:forEach var="item" items="${arriveFacilityGubunCodeList}">
				                        	<option value="${item.code}" <c:if test="${item.code == searchVO.sArriveFacilityGubun}">selected</c:if>>${item.name}</option>				                        	
				                        	</c:forEach>
				                        </select>
							   			<select name="sArriveFacilityCode">
				                        	<option value="">== 시설명 ==</option>
				                        </select>
							   		</td>
									
									<td style="border:0;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/building/route/routeList.ez?sPathType=${searchVO.sPathType}'/>';">전체</button>
									</td>									
							    </tr>
							</tbody>
						</table>
					</div>
				</form>
				
				<h3 class="title2">
					검색결과 <small>[총 <strong class="text-blue">${paginationInfo.totalRecordCount}</strong>건]</small>
				</h3>
				
		    	<div class="table-wrapper">

		    		<table class="table center">
						<colgroup>
							<col style="width:100px;">
							<col style="width:270px;">
							<col>
							<col>
							<col style="width:150px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>경로코드</th>
								<th>출발시설</th>
								<th>도착시설</th>
								<th>경로타입</th>
								<th>이동타입</th>
								<th>경로</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td>
								<td>${item.routeCode}</td>
								<td>${item.startFacilityName}</td>
								<td>${item.arriveFacilityName}</td>
								<td>${pathNameMap.get(item.pathType)}</td>
								<td>${moveNameMap.get(item.moveType)}</td>
								<td>
									<c:if test="${item.moveType == 'P'}">
										<c:if test="${not empty item.mapInfo}">
										<img src="/images/admin/icon/check2.png" alt="체크">
										</c:if>
										<c:if test="${empty item.mapInfo}">
										<img src="/images/admin/icon/temp/blue_close.png" alt="close">
										</c:if>
									</c:if>
									<c:if test="${item.moveType != 'P'}">
									-
									</c:if>
								</td>														
								<td>
									<button type="button" class="btn blue sm" onclick="updateRoutePop('${item.routeCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteRoute('${item.routeCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="8">등록된 경로정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertRoutePop();">경로정보등록</button>
					</div>
		    	</div>
		    	
		    	<!--페이징-->
				<div class="paging-wrap">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_Search" />
					</ul>
				</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

<script>
$(function() {
	<c:if test="${searchVO.sPathType == 'I'}">
	
	
		//건물내부일 경우 출발건물과 도착건물은 동일해야 한다.
		$("select[name='sStartBuildingCode']").change(function() {
			$("select[name='sArriveBuildingCode']").val($(this).val());
			searchFloorList($(this).val(), 'Start');
			searchFloorList($(this).val(), 'Arrive');
			searchFacilityCodeList("Arrive", true);
		});	
		$("select[name='sArriveBuildingCode']").change(function() {
			$("select[name='sStartBuildingCode']").val($(this).val());
			searchFloorList($(this).val(), 'Start');
			searchFloorList($(this).val(), 'Arrive');
			searchFacilityCodeList("Start", true);
		});
		
		<c:choose>
			<c:when test="${searchVO.sMoveType == 'P'}">
			//건물내부일 경우 출발층과 도착층은 동일해야 한다.
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
				searchFacilityCodeList("Arrive", true);
			});	
			$("select[name='sArriveFloorCode']").change(function() {
				//$("select[name='sStartFloorCode']").val($(this).val());
				searchFacilityCodeList("Start", true);
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
			$("select[name='sStartFacilityCode']").val("");
	
			$("select[name='sArriveBuildingCode']").val("");
			$("select[name='sArriveFloorCode']").val("");
			$("select[name='sArriveFacilityGubun']").val("");
			$("select[name='sArriveFacilityCode']").val("");
			*/
			
			//이동타입이 엘리베이터, 계단, 계단+엘리베이터인 경우에는 출발시설, 도착시설은 보임
			$("#startFacilityTr").show();
			$("#arriveFacilityTr").show();
			
		</c:otherwise>
		
	</c:choose>	
	

	<c:if test="${searchVO.sPathType == 'I'}">
	searchFloorList($("select[name='sStartBuildingCode']").val(), 'Start');
	searchFloorList($("select[name='sArriveBuildingCode']").val(), 'Arrive');
	</c:if>
	
	searchFacilityCodeList("Start", false);
	searchFacilityCodeList("Arrive", false);
	
});


</script>

</body>
</html>