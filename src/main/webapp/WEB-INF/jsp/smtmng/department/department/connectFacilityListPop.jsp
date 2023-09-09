<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>연결시설 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertConnectFacilityPop() {
	
	//국이 선택된 경우에는 국을 파라메터로 가져간다.	
	window.open("${pageContext.request.contextPath}/smtmng/department/department/connectFacilityInsertPop.ez?sDepartCode=${searchVO.sDepartCode}", "connectFacilityInsert", 'resizable=yes,scrollbars=yes,width=700,height=400');	
}

//삭제
function deleteConnectFacility(facilityName, facilityCode, departYn) {
	
	if(departYn == "Y") {
		alert("대표시설입니다. 다른시설을 대표시설로 변경한 후 삭제가능합니다.");
		return false;
	}
	
	//값 셋팅
	$("#delete_form input[name='facilityCode']").val(facilityCode);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm(facilityName + " 시설을 삭제하시겠습니까?")) {
		
		var parameters = $("#delete_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/department/connectFacilityDelete.ezax'/>",
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

//대표시설 설정
function changeDepartYn(facilityName, facilityCode, obj) {
	
	var departYn = $(obj).val();
	
	if(departYn == "Y") {
		if(confirm(facilityName + " 시설을 대표시설로 설정하시겠습니까?")) {

			//값 셋팅
			$("#update_form input[name='facilityCode']").val(facilityCode);
			$("#update_form input[name='departYn']").val(departYn);
			
			var parameters = $("#update_form").serialize();
			$.ajax({
				type:"post", 
				dataType:"json",
				async:false,
				url:"<c:url value='/smtmng/department/department/connectFacilityUpdate.ezax'/>",
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
		else {
			$(obj).val("N");
		}
	}
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li>
                <a href="<c:url value="/smtmng/department/department/departmentUpdatePop.ez?sDepartCode=${searchVO.sDepartCode}"/>">부서정보</a>
            </li>
            
            <c:if test="${departmentVO.gukCode != '1001000000000'}">
            <li>
                <a href="<c:url value="/smtmng/department/department/teamListPop.ez?sDepartCode=${searchVO.sDepartCode}"/>">팀정보</a>
            </li>
            </c:if>
            
            <li class="active">
                <a href="#connectFacilityInfo">연결시설</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
    
    <h3 class="title2">
		${departmentVO.gukName} &gt; ${departmentVO.departName} &gt; 연결시설
	</h3>
	
	<form name="delete_form" id="delete_form" style="display:none;">
    	<input type="hidden" name="departCode" value="${searchVO.sDepartCode}">
    	<input type="hidden" name="facilityCode" value="">
    </form>
    
    <form name="update_form" id="update_form" style="display:none;">
    	<input type="hidden" name="departCode" value="${searchVO.sDepartCode}">
    	<input type="hidden" name="facilityCode" value="">
    	<input type="hidden" name="departYn" value="">
    </form>
          	
   	<div class="table-wrapper">

   		<table class="table center">
			<colgroup>
				<col style="width:160px;">
				<col>
				<col style="width:150px;">
				<col style="width:80px;">
			</colgroup>
			<thead>
				<tr>
					<th>시설코드</th>
					<th>시설명</th>
					<th>대표시설</th>
					<th>관리툴</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(facilityVOList) > 0}">
				<c:forEach items="${facilityVOList}" var="item" varStatus="status">
				<tr>
					<td>${item.facilityCode}</td>
					<td>${item.facilityName}</td>	
					<td>
						<c:if test="${item.departYn == 'N'}">
						<select name="departYn" onchange="changeDepartYn('${item.facilityName}','${item.facilityCode}',$(this));">
							<option value="Y">예</option>
							<option value="N" selected>아니오</option>
						</select>
						</c:if>
						<c:if test="${item.departYn == 'Y'}">
						예
						</c:if>
					</td>						
					<td>
						<button type="button" class="btn red sm" onclick="deleteConnectFacility('${item.facilityName}','${item.facilityCode}','${item.departYn}');">삭제</button>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(facilityVOList) == 0}">
				<!-- 조회된 자료가 없을 시 -->
				<tr>
					<td colspan="4">연결된 시설정보가 없습니다.</td>
				</tr>
				</c:if>
				
			</tbody>
		</table>
		
		<div class="btn-wrap">
			<button type="button" class="btn blue" onclick="insertConnectFacilityPop();">등록</button>
		</div>
   	</div>
		    
</div> <!--//win-popup-->

</body>
</html>