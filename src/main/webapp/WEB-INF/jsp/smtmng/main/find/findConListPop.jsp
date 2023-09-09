<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>연결정보 - 부서바로찾기 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

<c:if test="${fn:length(findConList) == 0 || findVO.findGubun == 'B'}">
//등록 팝업
function insertFindConPop() {
	window.open("${pageContext.request.contextPath}/smtmng/main/find/findConInsertPop.ez?sFindSeq=${searchVO.sFindSeq}", "insertFindConPop", 'resizable=yes,scrollbars=yes,width=600,height=600');	
}
</c:if>

//수정 팝업
function updateFindConPop(conSeq) {
    window.open("${pageContext.request.contextPath}/smtmng/main/find/findConUpdatePop.ez?sFindSeq=${searchVO.sFindSeq}&sConSeq=" + conSeq, "updateFindConPop", 'resizable=yes,scrollbars=yes,width=800,height=550');
}

//삭제
function deleteFindCon(conSeq) {
	
	//삭제할 값 셋팅
	$("#delete_form input[name='conSeq']").val(conSeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/main/find/findConDelete.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					opener.location.reload();
					document.location.reload();
				}
			}
		});
	}
}

//정렬순서를 변경한다.
function changeSort(conSeq, conSort) {
	
	//변경할 캠페인 셋팅
	$("#sort_find_form input[name='conSeq']").val(conSeq);
	$("#sort_find_form input[name='conSort']").val(conSort);
	
	var parameters = $("#sort_find_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/main/find/findConSortChange.ezax'/>",
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

<div class="win-popup">
    
    <h3 class="title2">
		${findVO.findTitle} &gt; 연결정보
	</h3>
	
	<form name="delete_form" id="delete_form" style="display:none;">
    	<input type="hidden" name="findSeq" value="${searchVO.sFindSeq}">
    	<input type="hidden" name="conSeq" value="">
    </form>
    
    <form name="sort_find_form" id="sort_find_form" style="display:none;">
    	<input type="hidden" name="findSeq" value="${searchVO.sFindSeq}">
    	<input type="hidden" name="conSeq" value="">
    	<input type="hidden" name="conSort" value="">
    </form> 
        	      	
   	<div class="table-wrapper">

   		<table class="table center">
			<colgroup>
				<col style="width:80px;">
				<col style="width:80px;">
				<col style="width:150px;">
				<col>
				<col style="width:80px;">
				<col style="width:80px;">
				<col style="width:150px;">
			</colgroup>
			<thead>
				<tr>
					<th>정렬순서</th>
					<th>건물내외</th>
					<th>연결시설</th>
					<th>표시명</th>
					<th>이미지</th>
					<th>표시여부</th>
					<th>관리툴</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(findConList) > 0}">
				<c:forEach items="${findConList}" var="item" varStatus="status">
				<tr>
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						<select name="conSort" onchange="changeSort('${item.conSeq}',$(this).val());">
                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item2}" <c:if test="${item.conSort == item2}">selected</c:if>>${item2}</option>
                        	</c:forEach>                        	
                        </select>
					</td>
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						<c:choose>
							<c:when test="${item.conInOutGubun == 'I'}">
							내부
							</c:when>
							<c:otherwise>
							외부
							</c:otherwise>
						</c:choose>
						
					</td>	
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						<c:if test="${item.conInOutGubun == 'I'}">
							${item.facilityName}
							<br />
							[${item.facilityCode}]
						</c:if>
						<c:if test="${item.conInOutGubun == 'O'}">
						-
						</c:if>
					</td>	
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						${item.conName}
					</td>	
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
					
						<c:if test="${item.conInOutGubun == 'O'}">
							<c:if test="${not empty item.conImg}">
								<img src="${item.conImg}" width="50" onclick="viewFile('${item.conImg}');" style="cursor:pointer;">
							</c:if>
							<c:if test="${empty item.conImg}">
								미등록
							</c:if>
						</c:if>
						<c:if test="${item.conInOutGubun == 'I'}">
						-
						</c:if>
					</td>	
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						<c:if test="${item.conShowFlag eq 'Y'}">
						표시함
						</c:if>
						
						<c:if test="${item.conShowFlag eq 'N'}">
						표시안함
						</c:if>
					</td>						
					<td <c:if test="${item.conShowFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
						<button type="button" class="btn blue sm" onclick="updateFindConPop('${item.conSeq}');">수정</button>
						<button type="button" class="btn red sm" onclick="deleteFindCon('${item.conSeq}');">삭제</button>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(findConList) == 0}">
				<!-- 조회된 자료가 없을 시 -->
				<tr>
					<td colspan="7">연결된 정보가 없습니다.</td>
				</tr>
				</c:if>
				
			</tbody>
		</table>
		
		<c:if test="${fn:length(findConList) == 0 || findVO.findGubun == 'B'}">
		<div class="btn-wrap">
			<button type="button" class="btn blue" onclick="insertFindConPop();">연결정보등록</button>
		</div>
		</c:if>
		
   	</div>
		    
</div> <!--//win-popup-->

</body>
</html>