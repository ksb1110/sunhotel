<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>팀정보 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertTeamPop() {
	
	//국이 선택된 경우에는 국을 파라메터로 가져간다.	
	window.open("${pageContext.request.contextPath}/smtmng/department/department/teamInsertPop.ez?sDepartCode=${searchVO.sDepartCode}", "teamInsert", 'resizable=yes,scrollbars=yes,width=500,height=400');	
}

//수정 팝업
function updateTeamPop(departCode, teamCode) {
    window.open("${pageContext.request.contextPath}/smtmng/department/department/teamUpdatePop.ez?sDepartCode=" + departCode + "&sTeamCode=" + teamCode, "teamUpdate", 'resizable=yes,scrollbars=yes,width=500,height=400');
}

//삭제
function deleteTeam(departCode, teamCode) {
	
	//값 셋팅
	$("#delete_form input[name='departCode']").val(departCode);
	$("#delete_form input[name='teamCode']").val(teamCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/department/teamDelete.ezax'/>",
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

//선택한 직원정보 부모창에 반영
function setEmployeeInfo(userId) {
	//부모창에 함수가 있으면 실행
	if(typeof(opener.setEmployeeInfo) == "function") {
		opener.setEmployeeInfo(userId);
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
    
    <h3 class="title2">
		${departmentVO.gukName} &gt; 
		${departmentVO.departName} &gt; 
		
		<c:if test="${not empty searchVO.sTeamCode}">
		${teamVO.teamName} &gt;
		</c:if>
		
		직원정보 (도청 API 검색 결과)
	</h3>
          	
   	<div class="table-wrapper">

   		<table class="table center">
			<colgroup>
				<col style="width:150px;">
				<col style="width:150px;">
				<col style="width:100px;">
				<col>
				<col style="width:130px;">
				<col style="width:150px;">
				<col style="width:80px;">
			</colgroup>
			<thead>
				<tr>
					<th>팀명</th>
					<th>직급</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>아이디</th>
					<th>관리툴</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(employeeList) > 0}">
				<c:forEach items="${employeeList}" var="item" varStatus="status">
				
				<c:if test="${(empty searchVO.sTeamCode) || (not empty teamVO && teamVO.teamCode == item.officeCd)}">
				
				
				<c:set var="tmpGukNm" value="${departmentVO.gukName}>"/>
				<c:set var="tmpDepartNm" value="${departmentVO.departName}>"/>
				<tr class="teamTr">
					<td class="${item.officeCd}">
						<span><c:out value="${fn:replace(fn:replace(fn:replace(fn:replace(item.officeNms,'제주시>',''),tmpGukNm,''),tmpDepartNm,''),'>',' > ')}"/></span>						
					</td>
					<td>${item.ofcpsNm}</td>	
					<td>${item.emplyrNm}</td>		
					<td>${item.emailAdres}</td>		
					<td>${item.officeTel}</td>		
					<td>${item.userId}</td>						
					<td>
						<button type="button" class="btn blue sm" onclick="setEmployeeInfo('${item.userId}');">적용</button>
					</td>
				</tr>
				
				</c:if>
				
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(employeeList) == 0}">
				<!-- 조회된 자료가 없을 시 -->
				<tr>
					<td colspan="7">직원정보가 없습니다.</td>
				</tr>
				</c:if>
				
			</tbody>
		</table>	
   	</div>
		    
</div> <!--//win-popup-->

</body>
</html>