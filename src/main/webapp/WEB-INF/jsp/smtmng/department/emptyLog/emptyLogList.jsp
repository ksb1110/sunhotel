<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<c:set var="today" value="<%=new Date()%>" />
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>" />

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원부재중관리 - 부서정보 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertEmptyLogPop() {
	window.open("${pageContext.request.contextPath}/smtmng/department/emptyLog/emptyLogInsertPop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}", "employeeInsert", 'resizable=yes,scrollbars=yes,width=540,height=430');	
}

//내역 팝업
function listEmptyLogPop(userId) {
    window.open("${pageContext.request.contextPath}/smtmng/department/emptyLog/emptyLogListPop.ez?sUserId=" + userId, "employeeUpdate", 'resizable=yes,scrollbars=yes,width=900,height=750');
}

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex){
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/department/emptyLog/emptyLogList.ez'/>";
	document.frm.submit();
}

//국변경
function changeGuk() {
	var sGukCode = $("select[name='sGukCode']").val();	
	var url = "<c:url value="/smtmng/department/emptyLog/emptyLogList.ez?sGukCode="/>" + sGukCode;
	
	document.location.href = url;
}

//부서변경
function changeDepart() {
	var sDepartCode = $("select[name='sDepartCode']").val();	
	var url = "<c:url value="/smtmng/department/emptyLog/emptyLogList.ez?sGukCode=${searchVO.sGukCode}&sDepartCode="/>" + sDepartCode;
	
	document.location.href = url;
}

//팀변경
function changeTeam() {
	var sTeamCode = $("select[name='sTeamCode']").val();	
	var url = "<c:url value="/smtmng/department/emptyLog/emptyLogList.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}&sTeamCode="/>" + sTeamCode;
	
	document.location.href = url;
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="emptyLog"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">직원부재중관리</h2>     
            
      		<c:if test="${not empty orgCodeList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li <c:if test="${empty searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/emptyLog/emptyLogList.ez"/>">전체</a>
                    </li>
                	<c:forEach var="item" items="${orgCodeList}">
                    <li <c:if test="${item.code == searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/emptyLog/emptyLogList.ez?sGukCode=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
           	
           	<form name="delete_emptyLog_form" id="delete_emptyLog_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	</form>
           	
           	<br />
           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search('1');return false;">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
				
					<div class="table-wrapper">
						
						<table class="table">
							<colgroup>
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">국</th>
							   		<td>
							   			<select name="sGukCode" onchange="changeGuk();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${orgCodeList}">
							   				<option value="${item.code}" <c:if test="${item.code == searchVO.sGukCode}">selected</c:if>>${item.name}</option>
							   				</c:forEach>
							   			</select>
							   		</td>
							   		
							   		<th class="text-left">부서/읍면동</th>
							   		<td>
							   			<select name="sDepartCode" onchange="changeDepart();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${departCodeList}">
							   				<option value="${item.departCode}" <c:if test="${item.departCode == searchVO.sDepartCode}">selected</c:if>>${item.departName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>	
							   									   		
							   		<th class="text-left">팀</th>
							   		<td>
							   			<select name="sTeamCode" onchange="changeTeam();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${teamCodeList}">
							   				<option value="${item.teamCode}" <c:if test="${item.teamCode == searchVO.sTeamCode}">selected</c:if>>${item.teamName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>	
							    </tr>
							</tbody>
						</table>
						
						<table class="table" style="margin-top:5px;">
							<colgroup>
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:300px;">
								<col style="width:200px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>							   								   		
							   		<th class="text-left">이름</th>
							   		<td><input type="text" id="sName" class="width100" name="sName" value="${searchVO.sName}" ></td>					   		
							   		<th class="text-left">부재중기간</th>
							   		<td colspan="3">
							   			<span class="date-wrap">
				                        <input type="text" class="width100 datepicker" name="sEmptyStartDay" value="${searchVO.sEmptyStartDay}">
				                        </span>
				                        
				                        <select name="sEmptyStartHour">
				                        	<c:forEach begin="0" end="23" step="1" var="no">
					                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
					                        	<option value="${hour}" <c:if test="${searchVO.sEmptyStartHour == hour}">selected</c:if>>${hour}시</option>
				                        	</c:forEach>	
				                        </select>
				                        
				                        <select name="sEmptyStartMinute">
				                        	<c:forEach begin="0" end="50" step="10" var="no">
					                        	<fmt:formatNumber var="minute" minIntegerDigits="2" value="${no}" type="number"/>
					                        	<option value="${minute}" <c:if test="${searchVO.sEmptyStartMinute == minute}">selected</c:if>>${minute}분</option>
				                        	</c:forEach>	     	
				                        </select>
				                        &nbsp;&nbsp;
				                        ~
				                        &nbsp;&nbsp;
				                        <span class="date-wrap">
				                        <input type="text" class="width100 datepicker" name="sEmptyEndDay" value="${searchVO.sEmptyEndDay}">
				                        </span>
				                        
				                        <select name="sEmptyEndHour">
				                        	<c:forEach begin="0" end="23" step="1" var="no">
					                        	<fmt:formatNumber var="hour" minIntegerDigits="2" value="${no}" type="number"/>
					                        	<option value="${hour}" <c:if test="${searchVO.sEmptyEndHour == hour}">selected</c:if>>${hour}시</option>
				                        	</c:forEach>	         	
				                        </select>
				                        
				                        <select name="sEmptyEndMinute">
				                        	<c:forEach begin="0" end="50" step="10" var="no">
					                        	<fmt:formatNumber var="minute" minIntegerDigits="2" value="${no}" type="number"/>
					                        	<option value="${minute}" <c:if test="${searchVO.sEmptyEndMinute == minute}">selected</c:if>>${minute}분</option>
				                        	</c:forEach>	        	
				                        </select>
							   		</td>
									<td style="border:0;text-align:center;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/department/emptyLog/emptyLogList.ez?sBuildingCode='/>';">전체</button>
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
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:200px;">
							<col>
							<col style="width:200px;">
							<col style="width:200px;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>부서명</th>
								<th>팀명</th>
								<th>직위</th>
								<th>이름</th>
								<th>아이디</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.departName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.teamName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.position}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.name}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.userId}</td>
																						
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="listEmptyLogPop('${item.userId}');">부재중정보</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="7">등록된 직원부재중 정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<!--
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertEmptyLogPop();">직원부재중정보등록</button>
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
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

<script>
$(function(){
	
	//시작일
    $("input[name='sEmptyStartDay']").datepicker({
    	showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
    	onSelect: function(selectedDate) {     
    		$("input[name='sEmptyEndDay']").datepicker("option","minDate", selectedDate)
		}
    });
	
  	//종료일
	$("input[name='sEmptyEndDay']").datepicker({
		showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
		onSelect: function(selectedDate) {     
			$("input[name='sEmptyStartDay']").datepicker("option","maxDate", selectedDate)
		}
	});
})
</script>

</body>
</html>