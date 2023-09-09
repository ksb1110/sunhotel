<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 연결시설 - 부서정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertConnectFacility() {
	
	//시설체크
	var facilityCode = $.trim($("select[name='facilityCode']").val());
	if(facilityCode.length < 1) {
		alert("시설을 선택해주세요.");
		return false;
	}
	
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
			url:"<c:url value='/smtmng/department/department/connectFacilityInsert.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.opener.location.reload();
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
            <h3 class="title2">연결시설</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertConnectFacility();return false;">
	    
	    <input type="hidden" name="departCode" value="${departmentVO.departCode}">    
	    
	    <c:if test="${empty nowFacilityVOList}">
	    	<input type="hidden" name="departYn" value="Y">
	    </c:if>
	    <c:if test="${not empty nowFacilityVOList}">
	    	<input type="hidden" name="departYn" value="N">
	    </c:if>
		
	    <div class="table-wrapper">   	
	    	
	        <table class="table-row th-left">
	            <colgroup>
	                <col style="width: 30%">
	                <col style="width: 70%">
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th>
	                    	<div class="necessary-area">
	                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
	                            부서
	                        </div>                    	
	                    </th>
	                    <td>${departmentVO.departName}</td>
	                </tr>
	                
	                <tr>
	                    <th>
	                    	<div class="necessary-area">
	                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
	                            연결시설
	                        </div> 
	                    </th>
	                    <td>
	                    
	                    	<c:choose>
	                    		<c:when test="${empty facilityVOList}">
	                    			* 연결할 시설이 없습니다.
	                    		</c:when>
	                    		<c:otherwise>
	                    			<select name="facilityCode">
			                        	<option value="">==시설선택==</option>
			                        	<c:forEach var="item" items="${facilityVOList}">
			                        	<option value="${item.facilityCode}">[${item.facilityCode}] ${item.facilityName}</option>
			                        	</c:forEach>
			                        </select>
	                    		</c:otherwise>
	                    	</c:choose>
	                        
	                    </td>
	            	</tr>
	            	
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