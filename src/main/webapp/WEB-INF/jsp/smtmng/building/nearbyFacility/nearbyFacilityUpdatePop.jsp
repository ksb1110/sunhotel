<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 가까운시설 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateNearbyFacility() {
	
	// confirm.ins=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/nearbyFacility/nearbyFacilityUpdate.ezax'/>",
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
            <h3 class="title2">[${centerFacilityVO.facilityName}] 에서 가까운 [${codeVO.name}] 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="delete_form" id="delete_form" method="post">
    	<input type="hidden" name="nearbySeq" value="${nearbyFacilityVO.nearbySeq}">
    </form>
    
    <form name="update_form" id="update_form" method="post" onsubmit="updateNearbyFacility();return false;">
    
    <input type="hidden" name="nearbySeq" value="${nearbyFacilityVO.nearbySeq}">
    <input type="hidden" name="centerFacilityCode" value="${nearbyFacilityVO.centerFacilityCode}">
    <input type="hidden" name="nearbyFacilityGubun" value="${nearbyFacilityVO.nearbyFacilityGubun}">
    <input type="hidden" name="nearbyGuideType" value="${nearbyFacilityVO.nearbyGuideType}">
		
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
                            가까운시설
                        </div>                    	
                    </th>
                    <td colspan="3">${buildingNameMap.get(buildingCode)} - ${floorNameMap.get(floorCode)} - ${nearbyFacilityVO.nearbyFacilityName}</td>
                </tr>
                
                <tr>
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="nearbyOrder">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${item == nearbyFacilityVO.nearbyOrder}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>표시여부</th>
                    <td colspan="3">
                        <label><input type="radio" name="showFlag" value="Y" <c:if test="${nearbyFacilityVO.showFlag == 'Y'}">checked</c:if>> 예, 표시합니다.</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="showFlag" value="N" <c:if test="${nearbyFacilityVO.showFlag == 'N'}">checked</c:if>> 아니오, 표시하지 않습니다.</label>
                    </td>
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