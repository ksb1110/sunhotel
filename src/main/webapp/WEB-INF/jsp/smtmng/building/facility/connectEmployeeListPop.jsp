<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>연결직원 - 시설정보 - 청사관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertConnectEmployeePop() {
	
	//국이 선택된 경우에는 국을 파라메터로 가져간다.	
	window.open("${pageContext.request.contextPath}/smtmng/department/department/connectEmployeeInsertPop.ez?sFacilityCode=${searchVO.sFacilityCode}", "connectEmployeeInsert", 'resizable=yes,scrollbars=yes,width=700,height=400');	
}

//해제
function deleteConnectEmployee(name, employeeSeq) {
	
	//값 셋팅
	$("#delete_form input[name='employeeSeq']").val(employeeSeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm(name + " 직원을 연결해제 하시겠습니까?")) {
		
		var parameters = $("#delete_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/facility/connectEmployeeDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					document.location.reload();
				}
			}
		});
	}
}

//선택직원 일괄 해제
function deleteSelectEmployee() {
	
	//체크한 박스 
	var checkedCnt = $("input[name='oneCheckBox[]']:checked").length;
	
	if(checkedCnt < 1) {
		
		alert("연결해제할 직원을 체크해주세요.")
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
	var alarmMsg = "선택한 직원을 연결해제 하시겠습니까?";
	
	if(confirm(alarmMsg)) {
		
		//값 셋팅
		$("#all_employee_delete_form input[name='employeeSeqsStr']").val(employeeSeqsStr);
		
		var parameters = $("#all_employee_delete_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/building/facility/selectEmployeeDelete.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					document.location.reload();
				}
			}
		});
	}
}

//직원연결 검색
function selectEmployeePop() {
	
	window.open("/smtmng/building/facility/selectEmployeePop.ez?sFacilityCode=${searchVO.sFacilityCode}", "employeeSelect", 'resizable=yes,scrollbars=yes,width=1000,height=750');
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
   
    <!-- 3Depth Menu (메뉴없을 시 삭제) -->
    <nav class="depth3-menu">
        <ul>
            <li>
                <a href="<c:url value="/smtmng/building/facility/facilityUpdatePop.ez?sFacilityCode=${searchVO.sFacilityCode}"/>">시설정보</a>
            </li>
            
            <li class="active">
                <a href="#connectEmployeeInfo">연결직원</a>
            </li>
        </ul>
    </nav>
    <!-- //3Depth Menu (메뉴없을 시 삭제) -->
    
    <h3 class="title2">
		${facilityVO.facilityName} &gt; 연결직원
	</h3>
	
	<!-- 선택직원 일괄 해제 폼 -->
	<form name="all_employee_delete_form" id="all_employee_delete_form" style="display:none;">
		<input type="hidden" name="employeeSeqsStr" value="">
    	<input type="hidden" name="sFacilityCode" value="${searchVO.sFacilityCode}">
	</form>
     
    <!-- 개별직원 해제 폼 -->    	
	<form name="delete_form" id="delete_form" style="display:none;">
    	<input type="hidden" name="sFacilityCode" value="${searchVO.sFacilityCode}">
    	<input type="hidden" name="employeeSeq" value="">
    </form>
          	
   	<div class="table-wrapper">

   		<table class="table center">
			<colgroup>
				<col style="width:40px;">
				<col style="width:160px;">
				<col>
				<col style="width:150px;">
				<col style="width:150px;">
				<col style="width:80px;">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="allCheckBox" value="1" onclick="allCheck();"></th>
					<th>부서명</th>
					<th>팀명</th>
					<th>직위</th>
					<th>이름</th>
					<th>관리툴</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(employeeVOList) > 0}">
				<c:forEach items="${employeeVOList}" var="item" varStatus="status">
				<tr>
					<td><input type="checkbox" name="oneCheckBox[]" value="${item.employeeSeq}" onclick="oneCheck($(this));"></td>
					<td>${item.departName}</td>
					<td>${item.teamName}</td>	
					<td>${item.position}</td>	
					<td>${item.name}</td>						
					<td>
						<button type="button" class="btn red sm" onclick="deleteConnectEmployee('${item.name}','${item.employeeSeq}');">해제</button>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(employeeVOList) == 0}">
				<!-- 조회된 자료가 없을 시 -->
				<tr>
					<td colspan="6">연결된 직원정보가 없습니다.</td>
				</tr>
				</c:if>
				
			</tbody>
		</table>
		
		<div class="btn-wrap flex justify">
			<button type="button" class="btn red" onclick="deleteSelectEmployee();">선택직원 일괄 해제</button>
			<button type="button" class="btn blue" onclick="selectEmployeePop();">연결</button>
		</div>
   	</div>
		    
</div> <!--//win-popup-->

</body>
</html>