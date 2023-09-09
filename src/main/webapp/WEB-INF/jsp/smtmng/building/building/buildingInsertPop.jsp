<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 건물정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertBuilding() {
	 
	//건물
	var buildingCode = $.trim($("select[name=buildingCode]").val());
	if(buildingCode.length < 1) {
		alert("건물을 선택해주세요.");
		$("select[name=buildingCode]").focus();
		
		return false;
	}
	
	/*
	//건물정보
	var upfile = $.trim($("input[name=upfile]").val());
	if(upfile.length < 1) {
		alert("건물정보를 입력해주세요.");
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
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/building/buildingInsert.ezax'/>",
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

//건물코드 변경
function changeBuildingCode() {
	
	var buildingCode = $("select[name=buildingCode]").val();
	var buildingName = "";
	
	if(buildingCode.length > 0) {
		
		buildingName = $("select[name=buildingCode] option:selected").html();
	}
	
	//값 세팅
	$("input[name=buildingName]").val(buildingName);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">건물정보 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" enctype="multipart/form-data" onsubmit="insertBuilding();return false;">
	
	<input type="hidden" name="buildingName" value="">
	
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
                            건물명
                        </div>                    	
                    </th>
                    <td colspan="3">
                        <select name="buildingCode" onchange="changeBuildingCode();">
                        	<option value="">==건물선택==</option>
                        	<c:forEach var="item" items="${buildingCodeList}">                        	
                        		<option value="${item.code}">${item.name}</option>
                        	</c:forEach>                    	
                        </select>
                        <div style="color:red;float:right;padding-top:10px;">* 건물은 코드관리 메뉴에서 관리되고 있습니다.</div>
                    </td>
                </tr>
                <tr>
                    <th>건물이미지</th>
                    <td colspan="3">
                        <input type="file" class="width100" name="upfile">
                    </td>
                </tr>
                <tr>
                    <th>층수</th>
                    <td>
                        <select name="floorUpCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="20" step="1">                        	
                        		<option value="${item}">${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                    <th><!-- 지하층수 --></th>
                    <td>
                    	<!-- 
                        <select name="floorDownCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="5" step="1">                        	
                        		<option value="${item}">${item}</option>
                        	</c:forEach>                    	
                        </select>
                        -->
                    </td>
                </tr>
                <tr>
                    <th>건물입구</th>
                    <td>
                        <select name="entranceCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="10" step="1">                        	
                        		<option value="${item}">${item}개</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                    <th>엘리베이터수</th>
                    <td>
                        <select name="elevatorCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="10" step="1">                        	
                        		<option value="${item}">${item}</option>
                        	</c:forEach>                    	
                        </select>
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