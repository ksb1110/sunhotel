<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원검색 - 직원관리 - 부서정보 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertEmployeePop() {
	window.open("${pageContext.request.contextPath}/smtmng/department/employee/employeeInsertPop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}", "employeeInsert", 'resizable=yes,scrollbars=yes,width=1000,height=750');	
}

//수정 팝업
function updateEmployeePop(employeeSeq) {
    window.open("${pageContext.request.contextPath}/smtmng/department/employee/employeeUpdatePop.ez?sEmployeeSeq=" + employeeSeq, "employeeUpdate", 'resizable=yes,scrollbars=yes,width=800,height=750');
}

//삭제
function deleteEmployee(employeeSeq) {
	
	//키 셋팅
	$("#delete_employee_form input[name=employeeSeq]").val(employeeSeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_employee_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/employee/employeeDelete.ezax'/>",
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

//부서 - 직원정보전체갱신 1단계
function updateDepartEmployeeAllPre() {
	
	//선택된 부서명
	var departName = $.trim($("select[name='sDepartCode'] option:selected").html());
	
	if(confirm("[" + departName + "] 직원정보를 전체 갱신하시겠습니까?\n아이디가 동일하면 업데이트 되고 없으면 새로 등록됩니다.\n(디스플레이정보는 제외)")){

		$("#updateGukEmployeeAllBtn").hide();
		$("#updateGukEmployeeAllDiv").hide();
		$("#updateDepartEmployeeAllBtn").hide();
		$("#updateDepartEmployeeAllDiv").show();
		
		setTimeout(function(){
	   		// 1초 후 부서전채갱신 실행
	       	updateDepartEmployeeAll();
	   }, 1000);
		
	}
}

//부서 - 직원정보전체갱신 2단계
function updateDepartEmployeeAll() {
	
	var parameters = $("#update_all_employee_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/employee/updateDepartEmployeeAll.ezax'/>",
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

//국 - 직원정보전체갱신 1단계
function updateGukEmployeeAllPre() {
	
	//선택된 부서명
	var gukName = $.trim($("select[name='sGukCode'] option:selected").html());
	
	if(confirm("[" + gukName + "] 직원정보를 전체 갱신하시겠습니까?\n아이디가 동일하면 업데이트 되고 없으면 새로 등록됩니다.\n(디스플레이정보는 제외)")){
		
		$("#updateGukEmployeeAllBtn").hide();
		$("#updateGukEmployeeAllDiv").show();
		$("#updateDepartEmployeeAllBtn").hide();
		$("#updateDepartEmployeeAllDiv").hide();
		
		setTimeout(function(){
	   		// 1초 후 부서전채갱신 실행
	       	updateGukEmployeeAll();
	   }, 1000);
		
	}
}

//국 - 직원정보전체갱신 2단계
function updateGukEmployeeAll() {
	
	var parameters = $("#update_all_employee_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/employee/updateGukEmployeeAll.ezax'/>",
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

//이미지 보기
function viewFile(filePath) {
	window.open(filePath);
}

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex){
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/department/employee/selectEmployeePop.ez'/>";
	document.frm.submit();
}

//국변경
function changeGuk() {
	var sGukCode = $("select[name='sGukCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/selectEmployeePop.ez?sGukCode="/>" + sGukCode;
	
	document.location.href = url;
}

//부서변경
function changeDepart() {
	var sDepartCode = $("select[name='sDepartCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/selectEmployeePop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode="/>" + sDepartCode;
	
	document.location.href = url;
}

//팀변경
function changeTeam() {
	var sTeamCode = $("select[name='sTeamCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/selectEmployeePop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}&sTeamCode="/>" + sTeamCode;
	
	document.location.href = url;
}

//직원선택
function choiceEmployee(employeeSeq, name) {
	//부모창에 함수가 있으면 실행
	if(typeof(opener.choiceEmployee) == "function") {
		opener.choiceEmployee(employeeSeq, name);
		self.close();
	}
	else {
		alert("호출페이지에 함수가 없습니다.");
	}
}
</script>

</head>

<body>
<div class="win-popup">
	
 
           
           	<form name="all_route_apply_form" id="all_route_apply_form" style="display:none;">
           	<input type="hidden" name="employeeSeqsStr" value="">
           	<input type="hidden" name="routeFlag" value="">
           	</form>
           	
           	<form name="delete_employee_form" id="delete_employee_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	</form>
           	
           	<form name="update_all_employee_form" id="update_all_employee_form" style="display:none;">
           	<input type="hidden" name="gukCode" value="${searchVO.sGukCode}">
           	<input type="hidden" name="gukName" value="">
           	<input type="hidden" name="departCode" value="${searchVO.sDepartCode}">
           	</form>
           	           	
           	<form name="sort_employee_form" id="sort_employee_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           	
           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search('1');return false;">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
				
					<div class="table-wrapper">
						
						<table class="table" style="margin-top:5px;">
							<colgroup>
								<col style="width:80px;">
								<col>
								<col style="width:80px;">
								<col style="width:150px;">
							   	<col style="width:200px;">
							</colgroup>
							<tbody>
							   	<tr>	   								   		
							   		<th class="text-left">부서</th>
							   		<td>
							   			<select name="sGukCode" onchange="changeGuk();">
							   				<option value="">== 국 ==</option>
							   				<c:forEach var="item" items="${orgCodeList}">
							   				<option value="${item.code}" <c:if test="${item.code == searchVO.sGukCode}">selected</c:if>>${item.name}</option>
							   				</c:forEach>
							   			</select>
							   			
							   			<select name="sDepartCode" onchange="changeDepart();">
							   				<option value="">== 부서 ==</option>
							   				<c:forEach var="item" items="${departCodeList}">
							   				<option value="${item.departCode}" <c:if test="${item.departCode == searchVO.sDepartCode}">selected</c:if>>${item.departName}</option>
							   				</c:forEach>
							   			</select>
							   			
							   			<select name="sTeamCode" onchange="changeTeam();">
							   				<option value="">== 팀 ==</option>
							   				<c:forEach var="item" items="${teamCodeList}">
							   				<option value="${item.teamCode}" <c:if test="${item.teamCode == searchVO.sTeamCode}">selected</c:if>>${item.teamName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>								   								   		
							   		<th class="text-left">이름</th>
							   		<td><input type="text" id="sName" class="width100" name="sName" value="${searchVO.sName}" ></td>	
									<td style="border:0;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/department/employee/selectEmployeePop.ez?sBuildingCode='/>';">전체</button>
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
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th>부서명</th>
								<th>팀명</th>
								<th>직위</th>
								<th>이름</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td>${item.departName}</td>
								<td>${item.teamName}</td>
								<td>${item.position}</td>
								<td>${item.name}</td>			
								<td>
									<button type="button" class="btn blue sm" onclick="choiceEmployee('${item.employeeSeq}','${item.name}');">선택</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 직원정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
		    	</div>
		    	
		    	<!--페이징-->
				<div class="paging-wrap">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_Search" />
					</ul>
				</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               

</div> <!--//wrap-->

</body>
</html>