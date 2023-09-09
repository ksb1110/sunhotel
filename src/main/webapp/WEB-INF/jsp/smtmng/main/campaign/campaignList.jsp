<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>캠페인이미지관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//캠페인 등록 팝업
function insertCampaignPop() {
	window.open("${pageContext.request.contextPath}/smtmng/main/campaign/campaignInsertPop.ez", "campaignInsert", 'resizable=yes,scrollbars=yes,width=800,height=400');	
}

//캠페인 수정 팝업
function updateCampaignPop(seq) {
    window.open("${pageContext.request.contextPath}/smtmng/main/campaign/campaignUpdatePop.ez?sSeq=" + seq, "campaignUpdate", 'resizable=yes,scrollbars=yes,width=800,height=550');
}

//캠페인 삭제
function deleteCampaign(seq) {
	
	//삭제할 캠페인 셋팅
	$("#delete_campaign_form input[name=seq]").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_campaign_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/main/campaign/campaignDelete.ezax'/>",
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
	$("#sort_campaign_form input[name=seq]").val(seq);
	$("#sort_campaign_form input[name=sort]").val(sort);
	
	var parameters = $("#sort_campaign_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/main/campaign/campaignSortChange.ezax'/>",
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
		<jsp:param name="admin_menu2" value="campaign"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">캠페인이미지관리</h2>                    
           	
           	<form name="delete_campaign_form" id="delete_campaign_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form>
           	
           	<form name="sort_campaign_form" id="sort_campaign_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:150px;">
							<col style="width:200px;">
							<col>
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>순서</th>
								<th>이미지</th>
								<th>제목</th>
								<th>표시여부</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(campaignList) > 0}">
							<c:forEach items="${campaignList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<select name="sort" onchange="changeSort('${item.seq}',$(this).val());">
			                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
			                        		<option value="${item2}" <c:if test="${item.sort == item2}">selected</c:if>>${item2}</option>
			                        	</c:forEach>                        	
			                        </select>
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.imgSavePath}">
									<img src="${item.imgSavePath}" width="180" onclick="viewFile('${item.imgSavePath}');" style="cursor:pointer;">
									</c:if>
									<c:if test="${empty item.imgSavePath}">
									미등록
									</c:if>
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.title}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.showFlag eq 'Y'}">
									<img src="/images/admin/icon/temp/blue_check.png" alt="체크">
									</c:if>
							
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateCampaignPop('${item.seq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteCampaign('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(campaignList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="4">등록된 캠페인이미지가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertCampaignPop();">캠페인이미지등록</button>
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