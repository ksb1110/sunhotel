<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>부서수정 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateDepartment() {
	 
	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/department/department/departmentUpdate.ezax'/>",
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
   
   	<!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li class="active">
                <a href="#departmentInfo">부서정보</a>
            </li>
            
            <c:if test="${departmentVO.gukCode != '1001000000000'}">
            <li>
                <a href="<c:url value="/smtmng/department/department/teamListPop.ez?sDepartCode=${searchVO.sDepartCode}"/>">팀정보</a>
            </li>
            </c:if>
            
            <li>
                <a href="<c:url value="/smtmng/department/department/connectFacilityListPop.ez?sDepartCode=${searchVO.sDepartCode}"/>">연결시설</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
    
    <form name="update_form" id="update_form" method="post" enctype="multipart/form-data" onsubmit="updateDepartment();return false;">
    <input type="hidden" name="gukCode" value="${departmentVO.gukCode}">
    <input type="hidden" name="departCode" value="${departmentVO.departCode}">
    <input type="hidden" name="gukName" value="${departmentVO.gukName}">
    <input type="hidden" name="departName" value="${departmentVO.departName}">
		
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
                    <td colspan="3">${departmentVO.gukName}</td>
                </tr>
                
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
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="sort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${departmentVO.sort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <th>초성</th>
                    <td colspan="3">${departmentVO.departNameCho}</td>
            	</tr>
                
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">수정</button>
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