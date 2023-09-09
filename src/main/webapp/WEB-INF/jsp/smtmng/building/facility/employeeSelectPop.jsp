<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원검색 - 직원관리 - 부서정보 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.


/**
 * 조회 & 페이징
 */
function fn_Search(){
	document.frm.action = "<c:url value='/smtmng/building/facility/selectEmployeePop.ez'/>";
	document.frm.submit();
}

//국변경
function changeGuk() {
	var sGukCode = $("select[name='sGukCode']").val();	
	var url = "<c:url value="/smtmng/building/facility/selectEmployeePop.ez?sFacilityCode=${searchVO.sFacilityCode}&sGukCode="/>" + sGukCode;
	
	document.location.href = url;
}

//부서변경
function changeDepart() {
	var sDepartCode = $("select[name='sDepartCode']").val();	
	var url = "<c:url value="/smtmng/building/facility/selectEmployeePop.ez?sFacilityCode=${searchVO.sFacilityCode}&sGukCode=${searchVO.sGukCode}&sDepartCode="/>" + sDepartCode;
	
	document.location.href = url;
}

//팀변경
function changeTeam() {
	var sTeamCode = $("select[name='sTeamCode']").val();	
	var url = "<c:url value="/smtmng/building/facility/selectEmployeePop.ez?sFacilityCode=${searchVO.sFacilityCode}&sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}&sTeamCode="/>" + sTeamCode;
	
	document.location.href = url;
}

//직원선택
function choiceEmployee(employeeSeq, name) {
	//부모창에 함수가 있으면 실행
	if(typeof(opener.choiceEmployee) == "function") {
		opener.choiceEmployee(employeeSeq, name);
		self.close();
	}
	else {
		alert("호출페이지에 함수가 없습니다.");
	}
}

//선택직원 일괄 등록
function applyAllEmployee() {
	
	//체크한 박스 
	var checkedCnt = $("input[name='oneCheckBox[]']:checked").length;
	
	if(checkedCnt < 1) {
		alert("서설에 연결할 직원을 체크해주세요.")
		return;
	}
	
	//체크된 직원의 id 값을 @로 붙여서 문자열로 만든다.
	var employeeSeqsStr = "";
	var no = 0;
	$("input[name='oneCheckBox[]']:checked").each(function() {
		var sEmployeeSeq = $.trim($(this).val());
		
		if(no == 0) {
			employeeSeqsStr += sEmployeeSeq;
		}
		else {
			employeeSeqsStr += "@" + sEmployeeSeq;
		}
		
		no++;
	});
	
	//알림 메시지
	var alarmMsg = "선택한 직원을 등록하시겠습니까?";
	
	if(confirm(alarmMsg)) {
		
		//값 셋팅
		$("#all_employee_apply_form input[name='employeeSeqsStr']").val(employeeSeqsStr);
		
		var parameters = $("#all_employee_apply_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/facility/updateEmployeeAllApply.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}"){
					alert(data.errorMessage);
				} else {
					alert(data.errorMessage);
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}

//직원 전체체크
function allCheck() {
	
	//전체 체크되어 있으면 개별도 전체 체크한다.
	if($("#allCheckBox").is(":checked")) {
		$("input[name='oneCheckBox[]']").each(function() {
			this.checked = true;
		});
	}
	//전체 체크되어 있이 않으면 개별도 전체 해제한다.
	else {
		$("input[name='oneCheckBox[]']").each(function() {
			this.checked = false;
		});
	}
}

//직원 개별체크
function oneCheck(obj) {
	//개별 체크되어 있으면
	if($(obj).is(":checked")) {
		//개별이 전부 체크되어 있으면 전체도 체크
		if($("input[name='oneCheckBox[]']").length == $("input[name='oneCheckBox[]']:checked").length) {
			//전체 체크 
			$("#allCheckBox").each(function() {
				this.checked = true;
			});
		}
	}
	//개별 체크되어 있지 않으면 
	else {
		//전체 체크 해제
		$("#allCheckBox").each(function() {
			this.checked = false;
		});
	}
}
</script>

</head>

<body>
<div class="win-popup">
           
           	<form name="all_employee_apply_form" id="all_employee_apply_form" style="display:none;">
           		<input type="hidden" name="employeeSeqsStr" value="">
		    	<input type="hidden" name="sFacilityCode" value="${searchVO.sFacilityCode}">
           	</form>
           	
           	<form name="delete_employee_form" id="delete_employee_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	</form>
           	           	           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="frm" id="frm" method="post" onSubmit="fn_Search();return false;">
		    		<input type="hidden" name="sFacilityCode" value="${searchVO.sFacilityCode}">
				
					<div class="table-wrapper">
						
						<table class="table" style="margin-top:5px;">
							<colgroup>
								<col style="width:80px;">
								<col>
								<col style="width:80px;">
								<col style="width:150px;">
							   	<col style="width:200px;">
							</colgroup>
							<tbody>
							   	<tr>	   								   		
							   		<th class="text-left">부서</th>
							   		<td>
							   			<select name="sGukCode" onchange="changeGuk();">
							   				<option value="">== 국 ==</option>
							   				<c:forEach var="item" items="${orgCodeList}">
							   				<option value="${item.code}" <c:if test="${item.code == searchVO.sGukCode}">selected</c:if>>${item.name}</option>
							   				</c:forEach>
							   			</select>
							   			
							   			<select name="sDepartCode" onchange="changeDepart();">
							   				<option value="">== 부서 ==</option>
							   				<c:forEach var="item" items="${departCodeList}">
							   				<option value="${item.departCode}" <c:if test="${item.departCode == searchVO.sDepartCode}">selected</c:if>>${item.departName}</option>
							   				</c:forEach>
							   			</select>
							   			
							   			<select name="sTeamCode" onchange="changeTeam();">
							   				<option value="">== 팀 ==</option>
							   				<c:forEach var="item" items="${teamCodeList}">
							   				<option value="${item.teamCode}" <c:if test="${item.teamCode == searchVO.sTeamCode}">selected</c:if>>${item.teamName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>								   								   		
							   		<th class="text-left">이름</th>
							   		<td><input type="text" id="sName" class="width100" name="sName" value="${searchVO.sName}" ></td>	
									<td style="border:0;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/building/facility/selectEmployeePop.ez?sBuildingCode='/>';">전체</button>
									</td>									
							    </tr>
							</tbody>
						</table>
					</div>
				</form>
				
				<div class="align-col2-wrapper">
				
					<div class="l-area">
	                   	<button type="button" class="btn black" onclick="applyAllEmployee();">선택직원 일괄 등록</button>
	                </div>
	                <div class="r-area">
	                </div>
				
				</div>
				
		    	<div class="table-wrapper">

		    		<table class="table center">
						<colgroup>
							<col style="width:40px;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="allCheckBox" value="1" onclick="allCheck();"></th>
								<th>부서명</th>
								<th>팀명</th>
								<th>직위</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(employeeList) > 0}">
							<c:forEach items="${employeeList}" var="item" varStatus="status">
							<tr>
								<td><input type="checkbox" name="oneCheckBox[]" value="${item.employeeSeq}" onclick="oneCheck($(this));"></td>
								<td>${item.departName}</td>
								<td>${item.teamName}</td>
								<td>${item.position}</td>
								<td>${item.name}</td>		
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(employeeList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="5">등록된 직원정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
		    	</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               

</div> <!--//wrap-->

</body>
</html>