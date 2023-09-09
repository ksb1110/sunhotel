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

<title>디스플레이관리 - 장비관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertDisplayPop() {
	window.open("${pageContext.request.contextPath}/smtmng/equipment/display/displayInsertPop.ez", "displayInsert", 'resizable=yes,scrollbars=yes,width=700,height=600');	
}

//수정 팝업
function updateDisplayPop(displayCode) {
    window.open("${pageContext.request.contextPath}/smtmng/equipment/display/displayUpdatePop.ez?sDisplayCode=" + displayCode, "displayUpdate", 'resizable=yes,scrollbars=yes,width=700,height=600');
}

//삭제
function deleteDisplay(displayCode) {
	
	//삭제할 데이터 셋팅
	$("#delete_display_form input[name='displayCode']").val(displayCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_display_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/equipment/display/displayDelete.ezax'/>",
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
		<jsp:param name="admin_menu" value="equipment"/>
		<jsp:param name="admin_menu2" value="display"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">디스플레이장비</h2>                    
           	
           	<form name="delete_display_form" id="delete_display_form" style="display:none;">
           	<input type="hidden" name="displayCode" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:120px;">
							<col style="width:200px;">
							<col style="width:220px;">
							<col style="width:300px;">
							<col>
							<col style="width:180px;">
						</colgroup>
						<thead>
							<tr>
								<th>디스플레이코드</th>
								<th>디스플레이장비명</th>
								<th>연결시설</th>
								<th>설치장소</th>
								<th>참고사항</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(displayList) > 0}">
							<c:forEach items="${displayList}" var="item" varStatus="status">
							<tr>
								<td>${item.displayCode}</td>
								<td>${item.name}</td>
								<td>
									<c:if test="${not empty item.facilityCode}">								
									${item.facilityName}
									<br />									
									(${item.facilityCode})
									</c:if>
								</td>
								<td>${item.place}</td>
								<td>
									<!-- jstl로 변환처리 -->
									<c:set var="cmt" value="${fn:replace(item.etc,lt2,lt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,gt2,gt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									
									<!-- 화면에 출력하기 -->
									<c:out value="${cmt}" escapeXml="false"/> 
								</td>
								<td>
									<button type="button" class="btn blue sm" onclick="updateDisplayPop('${item.displayCode}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteDisplay('${item.displayCode}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(displayList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="6">등록된 디스플레이장비가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertDisplayPop();">디스플레이장비등록</button>
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