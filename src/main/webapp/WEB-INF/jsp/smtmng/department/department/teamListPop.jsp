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

//팀전체갱신
function insertAllTeam() {
	
	if(confirm("${departmentVO.departName}의 팀을 전부 삭제하고 전체 재등록하시겠습니까?")){
		
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
			url:"<c:url value='/smtmng/department/department/teamInsertAll.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					opener.location.reload();
					self.location.reload();
				}
			}
		});
	}
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li>
                <a href="<c:url value="/smtmng/department/department/departmentUpdatePop.ez?sDepartCode=${searchVO.sDepartCode}"/>">부서정보</a>
            </li>
            
            <c:if test="${departmentVO.gukCode != '1001000000000'}">
            <li class="active">
                <a href="#departmentInfo">팀정보</a>
            </li>
            </c:if>
            
            <li>
                <a href="<c:url value="/smtmng/department/department/connectFacilityListPop.ez?sDepartCode=${searchVO.sDepartCode}"/>">연결시설</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
    
    <h3 class="title2">
		${departmentVO.gukName} &gt; ${departmentVO.departName} &gt; 팀정보
	</h3>
	
	<form name="delete_form" id="delete_form" style="display:none;">
    	<input type="hidden" name="departCode" value="">
    	<input type="hidden" name="teamCode" value="">
    </form>
    
    <form name="insert_all_form" id="insert_all_form" style="display:none;">
    	<input type="hidden" name="departCode" value="${departmentVO.departCode}">
    	<input type="hidden" name="departName" value="${departmentVO.departName}">
    </form>
          	
   	<div class="table-wrapper">

   		<table class="table center">
			<colgroup>
				<col style="width:150px;">
				<col>
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:150px;">
			</colgroup>
			<thead>
				<tr>
					<th>팀코드</th>
					<th>팀명</th>
					<th>팀명초성</th>
					<th>순서</th>
					<th>관리툴</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(teamVOList) > 0}">
				<c:forEach items="${teamVOList}" var="item" varStatus="status">
				<tr>
					<td>${item.teamCode}</td>
					<td>${item.teamName}</td>	
					<td>${item.teamNameCho}</td>	
					<td>${item.teamSort}</td>						
					<td>
						<button type="button" class="btn blue sm" onclick="updateTeamPop('${item.departCode}','${item.teamCode}');">수정</button>
						<button type="button" class="btn red sm" onclick="deleteTeam('${item.departCode}','${item.teamCode}');">삭제</button>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(teamVOList) == 0}">
				<!-- 조회된 자료가 없을 시 -->
				<tr>
					<td colspan="5">등록된 팀정보가 없습니다.</td>
				</tr>
				</c:if>
				
			</tbody>
		</table>
		
		<div class="btn-wrap">
			<button type="button" class="btn green" onclick="insertAllTeam();">팀전체갱신</button>
			<button type="button" class="btn blue" onclick="insertTeamPop();">개별등록</button>
		</div>
   	</div>
		    
</div> <!--//win-popup-->

</body>
</html>