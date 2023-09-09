<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>편의시설 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertFacilityPop() {
	
	window.open("${pageContext.request.contextPath}/smtmng/building/convenience/convenienceInsertPop.ez?sBuildingCode=${searchVO.sBuildingCode}", "facilityInsert", 'resizable=yes,scrollbars=yes,width=800,height=750');	
}

//수정 팝업
function updateFacilityPop(facilityCode) {
	
    window.open("${pageContext.request.contextPath}/smtmng/building/convenience/convenienceUpdatePop.ez?sFacilityCode=" + facilityCode, "facilityUpdate", 'resizable=yes,scrollbars=yes,width=800,height=750');
}

//삭제
function deleteFacility(facilityCode) {
	
	//키 셋팅
	$("#delete_convenience_form input[name=facilityCode]").val(facilityCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = $("#delete_convenience_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/convenience/convenienceDelete.ezax'/>",
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
	document.frm.action = "<c:url value='/smtmng/building/convenience/convenienceList.ez'/>";
	document.frm.submit();
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="building"/>
		<jsp:param name="admin_menu2" value="convenience"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">편의시설</h2>     
            
            <c:if test="${not empty buildingList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li <c:if test="${empty searchVO.sBuildingCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/building/convenience/convenienceList.ez"/>">전체건물</a>
                    </li>
                	<c:forEach var="item" items="${buildingList}">
                    <li <c:if test="${item.buildingCode == searchVO.sBuildingCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/building/convenience/convenienceList.ez?sBuildingCode=${item.buildingCode}"/>">${item.buildingName}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
           	
           	<form name="delete_convenience_form" id="delete_convenience_form" style="display:none;">
           	<input type="hidden" name="facilityCode" value="">
           	</form>
           	
           	<form name="sort_convenience_form" id="sort_convenience_form" style="display:none;">
           	<input type="hidden" name="facilityCode" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           	
           	<br />
           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="get" onSubmit="fn_Search('1');return false;">
		    	
					<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
					<input type="hidden" name="sBuildingCode" value="${searchVO.sBuildingCode}"/>
				
					<div class="table-wrapper">
						<table class="table">
							<colgroup>
								<col style="width:80px;">
								<col style="width:180px;">
								<col style="width:80px;">
								<col style="width:180px;">
								<col style="width:80px;">
								<col style="width:180px;">
								<col style="width:80px;">
								<col style="width:180px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">층</th>
							   		<td>
							   			<select name="sFloorCode">
				                        	<option value="">==전체==</option>
				                        	<c:forEach var="item" items="${floorCodeList}">                        	
				                        		<option value="${item.code}" <c:if test="${searchVO.sFloorCode == item.code}">selected</c:if>>${item.name}</option>
				                        	</c:forEach>                    	
				                        </select>
							   		</td>
							   		
							   		<th class="text-left">시설구분</th>
							   		<td>
							   			<select name="sFacilityGubun">
				                        	<option value="">==전체==</option>
				                        	<c:forEach var="item" items="${facilityGubunCodeList}">                        	
				                        		<option value="${item.code}" <c:if test="${searchVO.sFacilityGubun == item.code}">selected</c:if>>${item.name}</option>
				                        	</c:forEach>                    	
				                        </select>
							   		</td>
							   		
							   		<th class="text-left">시설코드</th>
							   		<td><input type="text" id="sFacilityCode" class="width100" name="sFacilityCode" value="<c:out value='${searchVO.sFacilityCode}'/>" title="시설코드를 입력하세요." /></td>
									
							   		<th class="text-left">시설명</th>
							   		<td><input type="text" id="sFacilityName" class="width100" name="sFacilityName" value="<c:out value='${searchVO.sFacilityName}'/>" title="시설명을 입력하세요." /></td>
									<td style="border:0;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/building/convenience/convenienceList.ez?sBuildingCode=${searchVO.sBuildingCode}'/>';">전체</button>
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
							<col style="width:150px;">
							<col style="width:150px;">
							<col>
							<col style="width:100px;">
							<col style="width:150px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>시설코드</th>
								<th>시설구분</th>
								<th>시설명</th>
								<th>건물명</th>
								<th>층</th>
								<th>위치정보</th>
								<th>이미지</th>
								<th>시설정보창형태</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.facilityCode}</td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${gubunNameMap.get(item.facilityGubun)}</td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.facilityName}</td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${buildingNameMap.get(item.buildingCode)}</td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${floorNameMap.get(item.floorCode)}</td>
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.pointX > 0 && item.pointY > 0}">
									<img src="/images/admin/icon/check2.png" alt="체크">
									</c:if>
									<c:if test="${item.pointX == 0 || item.pointY == 0}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>
								</td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
								
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.facilityImgPath}">
									<button type="button" class="btn green sm" onclick="viewFile('${item.facilityImgPath}');">보기</button>
									</c:if>
									<c:if test="${empty item.facilityImgPath}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>
								</td>
									
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${infoNameMap.get(item.infoType)}</td>
													
								<td <c:if test="${item.useYn eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateFacilityPop('${item.facilityCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteFacility('${item.facilityCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="10">등록된 편의시설이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertFacilityPop();">편의시설등록</button>
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

</body>
</html>