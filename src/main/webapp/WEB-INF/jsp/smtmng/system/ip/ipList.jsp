<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>접근IP설정관리 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertIpPop() {
	window.open("${pageContext.request.contextPath}/smtmng/system/ip/ipInsertPop.ez", "ipInsert", 'resizable=yes,scrollbars=yes,width=800,height=500');	
}

//수정 팝업
function updateIpPop(seq) {
    window.open("${pageContext.request.contextPath}/smtmng/system/ip/ipUpdatePop.ez?sSeq=" + seq, "ipUpdate", 'resizable=yes,scrollbars=yes,width=800,height=650');
}

//삭제
function deleteIp(seq) {
	
	//값 셋팅
	$("#delete_ip_form input[name=seq]").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		var parameters = $("#delete_ip_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/system/ip/ipDelete.ezax'/>",
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
	$("#sort_ip_form input[name=seq]").val(seq);
	$("#sort_ip_form input[name=sort]").val(sort);
	
	var parameters = $("#sort_ip_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/system/ip/ipSortChange.ezax'/>",
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

//아이피 검색
function searchIp() {
	
	//숫자 정규식
	var number_re = /^[0-9]+$/;
	
	//아이피
	var sStartIpPoint1 = $.trim($("input[name='sStartIpPoint1']").val());
	var sStartIpPoint2 = $.trim($("input[name='sStartIpPoint2']").val());
	var sStartIpPoint3 = $.trim($("input[name='sStartIpPoint3']").val());
	var sStartIpPoint4 = $.trim($("input[name='sStartIpPoint4']").val());
	
	//아이피가 한개라도 입력되어 있으면
	if(sStartIpPoint1.length > 0 || sStartIpPoint3.length > 0 || sStartIpPoint3.length > 0 || sStartIpPoint4.length > 0) {
		
		//아이피 체크
		if(sStartIpPoint1.length < 1 || sStartIpPoint2.length < 1 || sStartIpPoint3.length < 1 || sStartIpPoint4.length < 1) {

			alert("아이피를 올바르게 입력해주세요.");
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(sStartIpPoint1)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='sStartIpPoint1']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(sStartIpPoint2)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='sStartIpPoint2']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(sStartIpPoint3)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='sStartIpPoint3']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(sStartIpPoint4)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='sStartIpPoint4']").focus();
			
			return false;
		}
	}
	
	return true;
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="system"/>
		<jsp:param name="admin_menu2" value="ip"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">접근IP설정관리</h2>                    
           	
           	<form name="delete_ip_form" id="delete_ip_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form>
           	
           	<form name="sort_ip_form" id="sort_ip_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           
           	<form name="search_form" id="search_form" method="get" action="/smtmng/system/ip/ipList.ez" onSubmit="return searchIp();">
			
				<div class="table-wrapper">
					<table class="table">
						<colgroup>
							<col style="width:80px;">
							<col style="width:180px;">
							<col style="width:80px;">
							<col style="width:180px;">
							<col style="width:80px;">
							<col style="width:300px;">
							<col style="width:180px;">
						   	<col>
						</colgroup>
						<tbody>
						   	<tr>
						   		<th class="text-left">허용구분</th>
						   		<td>
						   			<select name="sLimitGubun">
			                        	<option value="">==전체==</option>
			                        	<option value="A" <c:if test="${searchVO.sLimitGubun == 'A'}">selected</c:if>>허용</option>
			                        	<option value="B" <c:if test="${searchVO.sLimitGubun == 'B'}">selected</c:if>>차단</option>              	
			                        </select>
						   		</td>
						   		
						   		<th class="text-left">범위</th>
						   		<td>
						   			<select name="sRangeGubun">
			                        	<option value="">==전체==</option>
			                        	<option value="A" <c:if test="${searchVO.sRangeGubun == 'A'}">selected</c:if>>단일아이피</option>
			                        	<option value="B" <c:if test="${searchVO.sRangeGubun == 'B'}">selected</c:if>>아이피대역</option>                    	
			                        </select>
						   		</td>
						   		
						   		<th class="text-left">아이피</th>
						   		<td>
						   			<input type="text" class="width20" name="sStartIpPoint1" maxlength="3" style="text-align:center;" value="<c:out value='${searchVO.sStartIpPoint1}'/>">
						   			.
						   			<input type="text" class="width20" name="sStartIpPoint2" maxlength="3" style="text-align:center;" value="<c:out value='${searchVO.sStartIpPoint2}'/>">
						   			.
						   			<input type="text" class="width20" name="sStartIpPoint3" maxlength="3" style="text-align:center;" value="<c:out value='${searchVO.sStartIpPoint3}'/>">
						   			.
						   			<input type="text" class="width20" name="sStartIpPoint4" maxlength="3" style="text-align:center;" value="<c:out value='${searchVO.sStartIpPoint4}'/>">
						   		</td>
								
						   		<td style="border:0;">
									<button type="submit" class="btn blue">검색</button>
									<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/system/ip/ipList.ez'/>';">전체</button>
								</td>									
						    </tr>
						</tbody>
					</table>
				</div>
			</form>
			
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">
					
					<div style="float:left;color:blue;font-size:14px;line-height:150%;padding-bottom:5px;">
						* 직원안내도 페이지에 접근할 수 있는 IP 목록 입니다.
					</div>
					
		    		<table class="table center">
						<colgroup>
							<col style="width:200px;">
							<col style="width:200px;">
							<col>
							<col>
							<col style="width:200px;">
							<col style="width:200px;">
						</colgroup>
						<thead>
							<tr>
								<th>허용구분</th>
								<th>범위</th>
								<th>아이피</th>
								<th>접근기간</th>
								<th>적용여부</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(ipList) > 0}">
							<c:forEach items="${ipList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.limitGubun == 'A'}"> <!-- 허용 -->
									<span class="label green">허용</span>
									</c:if>
									
									<c:if test="${item.limitGubun == 'B'}"> <!-- 차단 -->
									<span class="label red">차단</span>
									</c:if>
									
								</td>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.rangeGubun == 'A'}"> <!-- 단일이면 -->
									단일아이피
									</c:if>
									
									<c:if test="${item.rangeGubun == 'B'}"> <!-- 범위이면 -->
									아이피대역
									</c:if>
									
								</td>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.rangeGubun == 'A'}"> <!-- 단일이면 -->
									${item.startIpPoint}
									</c:if>
									
									<c:if test="${item.rangeGubun == 'B'}"> <!-- 범위이면 -->
									${item.startIpPoint} ~ ${item.endIpPoint}
									</c:if>
									
								</td>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.periodFlag == 'Y'}"> <!-- 접근기간이 설정되어 있으면 -->
									${item.startDate} ~ ${item.endDate}
									</c:if>
									
									<c:if test="${item.periodFlag == 'N'}"> <!-- 접근기간이 설정되어 있지 않으면 -->
									기간설정없음
									</c:if>
								</td>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									
									<c:if test="${item.useFlag == 'Y'}"> <!-- 적용 -->
									<img src="/images/admin/icon/temp/blue_check.png" alt="체크">
									</c:if>
									
								</td>
								<td <c:if test="${item.useFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateIpPop('${item.seq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteIp('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(ipList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="6">등록된 아이피이 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertIpPop();">아이피등록</button>
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