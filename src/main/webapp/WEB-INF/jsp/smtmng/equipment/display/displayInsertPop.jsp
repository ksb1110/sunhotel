<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 디스플레이장비 - 장비관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertDisplay() {
	 
	//디스플레이
	var displayCode = $.trim($("select[name='displayCode']").val());
	if(displayCode.length < 1) {
		alert("디스플레이를 선택해주세요.");
		$("select[name='displayCode']").focus();
		
		return false;
	}
	
	//디스플레이명
	var name = $.trim($("input[name='name']").val());
	if(name.length < 1) {
		alert("디스플레이장비명을 입력해주세요.");
		$("input[name='name']").focus();
		
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
			url:"<c:url value='/smtmng/equipment/display/displayInsert.ezax'/>",
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

//디스플레이명 셋팅
function setDisplayName() {
	
	//디스플레이명
	var name = $.trim($("select[name='displayCode'] option:selected").html());
	
	//디스플레이명 셋팅
	$("input[name='name']").val(name);
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">디스플레이장비 등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="insert_form" id="insert_form" method="post" onsubmit="insertDisplay();return false;">
		
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
                            디스플레이
                        </div>
                    </th>
                    <td>
                 		<select name="displayCode" onchange="setDisplayName();">
                       		<option value="">==디스플레이==</option>                       		
                       		<c:forEach var="item" items="${displayCodeList}">
                       		<option value="${item.code}">${item.name}</option>
                       		</c:forEach>
                       	</select>
                        <span style="color:red;">&nbsp;&nbsp;&nbsp;* 디스플레이는 코드관리에서 관리됩니다.</span>
                    </td>
             	</tr>
                <tr>
                    <th>
                        <div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            디스플레이장비명
                        </div>
                    </th>
                    <td>
                        <input type="text" style="width:100%;" name="name">
                    </td>
             	</tr>
                <tr>
                    <th>연결시설</th>
                    <td>
                 		<select name="facilityCode">
                       		<option value="">==연결시설==</option>                       		
                       		<c:forEach var="item" items="${displayFacilityList}">
                       		<option value="${item.facilityCode}">${item.facilityName}</option>
                       		</c:forEach>
                       	</select>
                        <span style="color:red;">&nbsp;&nbsp;&nbsp;* 디스플레이 시설만 가져옵니다.</span>
                    </td>
             	</tr>
                <tr>
                    <th>설치장소</th>
                    <td>
                        <input type="text" style="width:100%;" name="place">
                    </td>
             	</tr>
                <tr>
                    <th>참고사항</th>
                    <td>
                        <textarea name="etc" style="width:100%;height:150px;"></textarea>
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