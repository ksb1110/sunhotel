<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>부서등록 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertDepartment() {
	 
	//실국
	var gukCode = $.trim($("select[name='gukCode']").val());
	if(gukCode.length < 1) {
		alert("실국을 선택해주세요.");
		$("select[name='gukCode']").focus();
		
		return false;
	}
	
	//부서
	var departCode = $.trim($("select[name='departCode']").val());
	if(departCode.length < 1) {
		alert("부서를 선택해주세요.");
		$("select[name='departCode']").focus();
		
		return false;
	}
	
	//실국명 및 부서명 셋팅
	var gukName = $.trim($("select[name='gukCode'] option:selected").html());
	$("input[name='gukName']").val(gukName);
	
	var departName = $.trim($("select[name='departCode'] option:selected").html());
	$("input[name='departName']").val(departName);
	
	// confirm.ins=등록하시겠습니까?
	if(confirm("<spring:message code='confirm.ins'/>")){
		
		var parameters = new FormData($('#insert_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/department/department/departmentInsert.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}

//실국코드 변경
function changeGukCode() {
	
	var gukCode = $("select[name='gukCode']").val();
	var insertPopUrl = "/smtmng/department/department/departmentInsertPop.ez?sGukCode=" + gukCode;
	document.location.href = insertPopUrl;
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">부서등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertDepartment();return false;">
    <input type="hidden" name="gukName" value="">
    <input type="hidden" name="departName" value="">
		
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 20%">
                <col style="width: 30%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            실국
                        </div>                    	
                    </th>
                    <td colspan="3">
                        <select name="gukCode" onchange="changeGukCode();">
                        	<option value="">==실국선택==</option>
                        	<c:forEach var="item" items="${orgCodeList}">
                        	<option value="${item.code}" <c:if test="${searchVO.sGukCode == item.code}">selected</c:if>>${item.name}</option>
                        	</c:forEach>
                        </select>
                    </td>
                </tr>
                
                <c:if test="${not empty searchVO.sGukCode}">
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            부서
                        </div> 
                    </th>
                    <td colspan="3">
                        <select name="departCode">
                        	<option value="">==부서선택==</option>
                        	<c:forEach var="item" items="${apiDepartList}">
                        	<option value="${item.officeCd}">${item.officeNm}</option>
                        	</c:forEach>
                        </select>
                        <c:if test="${fn:length(apiDepartList) < 1 }">
                        <span style="color:blue;">* 더이상 등록할 부서가 없습니다.</span>
                        </c:if>
                    </td>
            	</tr>
                <tr>
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="sort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${nextSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                </c:if>
                
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">등록</button>
        <button type="button" class="btn" onclick="self.close();">닫기</button>
    </div>
	
		<!-- 
			$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
			마지막은 다른 데이터로 변경하면 됨.
		-->
		<input type="hidden" name="parsingPrevent" value="">
            
	</form>
    
</div> <!--//win-popup-->

</body>
</html>