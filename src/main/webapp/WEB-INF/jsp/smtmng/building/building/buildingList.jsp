<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>건물정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertBuildingPop() {
	window.open("${pageContext.request.contextPath}/smtmng/building/building/buildingInsertPop.ez", "buildingInsert", 'resizable=yes,scrollbars=yes,width=800,height=500');	
}

//수정 팝업
function updateBuildingPop(buildingCode) {
    window.open("${pageContext.request.contextPath}/smtmng/building/building/buildingUpdatePop.ez?sBuildingCode=" + buildingCode, "buildingUpdate", 'resizable=yes,scrollbars=yes,width=800,height=600');
}

//삭제
function deleteBuilding(buildingCode) {
	
	//키 셋팅
	$("#delete_building_form input[name=buildingCode]").val(buildingCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_building_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/building/buildingDelete.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
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
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="building"/>
		<jsp:param name="admin_menu2" value="building"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">건물정보</h2>                    
           	
           	<form name="delete_building_form" id="delete_building_form" style="display:none;">
           	<input type="hidden" name="buildingCode" value="">
           	</form>
           	
           	<form name="sort_building_form" id="sort_building_form" style="display:none;">
           	<input type="hidden" name="buildingCode" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:120px;">
							<col style="width:120px;">
							<col>
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:180px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>건물코드</th>
								<th>건물명</th>
								<th>건물이미지</th>
								<th>층수</th>
								<th>층별이미지</th>
								<th>건물입구</th>
								<th>엘리베이터수</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(buildingList) > 0}">
							<c:forEach items="${buildingList}" var="item" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${item.buildingCode}</td>
								<td>${item.buildingName}</td>
								<td>
									<c:if test="${not empty item.buildingImage}">
									<button type="button" class="btn green sm" onclick="viewFile('${item.buildingImage}');">보기</button>
									</c:if>
									<c:if test="${empty item.buildingImage}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>
								</td>
								<td>
									<c:if test="${not empty item.floorUpCnt && item.floorUpCnt > 0}">
										<div>${item.floorUpCnt}층</div>
									</c:if>
									<c:if test="${not empty item.floorDownCnt && item.floorDownCnt > 0}">
										<!-- <div>지하 ${item.floorDownCnt}층</div> -->
									</c:if>
									<c:if test="${not empty item.floorUpCnt && item.floorUpCnt == 0 && not empty item.floorDownCnt && item.floorDownCnt == 0}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>
								</td>
								<td>
									<c:if test="${item.buildingCode != 'B11'}">
										<c:forEach begin="1" end="${item.floorUpCnt}" step="1" varStatus="status2">
											<c:set var="mapKey" value="${item.buildingCode}_${status2.count}"/>										
											
											<c:if test="${not empty floorImageListMap.get(mapKey)}">
												<button onclick="viewFile('${floorImageListMap.get(mapKey)}')">&nbsp;${status2.count}&nbsp;</button>
											</c:if>										
										</c:forEach>
									</c:if>
									<c:if test="${item.buildingCode == 'B11'}">
										<c:set var="mapKey" value="${item.buildingCode}_0"/>			
										<c:if test="${not empty floorImageListMap.get(mapKey)}">
											<button onclick="viewFile('${floorImageListMap.get(mapKey)}')">&nbsp;야외&nbsp;</button>
										</c:if>	
									</c:if>	
								</td>
								<td>
									<c:if test="${item.entranceCnt > 0}">
									${item.entranceCnt}개
									</c:if>
									<c:if test="${item.entranceCnt == 0}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>
								</td>
								<td>
									<c:if test="${item.elevatorCnt > 0}">
									${item.elevatorCnt}개
									</c:if>
									<c:if test="${item.elevatorCnt == 0}">
									<img src="/images/admin/icon/temp/blue_close.png" alt="close">
									</c:if>									
								</td>								
								<td>
									<button type="button" class="btn blue sm" onclick="updateBuildingPop('${item.buildingCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteBuilding('${item.buildingCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(buildingList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="9">등록된 건물정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertBuildingPop();">건물정보등록</button>
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