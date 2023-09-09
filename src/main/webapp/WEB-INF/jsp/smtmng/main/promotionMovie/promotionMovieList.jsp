<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>홍보영상관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//홍보영상 등록 팝업
function insertPromotionMoviePop() {
	window.open("${pageContext.request.contextPath}/smtmng/main/promotionMovie/promotionMovieInsertPop.ez", "promotionMovieInsert", 'resizable=yes,scrollbars=yes,width=850,height=400');	
}

//홍보영상 수정 팝업
function updatePromotionMoviePop(seq) {
    window.open("${pageContext.request.contextPath}/smtmng/main/promotionMovie/promotionMovieUpdatePop.ez?sSeq=" + seq, "promotionMovieUpdate", 'resizable=yes,scrollbars=yes,width=850,height=850');
}

//홍보영상 삭제
function deletePromotionMovie(seq) {
	
	//삭제할 홍보영상 셋팅
	$("#delete_promotion_movie_form input[name=seq]").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_promotion_movie_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/main/promotionMovie/promotionMovieDelete.ezax'/>",
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
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="promotionMovie"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">홍보영상관리</h2>                    
           	
           	<form name="delete_promotion_movie_form" id="delete_promotion_movie_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form>
           	
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">
					
					<div style="float:left;color:blue;font-size:14px;line-height:150%;padding-bottom:5px;">
						* 키오스크와 직원배치도에 랜덤으로 1개가 노출됩니다. (표시여부에 체크된 영상중 1개)
					</div>
					
		    		<table class="table center">
						<colgroup>
							<col style="width:200px;">
							<col>
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>홍보영상</th>
								<th>제목</th>
								<th>표시여부</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(promotionMovieList) > 0}">
							<c:forEach items="${promotionMovieList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.showFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.utubeUrl}">
									<!--유튜브정보-->
									<div class="photo_info">
										<div class="video" style="text-align:center;padding-top:10px;">
											<iframe width="180" height="100" src="${item.utubeUrl}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</div>
									<!--//유튜브정보-->
									</c:if>
									<c:if test="${empty item.utubeUrl}">
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
									<button type="button" class="btn blue sm" onclick="updatePromotionMoviePop('${item.seq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deletePromotionMovie('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(promotionMovieList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="4">등록된 홍보영상이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertPromotionMoviePop();">홍보영상등록</button>
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