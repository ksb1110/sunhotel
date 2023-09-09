<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>가까운시설 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertNearbyFacilityPop() {
	
	//중심시설 코드
	var centerFacilityCode = "${searchVO.sCenterFacilityCode}";
	
	//가까운시설 구분
	var nearbyFacilityGubun = "${searchVO.sNearbyFacilityGubun}";
	
	//가까운시설 안내타입
	var nearbyGuideType = "${searchVO.sNearbyGuideType}";
	
	var param = "sCenterFacilityCode=" + centerFacilityCode;
	param += "&sNearbyFacilityGubun=" + nearbyFacilityGubun;
	param += "&sNearbyGuideType=" + nearbyGuideType;
	
	window.open("${pageContext.request.contextPath}/smtmng/building/nearbyFacility/nearbyFacilityInsertPop.ez?" + param, "nearbyFacilityInsert", 'resizable=yes,scrollbars=yes,width=800,height=400');	
}

//수정 팝업
function updateNearbyFacilityPop(seq) {
	
    window.open("${pageContext.request.contextPath}/smtmng/building/nearbyFacility/nearbyFacilityUpdatePop.ez?sNearbySeq=" + seq, "nearbyFacilityUpdate", 'resizable=yes,scrollbars=yes,width=800,height=550');
}

//삭제
function deleteNearbyFacility(nearbySeq) {
	
	//삭제할 셋팅
	$("#delete_nearbyFacility_form input[name='nearbySeq']").val(nearbySeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = $("#delete_nearbyFacility_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/nearbyFacility/nearbyFacilityDelete.ezax'/>",
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

//정렬순서를 변경한다.
function changeSort(nearbySeq, nearbyOrder) {
	
	//변경할 셋팅
	$("#sort_nearbyFacility_form input[name=nearbySeq]").val(nearbySeq);
	$("#sort_nearbyFacility_form input[name=nearbyOrder]").val(nearbyOrder);
	
	var parameters = $("#sort_nearbyFacility_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/building/nearbyFacility/nearbyFacilitySortChange.ezax'/>",
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
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="building"/>
		<jsp:param name="admin_menu2" value="nearbyFacility"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">가까운시설</h2>                    
           	
           	<form name="delete_nearbyFacility_form" id="delete_nearbyFacility_form" style="display:none;">
           	<input type="hidden" name="nearbySeq" value="">
           	</form>
           	
           	<form name="sort_nearbyFacility_form" id="sort_nearbyFacility_form" style="display:none;">
           	<input type="hidden" name="nearbySeq" value="">
           	<input type="hidden" name="nearbyOrder" value="">
           	</form> 
           
           	<c:set var="centerFacilityName" value=""/>
           	
           	<c:if test="${not empty kioskList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                	<c:forEach var="item" items="${kioskList}">
                	
                	<c:if test="${item.facilityCode == searchVO.sCenterFacilityCode}">
                		<c:set var="centerFacilityName" value="${item.facilityName}"/>
                	</c:if>
                	
                    <li <c:if test="${item.facilityCode == searchVO.sCenterFacilityCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/building/nearbyFacility/nearbyFacilityList.ez?sCenterFacilityCode=${item.facilityCode}&sNearbyFacilityGubun=${searchVO.sNearbyFacilityGubun}"/>">${item.facilityName}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
           	<c:if test="${not empty facilityGubunCodeList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                	<c:forEach var="item" items="${facilityGubunCodeList}">
                    <li <c:if test="${item.code == searchVO.sNearbyFacilityGubun}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/building/nearbyFacility/nearbyFacilityList.ez?sCenterFacilityCode=${searchVO.sCenterFacilityCode}&sNearbyFacilityGubun=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:120px;">
							<col style="width:300px;">
							<col style="width:150px;">
							<col>
							<col style="width:250px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>가까운순서</th>
								<th>중심시설</th>
								<th>시설구분</th>
								<th>가까운시설</th>
								<th>안내타입</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(nearbyFacilityList) > 0}">
							<c:forEach items="${nearbyFacilityList}" var="item" varStatus="status">
							
							<c:set var="buildingCode" value="${fn:substring(item.nearbyFacilityCode,0,3)}" />
							<c:set var="floorCode" value="${fn:substring(item.nearbyFacilityCode,4,7)}" />
							
							<tr>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<select name="nearbyOrder" onchange="changeSort('${item.nearbySeq}',$(this).val());">
			                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
			                        		<option value="${item2}" <c:if test="${item.nearbyOrder == item2}">selected</c:if>>${item2}</option>
			                        	</c:forEach>                        	
			                        </select>
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.centerFacilityName}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${selectFacilityGubunCodeVO.name}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									${buildingNameMap.get(buildingCode)}
									-
									${floorNameMap.get(floorCode)}
									-
									${item.nearbyFacilityName}
								</td>
								
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${guideNameMap.get(item.nearbyGuideType)}</td>
								
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateNearbyFacilityPop('${item.nearbySeq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteNearbyFacility('${item.nearbySeq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(nearbyFacilityList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="6">등록된 [${centerFacilityName}] 에서 가까운 [${selectFacilityGubunCodeVO.name}] 시설이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertNearbyFacilityPop();">[${centerFacilityName}] 에서 가까운 [${selectFacilityGubunCodeVO.name}] 등록</button>
					</div>
		    	</div>
		    	
		    </div> <!-- //item-col3-wrapper -->            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>