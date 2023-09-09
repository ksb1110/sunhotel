<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>팀등록 - 팀정보 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertTeam() {

	//팀
	var teamCode = $.trim($("select[name='teamCode']").val());
	if(teamCode.length < 1) {
		alert("팀 선택해주세요.");
		$("select[name='teamCode']").focus();
		
		return false;
	}
	
	//팀명 셋팅
	var teamName = $.trim($("select[name='teamCode'] option:selected").html());
	$("input[name='teamName']").val(teamName);
	
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
			url:"<c:url value='/smtmng/department/department/teamInsert.ezax'/>",
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
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">팀등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertTeam();return false;">
    <input type="hidden" name="departCode" value="${departmentVO.departCode}">
    <input type="hidden" name="teamName" value="">
		
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
                            부서
                        </div>                    	
                    </th>
                    <td colspan="3">${departmentVO.departName}</td>
                </tr>
                
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            팀
                        </div> 
                    </th>
                    <td colspan="3">
                    
                    	<c:choose>
                    		<c:when test="${empty apiDepartList}">
                    			* 등록할 팀이 없습니다.
                    		</c:when>
                    		<c:otherwise>
                    			<select name="teamCode">
		                        	<option value="">==팀선택==</option>
		                        	<c:forEach var="item" items="${apiDepartList}">
		                        	<option value="${item.officeCd}">${item.officeNm}</option>
		                        	</c:forEach>
		                        </select>
                    		</c:otherwise>
                    	</c:choose>
                        
                    </td>
            	</tr>
            	
            	<c:if test="${not empty apiDepartList}">
                <tr>
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="teamSort">
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
    	<c:if test="${not empty apiDepartList}">
        	<button type="submit" class="btn blue">등록</button>
        </c:if>
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