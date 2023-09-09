<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>코드관리 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//코드보기
function showCode(groupCode) {
	document.location.href="${pageContext.request.contextPath}/smtmng/system/code/codeList.ez?sGroupCode=" + groupCode;	
}

//코드닫기
function hideCode() {
	document.location.href="${pageContext.request.contextPath}/smtmng/system/code/codeList.ez";	
}

//코드그룹 등록 팝업
function insertCodeGrpPop() {
    window.open("${pageContext.request.contextPath}/smtmng/system/code/codeGrpInsertPop.ez", "codeGrpInsert", 'resizable=yes,scrollbars=yes,width=800,height=300');
}

//코드그룹 수정 팝업
function updateCodeGrpPop(groupCode) {
    window.open("${pageContext.request.contextPath}/smtmng/system/code/codeGrpUpdatePop.ez?sGroupCode=" + groupCode, "codeGrpUpdate", 'resizable=yes,scrollbars=yes,width=800,height=300');
}

//코드그룹 삭제
function deleteCodeGrp(groupCode) {
	
	//삭제할 그룹코드 셋팅
	$("#delete_group_code_form input[name=groupCode]").val(groupCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_group_code_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/system/code/codeGrpDelete.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					document.location.href="${pageContext.request.contextPath}/smtmng/system/code/codeList.ez";
				}
			}
		});
	}
}

//코드 등록 팝업
function insertCodePop(groupCode) {
	window.open("${pageContext.request.contextPath}/smtmng/system/code/codeInsertPop.ez?sGroupCode=" + groupCode, "codeInsert", 'resizable=yes,scrollbars=yes,width=800,height=500');	
}

//코드 수정 팝업
function updateCodePop(groupCode, code) {
    window.open("${pageContext.request.contextPath}/smtmng/system/code/codeUpdatePop.ez?sGroupCode=" + groupCode + "&sCode=" + code, "codeUpdate", 'resizable=yes,scrollbars=yes,width=800,height=500');
}

//코드 삭제
function deleteCode(groupCode, code) {
	
	//삭제할 그룹코드, 코드 셋팅
	$("#delete_code_form input[name=groupCode]").val(groupCode);
	$("#delete_code_form input[name=code]").val(code);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_code_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/system/code/codeDelete.ezax'/>",
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
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="system"/>
		<jsp:param name="admin_menu2" value="code"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">코드관리</h2>                    
           	
           	<form name="delete_group_code_form" id="delete_group_code_form" style="display:none;">
           	<input type="hidden" name="groupCode" value="">
           	</form> 
           	
           	<form name="delete_code_form" id="delete_code_form" style="display:none;">
           	<input type="hidden" name="groupCode" value="">
           	<input type="hidden" name="code" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	<div class="col" style="width:40%;">
		    		<div class="table-title">
		    			<h3 class="title2">코드그룹 목록</h3>
		    		</div>
		    		<table class="table center">
						<colgroup>
							<col style="width: 150px;">
							<col>
							<col style="width: 250px;">
						</colgroup>
						<thead>
							<tr>
								<th>코드그룹</th>
								<th>코드그룹명</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(codeGroupList) > 0}">
							<c:forEach items="${codeGroupList}" var="item" varStatus="status">
							<tr>
								<td>${item.groupCode}</td>
								<td <c:if test="${searchVO.sGroupCode eq item.groupCode}">id="groupCodeName"</c:if>>${item.name}</td>
								<td>
									<c:choose>
										<c:when test="${searchVO.sGroupCode eq item.groupCode}">
											<button type="button" class="btn black sm" onclick="hideCode();">코드닫기</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn green sm" onclick="showCode('${item.groupCode}');">코드보기</button>
										</c:otherwise>
									</c:choose>
									<button type="button" class="btn blue sm" onclick="updateCodeGrpPop('${item.groupCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteCodeGrp('${item.groupCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(codeGroupList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="3">등록된 코드그룹이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertCodeGrpPop();">코드그룹등록</button>
					</div>
		    	</div>
		    	
		    	<c:if test="${empty searchVO.sGroupCode}">
		    	<div class="col" style="width:60%;">		    	
		    	</div>
		    	</c:if>
		    	
		    	<c:if test="${not empty searchVO.sGroupCode}">
		    	<div class="col" style="width:60%;">
		    		<div class="table-title">
		    			<h3 class="title2"><span id="groupCodeName2">[]</span> 코드 목록</h3>
		    		</div>
		    		<table class="table center">
						<colgroup>
							<col style="width:120px;">
							<col>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th>코드</th>
								<th>코드명</th>
								<th>추가정보1</th>
								<th>추가정보2</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(codeList) > 0}">
							<c:forEach items="${codeList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.code}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.name}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.add1}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.add2}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateCodePop('${item.groupCode}','${item.code}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteCode('${item.groupCode}','${item.code}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(codeList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 코드가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertCodePop('${searchVO.sGroupCode}');">코드등록</button>
					</div>
		    	</div>
		    	</c:if>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

<script>
$(function() {
	<c:if test="${not empty searchVO.sGroupCode}">
	//선택한 코드그룹이 있는 경우 코드 테이블 상단에 코드그룹명을 셋팅한다.
	var groupCodeName = $("#groupCodeName").html();
	$("#groupCodeName2").html("[" + groupCodeName + "]");
	</c:if>
});
</script>

</body>
</html>