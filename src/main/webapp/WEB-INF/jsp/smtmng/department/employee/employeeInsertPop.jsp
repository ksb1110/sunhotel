<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>등록 - 직원정보 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록
function insertEmployee() {
	
	//부서
	var departCode = $.trim($("#insert_form select[name=departCode]").val());
	if(departCode.length < 1) {
		alert("부서를 선택해주세요.");
		$("select[name=departCode]").focus();
		
		return false;
	}
	
	//이름
	var name = $.trim($("#insert_form input[name='name']").val());
	if(name.length < 1) {
		alert("이름을 입력해주세요.");
		$("input[name='name']").focus();
		
		return false;
	}
	
	/*
	//직원아이디
	var userId = $.trim($("#insert_form input[name='userId']").val());
	if(userId.length < 1) {
		alert("직원아이디를 입력해주세요.");
		$("input[name='userId']").focus();
		
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
			url:"<c:url value='/smtmng/department/employee/employeeInsert.ezax'/>",
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

//국변경
function changeGuk() {
	
	var sGukCode = $("select[name='sGukCode']").val();	
	var url = "<c:url value='/smtmng/department/employee/employeeInsertPop.ez?sGukCode='/>" + sGukCode;
	
	document.location.href = url;
}

//부서변경
function changeDepart() {
	
	var sDepartCode = $("select[name='departCode']").val();	
	var url = "<c:url value='/smtmng/department/employee/employeeInsertPop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode='/>" + sDepartCode;
	
	document.location.href = url;
}

//직원정보불러오기
function employeeLoadPop() {
	
	var sDepartCode = $("select[name='departCode']").val();	
	var sTeamCode = $("select[name='teamCode']").val();
	
	var url = "${pageContext.request.contextPath}/smtmng/department/employee/employeeLoadPop.ez";
	url += "?sDepartCode=" + sDepartCode;
	url += "&sTeamCode=" + sTeamCode;
	window.open(url, "employeeLoad", 'resizable=yes,scrollbars=yes,width=1000,height=700');
}

//직원정보 반영
function setEmployeeInfo(userId) {
	
	//직원 아이디
	var userId = userId;
	
	//값 세팅
	$("#employee_load_form input[name='userId']").val(userId);
	
	var parameters = $("#employee_load_form").serialize();
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/employee/employeeLoadOneData.ezax'/>",
		data:parameters ,
		success:function(data){
			if(data.result == "${Constant.FLAG_N}") {
				
				alert(data.errorMessage);
			} 
			else {
				
				//직원정보
				var employeeInfo = data.officePartVO;
				
				//직원정보가 있으면
				if(employeeInfo) {
					
					//팀코드
					var oTeamCode = employeeInfo.officeCd;
					if(!checkOptionValue("select[name='teamCode']",oTeamCode)) {
						oTeamCode = "";
					}
					$("select[name='teamCode']").val(oTeamCode);
					
					//이름
					var oName = employeeInfo.emplyrNm;
					$("input[name='name']").val(oName);
					
					//직원아이디
					var oUserId = employeeInfo.userId;
					$("input[name='userId']").val(oUserId);
					
					//전화번호
					var oTel = employeeInfo.officeTel;
					$("input[name='tel']").val(oTel);
					
					//직위
					var oPosition = employeeInfo.ofcpsNm;
					$("input[name='position']").val(oPosition);
					
					//이메일
					var oEmail = employeeInfo.emailAdres;
					$("input[name='email']").val(oEmail);
					
					//담당업무
					var oJob = employeeInfo.officePtMemo;
					$("textarea[name='job']").val(oJob);
					
					//네비게이션정보
					var oNavigator = employeeInfo.officeNms;
					$("input[name='navigator']").val(oNavigator);
				}
			}
		}
	});
}

//담당업무내용을 디스플레이정보 업무로 가져오기
function copyJob() {
	
	var job = $("textarea[name='job']").val();
	$("textarea[name='deskJob']").val(job);
}

//셀렉트 옵션에 해당 값이 존재하는지 체크
function checkOptionValue(obj,optionVal) {
	
	var exists = false; 
	
	$("option",obj).each(function(){ 
		
		if (this.value == optionVal) { 
			
			exists = true; 
			return false; 
		} 
	});
	
	return exists;
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">직원정보등록</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
            	
            	<c:if test="${not empty searchVO.sDepartCode}">
            	<!-- <button type="button" class="btn green sm" onclick="employeeLoadPop();">직원정보불러오기</button> -->
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	</c:if>
            	
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
            
        </div>
    </div> <!--//title-wrapper-->
    
    
    
    <form name="employee_load_form" id="employee_load_form" style="display:none;">
    	<input type="hidden" name="departCode" value="${searchVO.sDepartCode}">
   		<input type="hidden" name="userId" value="">
    </form>
    	    
    <form name="insert_form" id="insert_form" method="post" enctype="multipart/form-data" onsubmit="insertEmployee();return false;">
    
    <!-- API 등록확연 여부 : API로 등록한게 아니기 때문에 N -->
    <input type="hidden" name="apiCheckFlag" value="N">
    
    <div style="padding:5px;font-size:13px;">
    * 수동 등록모드 입니다. 도 통합 직원정보로 등록하시려면 목록 상단 갱신 버튼을 이용해주세요.
    </div>
    
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 15%">
                <col style="width: 35%">
                <col style="width: 15%">
                <col style="width: 35%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            부서
                        </div>  
                    </th>
                    <td>
			   			<select name="sGukCode" onchange="changeGuk();">
			   				<option value="">== 국 ==</option>
			   				<c:forEach var="item" items="${orgCodeList}">
			   				<option value="${item.code}" <c:if test="${item.code == searchVO.sGukCode}">selected</c:if>>${item.name}</option>
			   				</c:forEach>
			   			</select>
			   			<select name="departCode" onchange="changeDepart();">
			   				<option value="">== 부서 ==</option>
			   				<c:forEach var="item" items="${departCodeList}">
			   				<option value="${item.departCode}" <c:if test="${item.departCode == searchVO.sDepartCode}">selected</c:if>>${item.departName}</option>
			   				</c:forEach>
			   			</select>
                    </td>
                    <th>팀</th>
                    <td>
			   			<select name="teamCode">
			   				<option value="">== 팀 ==</option>
			   				<c:forEach var="item" items="${teamCodeList}">
			   				<option value="${item.teamCode}">${item.teamName}</option>
			   				</c:forEach>
			   			</select>
                    </td>
                </tr>
                
                <c:if test="${not empty searchVO.sDepartCode}">
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            이름
                        </div>    
                    </th>
                    <td>
                   	 	<input type="text" name="name" style="width:100%;">
                    </td>
                    <th>직원아이디</th>
                    <td>                    	
                   	 	<input type="text" name="userId" style="width:100%;">
                    </td>
                </tr>
                <tr>
                    <th>직위</th>
                    <td>
                   	 	<input type="text" name="position" style="width:100%;">
                    </td>
                    <th>전화번호</th>
                    <td>                    	
                   	 	<input type="text" name="tel" style="width:100%;">
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                   	 	<input type="text" name="email" style="width:100%;">
                    </td>
                    <th>정렬순서</th>
                    <td>                    	
                        <select name="employeeSort">
                        	<c:forEach var="item" begin="1" end="${nextSort}" step="1">                        	
                        		<option value="${item}" <c:if test="${nextSort == item}">selected</c:if>>${item}</option>
                        	</c:forEach>                        	
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>네비정보</th>
                    <td colspan="3">
                   	 	<input type="text" name="navigator" style="width:100%;">
                    </td>
                </tr>
                <tr>
                    <th>담당업무</th>
                    <td colspan="3">
                   	 	<textarea name="job" style="width:100%;height:120px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>경로안내</th>
                    <td colspan="3">
                   	 	<label><input type="radio" name="routeFlag" value="Y" checked> 안내함</label>
                   	 	&nbsp;&nbsp;
                   	 	<label><input type="radio" name="routeFlag" value="N"> 안내안함</label>
                   	 	&nbsp;&nbsp;&nbsp;
                   	 	<span style="color:blue;">* 직원검색 결과에서 해당 직원의 위치를 안내해줄지 여부를 설정합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>복무연계</th>
                    <td colspan="3">
                   	 	<label><input type="radio" name="emptyApplyFlag" value="Y" checked> 연계함</label>
                   	 	&nbsp;&nbsp;
                   	 	<label><input type="radio" name="emptyApplyFlag" value="N"> 연계안함</label>
                   	 	&nbsp;&nbsp;&nbsp;
                   	 	<span style="color:blue;">* 직원안내도에서 복무정보를 보여줄지 여부를 설정합니다.</span>
                    </td>
                </tr>
       		</tbody>
       	</table>
       	
       	
       	<h2 class="title2">디스플레이정보</h2>
       	
       	<table class="table-row th-left">
            <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 20%">
                <col style="width: 30%">
            </colgroup>
            <tbody>
                <tr>
                    <th>사진 (109 x 150)</th>
                    <td colspan="3">
                        <input type="file" class="width100" name="upfile">
                    </td>
                </tr>
                <tr>
                    <th>업무</th>
                    <td colspan="3">
                   	 	<textarea name="deskJob" style="width:100%;height:120px;"></textarea>
                        <br />
                        <button type="button" class="btn green sm" onclick="copyJob();">담당업무내용 가져오기</button>
                    </td>
                </tr>
                </c:if>
                
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
    	
    	<c:if test="${not empty searchVO.sDepartCode}">
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