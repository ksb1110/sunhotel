<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 가까운시설 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertNearbyFacility() {
	 
	//시설선택
	var nearbyFacilityCode = $.trim($("select[name='nearbyFacilityCode']").val());
	if(nearbyFacilityCode.length < 1) {
		alert("가까운시설을 선택해주세요.");
		$("select[name='nearbyFacilityCode']").focus();
		
		return false;
	}
	
	/*
	//가까운시설
	var upfile = $.trim($("input[name=upfile]").val());
	if(upfile.length < 1) {
		alert("가까운시설를 입력해주세요.");
		$("input[name=upfile]").focus();
		
		return false;
	}
	*/
	
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
			url:"<c:url value='/smtmng/building/nearbyFacility/nearbyFacilityInsert.ezax'/>",
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
            <h3 class="title2">[${centerFacilityVO.facilityName}] 에서 가까운 [${codeVO.name}] 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertNearbyFacility();return false;">
    
    <input type="hidden" name="centerFacilityCode" value="${searchVO.sCenterFacilityCode}">
    <input type="hidden" name="nearbyFacilityGubun" value="${searchVO.sNearbyFacilityGubun}">
    <input type="hidden" name="nearbyGuideType" value="${searchVO.sNearbyGuideType}">
    <input type="hidden" name="nearbyOrder" value="${nextSort}">
		
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
                    <td colspan="3">
                        <select name="nearbyFacilityCode">
                        	<option value="">== 가까운 시설 선택 ==</option>
                        	<c:forEach var="item" items="${nearbyFacilityList}">
                        	<option value="${item.facilityCode}">${buildingNameMap.get(item.buildingCode)} - ${floorNameMap.get(item.floorCode)} - ${item.facilityName}</option>
                        	</c:forEach>
                        </select>
                    </td>
                </tr>
                
                <%-- <tr>
                    <th>정렬순서</th>
                    <td colspan="3">
                        <select name="nearbyOrder">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${nextSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr> --%>
                <tr>
                    <th>표시여부</th>
                    <td colspan="3">
                        <label><input type="radio" name="showFlag" value="Y" checked> 예, 표시합니다.</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="showFlag" value="N"> 아니오, 표시하지 않습니다.</label>
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