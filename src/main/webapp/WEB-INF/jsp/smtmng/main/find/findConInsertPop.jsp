<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 부서바로찾기관리 - 메인관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertFindCon() {
	 
	//건물내외구분
	var conInOutGubun = $("input[name='conInOutGubun']:checked").val();
	
	//내부선택이면
	if(conInOutGubun == "I") {
		
		//연결시설 필수 체크
		var facilityCode = $.trim($("select[name='facilityCode']").val());
		if(facilityCode.length < 1) {
			alert("연결시설을 선택해주세요.");
			return false;
		}
	}
	
	//명칭 필수체크
	var conName = $.trim($("input[name='conName']").val());
	if(conName.length < 1) {
		alert("명칭을 입력해주세요.");
		return false;
	}
	
	// confirm.ins=등록하시겠습니까?
	if(confirm("<spring:message code='confirm.ins'/>")){
		
		var parameters = new FormData($('#insert_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/main/find/findConInsert.ezax'/>",
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
	
//건물내외구분 변경 이벤트
function changeInOutGubun() {
	
	//건물내외구분
	var conInOutGubun = $("input[name='conInOutGubun']:checked").val();
	
	//내부선택이면
	if(conInOutGubun == "I") {
		$(".inOutGubunA").show();
		$(".inOutGubunB").hide();
	}
	//외부선택이면
	else if(conInOutGubun == "O") {
		$(".inOutGubunA").hide();
		$(".inOutGubunB").show();
	}
}

//시설을 선택한 경우
function setConName() {
	var selectedFacilityVal = $("select[name='facilityCode']").val();
	var selectedFacilityName = $("select[name='facilityCode'] option:selected").html();
	
	if(selectedFacilityVal == "") {
		selectedFacilityName = "";
	}
	else {
		selectedFacilityName = selectedFacilityName.substring(18);
	}
	
	$("input[name='conName']").val(selectedFacilityName);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">[${findVO.findTitle}] 연결정보 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" action="<c:url value='/smtmng/main/find/findConInsert.ezax'/>" enctype="multipart/form-data" onsubmit="insertFindCon();return false;">
    
    <input type="hidden" name="findSeq" value="${searchVO.sFindSeq}">
		
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 25%">
                <col style="width: 75%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            건물내외구분
                        </div>                    	
                    </th>
                    <td>
                        <label><input type="radio" name="conInOutGubun" value="I" onchange="changeInOutGubun();" checked> 내부</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="conInOutGubun" value="O" onchange="changeInOutGubun();"> 외부</label>
                    </td>
                </tr>
                
                <tr class="inOutGubunA">
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
                    			<select name="facilityCode" onchange="setConName();">
		                        	<option value="">==시설선택==</option>
		                        	<c:forEach var="item" items="${facilityVOList}">
		                        	<option value="${item.facilityCode}">[${item.facilityCode}] ${item.facilityName}</option>
		                        	</c:forEach>
		                        </select>
                    		</c:otherwise>
                    	</c:choose>
                        
                    </td>
            	</tr>
            	
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            표시명
                        </div>                    	
                    </th>
                    <td>
                        <input type="text" class="width100" name="conName">
                    </td>
                </tr>
                
                <tr class="inOutGubunB" style="display:none;">
                    <th>간단설명</th>
                    <td>
                        <textarea name="conDesc" style="width:100%;"></textarea>
                    </td>
                </tr>
                <tr class="inOutGubunB" style="display:none;">
                    <th>이미지</th>
                    <td>
                        <input type="file" class="width100" name="upfile">
                    </td>
                </tr>
                
                <tr>
                    <th>정렬순서</th>
                    <td>
                        <select name="conSort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${nextSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>표시여부</th>
                    <td>
                        <label><input type="radio" name="conShowFlag" value="Y" checked> 예, 표시합니다.</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="conShowFlag" value="N"> 아니오, 표시하지 않습니다.</label>
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