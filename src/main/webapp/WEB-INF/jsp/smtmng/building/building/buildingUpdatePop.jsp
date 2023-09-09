<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 건물정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateBuilding() {
	
	/*
	//건물
	var buildingNameCode = $.trim($("select[name=buildingCode]").val());
	if(buildingNameCode.length < 1) {
		alert("건물을 선택해주세요.");
		$("select[name=buildingCode]").focus();
		
		return false;
	}
	*/
	/*
	//건물정보
	var upfile = $.trim($("input[name=upfile]").val());
	if(upfile.length < 1) {
		alert("건물정보를 입력해주세요.");
		$("input[name=upfile]").focus();
		
		return false;
	}
	*/
	
	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/building/buildingUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					//self.close();
					document.location.reload();
				}
			}
		});
	}
}

//이미지 삭제
function deleteImg() {
	
	// confirm.del=삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		
		var parameters = new FormData($('#delete_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/building/building/buildingImageDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					//적용되었습니다.
					document.location.reload();
				}
			}
		});
	}
}

//이미지 보기
function viewFile(filePath) {
	
	window.open(filePath);
}
</script>

</head>
<body>	

<div class="win-popup">
   
   <!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li class="active">
                <a href="#buildingInfo">건물정보</a>
            </li>
            <li>
                <a href="<c:url value="/smtmng/building/building/floorImgUpdatePop.ez?sBuildingCode=${searchVO.sBuildingCode}"/>">층별이미지</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
            

    
    <form name="delete_form" id="delete_form" method="post">
    	<input type="hidden" name="buildingCode" value="${buildingVO.buildingCode}">
    </form>
    
    <form name="update_form" id="update_form" method="post" enctype="multipart/form-data" onsubmit="updateBuilding();return false;">
	
	<input type="hidden" name="buildingCode" value="${buildingVO.buildingCode}">
	
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
                    <td>
						<input type="text" name="buildingName" value="${buildingVO.buildingName}">
                    </td>
                    <th>건물코드</th>
                    <td>${buildingVO.buildingCode}</td>
                </tr>
                <tr>
                    <th>건물이미지</th>
                    <td colspan="3">
                        <c:if test="${buildingVO.buildingImage == null || buildingVO.buildingImage == ''}">
                           	<div>
                           		<input class="width100" type="file" name="upfile">
                           	</div>
                          	</c:if>
                          	<c:if test="${buildingVO.buildingImage != null && buildingVO.buildingImage != ''}">
                           	<div>
                           		<img src="${buildingVO.buildingImage}" width="180">
                           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<button type="button" class="btn green sm" onclick="viewFile('${buildingVO.buildingImage}');">보기</button>
								<button type="button" class="btn red sm" onclick="deleteImg();">삭제</button>
                           	</div>
                      	</c:if>
                    </td>
                </tr>
                <tr>
                    <th>층수</th>
                    <td>
                        <select name="floorUpCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="20" step="1">                        	
                        		<option value="${item}" <c:if test="${buildingVO.floorUpCnt == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                    <th><!-- 지하층수 --></th>
                    <td>
                    	<!-- 
                        <select name="floorDownCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="5" step="1">                        	
                        		<option value="${item}" <c:if test="${buildingVO.floorDownCnt == item}">selected</c:if>>${item}</option>
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
                        		<option value="${item}" <c:if test="${buildingVO.entranceCnt == item}">selected</c:if>>${item}개</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                    <th>엘리베이터수</th>
                    <td>
                        <select name="elevatorCnt">
                        	<option value="0">없음</option>
                        	<c:forEach var="item" begin="1" end="10" step="1">                        	
                        		<option value="${item}" <c:if test="${buildingVO.elevatorCnt == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                    	
                        </select>
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