<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원안내도 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//홍보이미지정보 등록 팝업
function insertPromotionImgPop() {
	window.open("${pageContext.request.contextPath}/smtmng/department/arrange/displayPromotionImgInsertPop.ez?sFacilityCode=${searchVO.sFacilityCode}", "promotionInsert", 'resizable=yes,scrollbars=yes,width=800,height=400');	
}

//홍보이미지정보 수정 팝업
function updatePromotionImgPop(scrollSeq) {
    window.open("${pageContext.request.contextPath}/smtmng/department/arrange/displayPromotionImgUpdatePop.ez?sFacilityCode=${searchVO.sFacilityCode}&sScrollSeq=" + scrollSeq, "promotionUpdate", 'resizable=yes,scrollbars=yes,width=800,height=550');
}

//홍보이미지정보 삭제
function deletePromotionImg(scrollSeq) {
	
	//삭제할 홍보이미지정보 셋팅
	$("#delete_promotion_img_form input[name='scrollSeq']").val(scrollSeq);
	
	//confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = $("#delete_promotion_img_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/arrange/displayPromotionImgDelete.ezax'/>",
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

//홍보구분 정보 수정
function updatePromotion() {
	
	if(confirm("홍보형태을 수정하시겠습니까?")){
		
		var parameters = $("#update_promotion_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/arrange/displayPromotionUpdate.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					alert("수정되었습니다.");
					//document.location.reload();
				}
			}
		});
	}
}

//정렬순서를 변경한다.
function changeSort(scrollSeq, sort) {
	
	//변경할 홍보이미지정보 셋팅
	$("#sort_promotion_form input[name='scrollSeq']").val(scrollSeq);
	$("#sort_promotion_form input[name='scrollSort']").val(sort);
	
	var parameters = $("#sort_promotion_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/arrange/displayPromotionImgSortChange.ezax'/>",
		data:parameters,
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

//목록으로 이동
function goList() {
	document.location.href = "/smtmng/department/arrange/arrangeList.ez";
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="arrange"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">직원안내도</h2>                    
           	
           	<c:if test="${not empty facilityVO}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li>
                        <a href="<c:url value="/smtmng/department/arrange/arrangeUpdateForm.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">직원안내도</a>
                    </li>
                    <li class="active">
                        <a href="<c:url value="/smtmng/department/arrange/displayPromotionForm.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">홍보이미지관리</a>
                    </li>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
            </c:if>
            
		    <div class="item-col3-wrapper">
		    	
		    	<div class="table-wrapper">
					
					<form name="delete_promotion_img_form" id="delete_promotion_img_form" style="display:none;">
		           		<input type="hidden" name="scrollSeq" value="">
		           	</form>
		           	
		           	<form name="sort_promotion_form" id="sort_promotion_form" style="display:none;">
		           		<input type="hidden" name="facilityCode" value="${searchVO.sFacilityCode}">
		           		<input type="hidden" name="scrollSeq" value="">
		           		<input type="hidden" name="scrollSort" value="">
		           	</form>
		           	
					<form name="update_promotion_form" id="update_promotion_form" method="post">    
		    		<input type="hidden" name="facilityCode" value="${searchVO.sFacilityCode}">
		    		
		           	<div class="table-wrapper"> 
			        	<table class="table-row th-left">
				            <colgroup>
				                <col style="width:200px;">
				                <col>
				            </colgroup>
				            <tbody>
				           		<tr>
				                    <th>시설</th>
				                    <td>
				                    	${facilityVO.facilityName}   
				                    </td>
				                </tr>
				           		<tr>
				                    <th>홍보형태</th>
				                    <td>
				                    	<div style="color:blue;">
				                    		* 홍보이미지를 선택할 경우 등록된 홍보 이미지 중 1개가 랜덤으로 조직도 화면에 일정시간 주기로 표시됩니다.
				                    		(홍보이미지를 등록하지 않은 경우 제주시 알리미 이미지가 적용됩니다.)
				                    		<br>
				                    		* 제주시알리미를 선택할 경우 제주시 메인에 나오는 알리미 이미지 중 2개가 랜덤으로 조직도 화면에 일정시간 주기로 표시됩니다.
				                    	</div>
				                    					                    	
				                    	<c:forEach var="item" items="${promotionGubunCodeList}">
				                    	<label><input type="radio" name="promotionGubun" value="${item.code}" <c:if test="${displayPromotionVO.promotionGubun == item.code}">checked</c:if>> ${item.name}</label> 
				                    	&nbsp;&nbsp;&nbsp;
				                    	</c:forEach>
				                    	&nbsp;&nbsp;
										<button type="button" class="btn green sm" onclick="updatePromotion();">수정</button> 	
				                    </td>
				                </tr>
				        	</tbody>
			    		</table>
			   		</div>
			   		
			   			<!-- 
							$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
							마지막은 다른 데이터로 변경하면 됨.
						-->
            			<input type="hidden" name="parsingPrevent" value="">
            
			   		</form>
			   		
			   		<h2 class="title2">홍보이미지</h2>     
			   		
		    		<table class="table center">
						<colgroup>
							<!-- <col style="width:180px;"> -->
							<col>
							<col style="width:15%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<!-- <th>순서</th> -->
								<th>제목</th>
								<th>이미지</th>
								<th>표시여부</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(displayPromotionImgList) > 0}">
							<c:forEach items="${displayPromotionImgList}" var="item" varStatus="status">
							<tr>
								<!-- 
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<select name="scrollSort" onchange="changeSort('${item.scrollSeq}',$(this).val());">
			                        	<c:forEach var="item2" begin="1" end="${nextSort}" step="1">                        	
			                        		<option value="${item2}" <c:if test="${item.scrollSort == item2}">selected</c:if>>${item2}</option>
			                        	</c:forEach>                        	
			                        </select>
								</td>
								-->
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.imgTitle}</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>									
									<c:if test="${item.imgPath != null && item.imgPath != ''}">
			                           	<div>
			                           		<img src="${item.imgPath}" height="40" onclick="viewFile('${item.imgPath}');" style="cursor:pointer;">
			                           	</div>
			                      	</c:if>                  	
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.showFlag eq 'Y'}">
									표시함
									</c:if>
									
									<c:if test="${item.showFlag eq 'N'}">
									표시안함
									</c:if>
								</td>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updatePromotionImgPop('${item.scrollSeq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deletePromotionImg('${item.scrollSeq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(displayPromotionImgList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="4">등록된 홍보 이미지가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertPromotionImgPop();">홍보이미지등록</button>
						<button type="button" class="btn" onclick="goList();">목록</button>
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