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

<findTitle>부서바로찾기관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</findTitle>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertFindPop() {
	window.open("${pageContext.request.contextPath}/smtmng/main/find/findInsertPop.ez?sFindGubun=${searchVO.sFindGubun}", "findInsert", 'resizable=yes,scrollbars=yes,width=800,height=400');	
}

//수정 팝업
function updateFindPop(findSeq) {
    window.open("${pageContext.request.contextPath}/smtmng/main/find/findUpdatePop.ez?sFindGubun=${searchVO.sFindGubun}&sFindSeq=" + findSeq, "findUpdate", 'resizable=yes,scrollbars=yes,width=800,height=550');
}

//연결정보 팝업
function listFindConPop(findSeq) {
	window.open("${pageContext.request.contextPath}/smtmng/main/find/findConListPop.ez?sFindSeq=" + findSeq, "findConListPop", 'resizable=yes,scrollbars=yes,width=800,height=750');
}

//삭제
function deleteFind(findSeq) {
	
	//삭제할 값 셋팅
	$("#delete_find_form input[name='findSeq']").val(findSeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_find_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/main/find/findDelete.ezax'/>",
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

//정렬순서를 변경한다.
function changeSort(findSeq, findSort) {
	
	//변경할 캠페인 셋팅
	$("#findSort_find_form input[name=findSeq]").val(findSeq);
	$("#findSort_find_form input[name=findSort]").val(findSort);
	
	var parameters = $("#findSort_find_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/main/find/findSortChange.ezax'/>",
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
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="find"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">부서바로찾기관리</h2>                    
           	
           	<c:if test="${not empty findGubunCodeList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                	<c:forEach var="item" items="${findGubunCodeList}">
                    <li <c:if test="${item.code == searchVO.sFindGubun}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/main/find/findList.ez?sFindGubun=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
           	<form name="delete_find_form" id="delete_find_form" style="display:none;">
           	<input type="hidden" name="findSeq" value="">
           	</form>
           	
           	<form name="findSort_find_form" id="findSort_find_form" style="display:none;">
           	<input type="hidden" name="findGubun" value="${searchVO.sFindGubun}">
           	<input type="hidden" name="findSeq" value="">
           	<input type="hidden" name="findSort" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:150px;">
							<col>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:120px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>정렬순서</th>
								<th>명칭</th>
								<th>아이콘</th>
								<th>표시여부</th>
								<th>연결정보</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(findList) > 0}">
							<c:forEach items="${findList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<select name="findSort" onchange="changeSort('${item.findSeq}',$(this).val());">
			                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
			                        		<option value="${item2}" <c:if test="${item.findSort == item2}">selected</c:if>>${item2}</option>
			                        	</c:forEach>                        	
			                        </select>
								</td>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.findTitle}">
						
									<!-- jstl로 변환처리 -->
									<c:set var="cmt" value="${fn:replace(item.findTitle,lt2,lt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,gt2,gt1)}" />
									<c:set var="cmt" value="${fn:replace(cmt,crcn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cr,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,cn,br)}" />
									<c:set var="cmt" value="${fn:replace(cmt,' ',sp)}" />
									
									<!-- 화면에 출력하기 -->
									<c:out value="${cmt}" escapeXml="false"/> 
									
									</c:if>
								</td>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.findIconImg}">
									<img src="${item.findIconImg}" height="40" onclick="viewFile('${item.findIconImg}');" style="cursor:pointer;">
									</c:if>
									<c:if test="${empty item.findIconImg}">
									미등록
									</c:if>
								</td>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.findShowFlag eq 'Y'}">
									표시함
									</c:if>
									
									<c:if test="${item.findShowFlag eq 'N'}">
									표시안함
									</c:if>
									
								</td>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									${item.conCnt}
								</td>
								<td <c:if test="${item.findShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn green sm" onclick="listFindConPop('${item.findSeq}');">연결정보</button>
									<button type="button" class="btn blue sm" onclick="updateFindPop('${item.findSeq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteFind('${item.findSeq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(findList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="6">등록된 부서바로찾기가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertFindPop();">[${findGubunCodeMap.get(searchVO.sFindGubun)}] 등록</button>
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