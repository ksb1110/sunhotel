<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>관리자접속로그 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex){
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/system/adminLog/adminLogList.ez'/>";
	document.frm.submit();
}

</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="system"/>
		<jsp:param name="admin_menu2" value="adminLog"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">관리자접속로그</h2>                    
           
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search('1');return false;">
		    	
				<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
					<div class="table-wrapper">
						<table class="table">
							<colgroup>
								<col style="width:80px;">
								<col style="width:180px;">
								<col style="width:80px;">
								<col style="width:180px;">
								<col style="width:80px;">
							   	<col style="width:180px;">
								<col style="width:90px;">
								<col style="width:180px;">
								<col style="width:80px;">
							   	<col>
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">시간</th>
							   		<td><input type="text" id="sRegDttm" class="width100" name="sRegDttm" value="<c:out value='${searchVO.sRegDttm}'/>" title="검색하실 시간을 입력하세요." /></td>
							   		<th class="text-left">아이디</th>
							   		<td><input type="text" id="sAdminId" class="width100" name="sAdminId" value="<c:out value='${searchVO.sAdminId}'/>" title="검색하실 아이디를 입력하세요." /></td>
									<th class="text-left">아이피</th>
									<td><input type="text" id="sIp" class="width100" name="sIp" value="<c:out value='${searchVO.sIp}'/>" title="검색하실 아이피를 입력하세요." /></td>
									<th class="text-left">액션아이디</th>
									<td><input type="text" id="sAction" class="width100" name="sAction" value="${searchVO.sAction}" title="검색하실 액션아이디를 입력하세요." /></td>
									<th class="text-left">액션내용</th>
									<td><input type="text" id="sActionDesc" class="width100" name="sActionDesc" value="${searchVO.sActionDesc}" title="검색하실 액션내용을 입력하세요." /></td>
									<td>
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/system/adminLog/adminLogList.ez'/>';">전체</button>
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
							<col style="width: 200px;">
							<col style="width: 200px;">
							<col style="width: 200px;">
							<col style="width: 200px;">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>시간</th>
								<th>아이디</th>
								<th>아이피</th>
								<th>액션아이디</th>
								<th>액션내용</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td>${item.regDttm}</td>
								<td>${item.adminId}</td>
								<td>${item.ip}</td>
								<td>${item.action}</td>
								<td>${item.actionDesc}</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 관리자접속로그가 없습니다.</td>
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
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>