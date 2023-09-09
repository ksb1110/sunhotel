<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>관리자 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//관리자 등록 팝업
function insertAdminPop() {
	window.open("${pageContext.request.contextPath}/smtmng/system/admin/adminInsertPop.ez", "adminInsert", 'resizable=yes,scrollbars=yes,width=800,height=400');	
}

//관리자 수정 팝업
function updateAdminPop(seq) {
    window.open("${pageContext.request.contextPath}/smtmng/system/admin/adminUpdatePop.ez?sSeq=" + seq, "adminUpdate", 'resizable=yes,scrollbars=yes,width=800,height=430');
}

//관리자 삭제
function deleteAdmin(seq) {
	
	//삭제할 관리자 셋팅
	$("#delete_admin_form input[name=seq]").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_admin_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/system/admin/adminDelete.ezax'/>",
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
		<jsp:param name="admin_menu2" value="admin"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">관리자</h2>                    
           	
           	<form name="delete_admin_form" id="delete_admin_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center" style="width:800px;">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 30%">
							<col style="width: 30%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>관리자아이디</th>
								<th>관리자명</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(adminList) > 0}">
							<c:forEach items="${adminList}" var="item" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${item.userId}</td>
								<td>${item.userNm}</td>
								<td>
									<button type="button" class="btn blue sm" onclick="updateAdminPop('${item.seq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteAdmin('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(adminList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="4">등록된 관리자가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap" style="width:800px;">
						<button type="button" class="btn blue" onclick="insertAdminPop();">관리자등록</button>
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