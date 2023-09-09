<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertDepartmentPop() {
	
	//국이 선택된 경우에는 국을 파라메터로 가져간다.	
	window.open("${pageContext.request.contextPath}/smtmng/department/department/departmentInsertPop.ez?sGukCode=${searchVO.sGukCode}", "departmentInsert", 'resizable=yes,scrollbars=yes,width=800,height=500');	
}

//수정 팝업
function updateDepartmentPop(departCode) {
    window.open("${pageContext.request.contextPath}/smtmng/department/department/departmentUpdatePop.ez?sDepartCode=" + departCode, "departmentUpdate", 'resizable=yes,scrollbars=yes,width=800,height=650');
}

//팀정보 팝업
function listTeamPop(departCode) {
	window.open("${pageContext.request.contextPath}/smtmng/department/department/teamListPop.ez?sDepartCode=" + departCode, "listTeamPop", 'resizable=yes,scrollbars=yes,width=800,height=650');
}

//연결시설 팝업
function listConnectFacilityPop(departCode) {
	window.open("${pageContext.request.contextPath}/smtmng/department/department/connectFacilityListPop.ez?sDepartCode=" + departCode, "listConnectFacilityPop", 'resizable=yes,scrollbars=yes,width=800,height=650');
}

//삭제
function deleteDepartment(departCode) {
	
	//값 셋팅
	$("#delete_department_form input[name='departCode']").val(departCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_department_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/department/departmentDelete.ezax'/>",
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

//부서전체갱신 1단계
function updateDepartmentAllPre() {
	
	if(confirm("모든 부서를 갱신 하시겠습니까?")) {
		
		$("#updateDepartmentAllDiv").show();
		$("#updateDepartmentAllBtn").hide();
		
		setTimeout(function(){
	   		// 1초 후 부서전채갱신 실행
	       	updateDepartmentAll();
	   }, 1000);
	}
}

//부서전체갱신 2단계
function updateDepartmentAll() {
	
	//var parameters = $("#insert_all_form").serialize();
	var parameters = new FormData($('#insert_all_form')[0]);
	
	//$("#insert_all_form").ajaxSubmit({
	$.ajax({
		type:"post", 
		dataType:"json",
		
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		
		async:false,
		url:"<c:url value='/smtmng/department/department/departmentInsertAll.ezax'/>",
		data:parameters ,
		success:function(data){
			if(data.result == "${Constant.FLAG_N}"){
				alert(data.errorMessage);
			} else {
				alert("부서정보가 전체갱신 되었습니다.");
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
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="department"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">부서정보</h2>                    
           	
           	
           	<c:if test="${not empty orgCodeList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li <c:if test="${empty searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/department/departmentList.ez"/>">전체</a>
                    </li>
                	<c:forEach var="item" items="${orgCodeList}">
                    <li <c:if test="${item.code == searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/department/departmentList.ez?sGukCode=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
          	
           	<form name="delete_department_form" id="delete_department_form" style="display:none;">
           		<input type="hidden" name="departCode" value="">
           	</form>
           	
           	<form name="insert_all_form" id="insert_all_form" style="display:none;">
		    </form>
		    			
		    <div class="item-col3-wrapper">
						
		    	<div class="col">
					
					<div style="float:left;color:blue;font-size:13px;line-height:150%;">
					 * 부서정보는 매일 새벽 1시에 자동 업데이트 됩니다.
					 <br />
					 * 팀정보는 매일 새벽 1시 10분에 자동 업데이트 됩니다.
					</div>
					
					<c:if test="${empty searchVO.sGukCode}">
						<div class="btn-wrap" style="float:right;">
							<div style="color:red;font-size:20px;font-weight:bold;display:none;" id="updateDepartmentAllDiv">* 부서전체 갱신중입니다. 잠시만 기다려주세요.</div>
							<button type="button" class="btn black" onclick="updateDepartmentAllPre();" id="updateDepartmentAllBtn">부서전체갱신</button>
						</div>
					</c:if>
					
		    		<table class="table center">
						<colgroup>
							<col style="width:150px;">
							<col style="width:150px;">
							<col style="width:150px;">
							<col>
							<col style="width:150px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:270px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>부서코드</th>
								<th>실국명</th>
								<th>부서명</th>
								<th>부서명초성</th>
								<th>정렬순서</th>
								<th>팀정보</th>
								<th>연결시설</th>
								<th>API 체크</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(departmentList) > 0}">
							<c:forEach items="${departmentList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${status.count}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.departCode}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.gukName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.departName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.departNameCho}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.sort}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${teamMap.get(item.departCode)}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${connectFacilityMap.get(item.departCode)}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.apiCheckFlag == 'Y'}">
									<img src="/images/admin/icon/temp/blue_check.png" alt="체크">
									</c:if>
								</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.gukCode != '1001000000000'}">
									<button type="button" class="btn green sm" onclick="listTeamPop('${item.departCode}');">팀정보</button>
									</c:if>
									<button type="button" class="btn green sm" onclick="listConnectFacilityPop('${item.departCode}');">연결시설</button>
									<button type="button" class="btn blue sm" onclick="updateDepartmentPop('${item.departCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteDepartment('${item.departCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(departmentList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="10">등록된 부서가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertDepartmentPop();">부서등록</button>
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