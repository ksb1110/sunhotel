<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>자막관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertSubtitlePop() {
	window.open("${pageContext.request.contextPath}/smtmng/main/subtitle/subtitleInsertPop.ez", "subtitleInsert", 'resizable=yes,scrollbars=yes,width=800,height=500');	
}

//수정 팝업
function updateSubtitlePop(seq) {
    window.open("${pageContext.request.contextPath}/smtmng/main/subtitle/subtitleUpdatePop.ez?sSeq=" + seq, "subtitleUpdate", 'resizable=yes,scrollbars=yes,width=800,height=650');
}

//삭제
function deleteSubtitle(seq) {
	
	//값 셋팅
	$("#delete_subtitle_form input[name=seq]").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_subtitle_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/main/subtitle/subtitleDelete.ezax'/>",
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
function changeSort(seq, sort) {
	
	//변경할 캠페인 셋팅
	$("#sort_subtitle_form input[name=seq]").val(seq);
	$("#sort_subtitle_form input[name=sort]").val(sort);
	
	var parameters = $("#sort_subtitle_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/main/subtitle/subtitleSortChange.ezax'/>",
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
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="subtitle"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">자막관리</h2>                    
           	
           	<form name="delete_subtitle_form" id="delete_subtitle_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form>
           	
           	<form name="sort_subtitle_form" id="sort_subtitle_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:150px;">
							<col>
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>순서</th>
								<th>자막</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(subtitleList) > 0}">
							<c:forEach items="${subtitleList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<select name="sort" onchange="changeSort('${item.seq}',$(this).val());">
			                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
			                        		<option value="${item2}" <c:if test="${item.sort == item2}">selected</c:if>>${item2}</option>
			                        	</c:forEach>                        	
			                        </select>
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.subtitle}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									${fn:substring(item.startDttm,0,16)}
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									${fn:substring(item.endDttm,0,16)}
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateSubtitlePop('${item.seq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteSubtitle('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(subtitleList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 자막이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertSubtitlePop();">자막등록</button>
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