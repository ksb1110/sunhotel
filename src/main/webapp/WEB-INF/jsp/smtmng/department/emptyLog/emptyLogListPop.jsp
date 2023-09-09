<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
pageContext.setAttribute("cr", "\r");
pageContext.setAttribute("cn", "\n");
pageContext.setAttribute("crcn", "\r\n");
pageContext.setAttribute("sp", "&nbsp;");
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("lt1", "&lt;");
pageContext.setAttribute("gt1", "&gt;");
pageContext.setAttribute("lt2", "<");
pageContext.setAttribute("gt2", ">");
%>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>부재중내역 - 직원부재중관리 - 부서정보 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertEmptyLogPop() {
	window.open("${pageContext.request.contextPath}/smtmng/department/emptyLog/emptyLogInsertPop.ez?sUserId=${searchVO.sUserId}", "emptyLogInsert", 'resizable=yes,scrollbars=yes,width=540,height=430');	
}

//수정 팝업
function updateEmptyLogPop(emptySeq) {
    window.open("${pageContext.request.contextPath}/smtmng/department/emptyLog/emptyLogUpdatePop.ez?sUserId=${searchVO.sUserId}&sEmptySeq=" + emptySeq, "emptyLogUpdate", 'resizable=yes,scrollbars=yes,width=540,height=430');
}

//삭제 팝업
function deleteEmptyLogPop(emptySeq) {
	
	//키 셋팅
	$("#delete_emptyLog_form input[name=emptySeq]").val(emptySeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_emptyLog_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/emptyLog/emptyLogDelete.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					document.location.reload();
					opener.location.reload();
				}
			}
		});
	}
}

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex){
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/department/emptyLog/emptyLogListPop.ez'/>";
	document.frm.submit();
}
</script>

</head>

<body>
<div class="win-popup">
	
	<div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">[${employeeVO.name}] 부재중내역</h3>
        </div>
    </div> <!--//title-wrapper-->
		
		
            
           	<form name="delete_emptyLog_form" id="delete_emptyLog_form" style="display:none;">
           	<input type="hidden" name="userId" value="${searchVO.sUserId}">
           	<input type="hidden" name="emptySeq" value="">
           	</form>
           	
           	<br />
           	
		    <div class="item-col3-wrapper">
		    	
				<h3 class="title2">
					검색결과 <small>[총 <strong class="text-blue">${paginationInfo.totalRecordCount}</strong>건]</small>
				</h3>
								
		    	<div class="table-wrapper">

		    		<table class="table center">
						<colgroup>
							<col style="width:30%;">
							<col style="width:30%;">
							<col style="width:20%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th>부재중 시작시각</th>
								<th>부재중 종료시각</th>
								<th>부재중 내용</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td>${fn:substring(item.emptyStartDttm,0,16)}</td>
								<td>${fn:substring(item.emptyEndDttm,0,16)}</td>
								<td>
									<c:if test="${item.emptyGubun == 'A'}">
									휴가
									</c:if>
									<c:if test="${item.emptyGubun == 'B'}">
									출장
									</c:if>
									(${item.emptyCodeNm})
								</td>
								<!-- 
								<td>
									<c:set var="cmt" value="${fn:replace(item.emptyDesc,lt2,lt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,gt2,gt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									
									<c:out value="${cmt}" escapeXml="false"/> 
								</td>
								-->
								 														
								<td>
									<!-- 
									<button type="button" class="btn blue sm" onclick="updateEmptyLogPop('${item.emptySeq}');">수정</button>
								 	-->
									<button type="button" class="btn red sm" onclick="deleteEmptyLogPop('${item.emptySeq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="3">등록된 직원부재중정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<!--
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertEmptyLogPop();">[${employeeVO.name}] 부재중정보추가</button>
					</div>
					-->
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