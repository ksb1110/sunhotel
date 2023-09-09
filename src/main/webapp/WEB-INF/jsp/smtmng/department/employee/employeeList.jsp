<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원관리 - 부서정보 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//등록 팝업
function insertEmployeePop() {
	
	window.open("${pageContext.request.contextPath}/smtmng/department/employee/employeeInsertPop.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}", "employeeInsert", 'resizable=yes,scrollbars=yes,width=1000,height=750');	
}

//수정 팝업
function updateEmployeePop(employeeSeq) {
	
    window.open("${pageContext.request.contextPath}/smtmng/department/employee/employeeUpdatePop.ez?sEmployeeSeq=" + employeeSeq, "employeeUpdate", 'resizable=yes,scrollbars=yes,width=800,height=750');
}

//삭제
function deleteEmployee(employeeSeq) {
	
	//키 셋팅
	$("#delete_employee_form input[name=employeeSeq]").val(employeeSeq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")) {
		
		var parameters = $("#delete_employee_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/employee/employeeDelete.ezax'/>",
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

//부서 - 직원정보전체갱신 1단계
function updateDepartEmployeeAllPre() {
	
	//선택된 부서명
	var departName = $.trim($("select[name='sDepartCode'] option:selected").html());
	
	if(confirm("[" + departName + "] 직원정보를 전체 갱신하시겠습니까?\n아이디가 동일하면 업데이트 되고 없으면 새로 등록됩니다.\n(디스플레이정보는 제외)")){

		$("#updateGukEmployeeAllBtn").hide();
		$("#updateGukEmployeeAllDiv").hide();
		$("#updateDepartEmployeeAllBtn").hide();
		$("#updateDepartEmployeeAllDiv").show();
		
		setTimeout(function() {
			
	   		// 1초 후 부서전채갱신 실행
	       	updateDepartEmployeeAll();
	   }, 1000);
		
	}
}

//부서 - 직원정보전체갱신 2단계
function updateDepartEmployeeAll() {
	
	var parameters = $("#update_all_employee_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/employee/updateDepartEmployeeAll.ezax'/>",
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

//국 - 직원정보전체갱신 1단계
function updateGukEmployeeAllPre() {
	
	//선택된 부서명
	var gukName = $.trim($("select[name='sGukCode'] option:selected").html());
	
	if(confirm("[" + gukName + "] 직원정보를 전체 갱신하시겠습니까?\n아이디가 동일하면 업데이트 되고 없으면 새로 등록됩니다.\n(디스플레이정보는 제외)")){
		
		$("#updateGukEmployeeAllBtn").hide();
		$("#updateGukEmployeeAllDiv").show();
		$("#updateDepartEmployeeAllBtn").hide();
		$("#updateDepartEmployeeAllDiv").hide();
		
		setTimeout(function() {
			
	   		// 1초 후 부서전채갱신 실행
	       	updateGukEmployeeAll();
	   }, 1000);
		
	}
}

//국 - 직원정보전체갱신 2단계
function updateGukEmployeeAll() {
	
	var parameters = $("#update_all_employee_form").serialize();
	
	$.ajax({
		type:"post", 
		dataType:"json",
		async:false,
		url:"<c:url value='/smtmng/department/employee/updateGukEmployeeAll.ezax'/>",
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

//이미지 보기
function viewFile(filePath) {
	
	window.open(filePath);
}

/**
 * 조회 & 페이징
 */
function fn_Search(pageIndex) {
	
	document.frm.pageIndex.value = pageIndex;
	document.frm.action = "<c:url value='/smtmng/department/employee/employeeList.ez'/>";
	document.frm.submit();
}

//국변경
function changeGuk() {
	
	var sGukCode = $("select[name='sGukCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/employeeList.ez?sGukCode="/>" + sGukCode;
	
	document.location.href = url;
}

//부서변경
function changeDepart() {
	
	var sDepartCode = $("select[name='sDepartCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/employeeList.ez?sGukCode=${searchVO.sGukCode}&sDepartCode="/>" + sDepartCode;
	
	document.location.href = url;
}

//팀변경
function changeTeam() {
	
	var sTeamCode = $("select[name='sTeamCode']").val();	
	var url = "<c:url value="/smtmng/department/employee/employeeList.ez?sGukCode=${searchVO.sGukCode}&sDepartCode=${searchVO.sDepartCode}&sTeamCode="/>" + sTeamCode;
	
	document.location.href = url;
}

//선택된 부서/읍면동의 텍스트를 이용하여 버튼명을 셋팅한다.
function setBtnText() {
	
	//선택된 국명
	var gukName = $.trim($("select[name='sGukCode'] option:selected").html());
	
	//국명 셋팅
	$("#update_all_employee_form input[name='gukName']").val(gukName);
	
	//선택된 부서명
	var departName = $.trim($("select[name='sDepartCode'] option:selected").html());
	
	//부서관련 버튼 및 문구 셋팅
	if(gukName.length > 0 || departName.length > 0) {
		
		$("#updateDepartEmployeeAllBtn").html("[" + departName + "] 직원정보 전체갱신");
		$("#updateDepartEmployeeAllDiv").html("* [" + departName + "] 직원정보 전체 갱신중입니다. 잠시만 기다려주세요.");
	}
	
	//국관련 버튼 및 문구 셋팅
	if(gukName.length > 0) {
		
		$("#updateGukEmployeeAllBtn").html("[" + gukName + "] 직원정보 전체갱신");
		$("#updateGukEmployeeAllDiv").html("* [" + gukName + "] 직원정보 전체 갱신중입니다. 잠시만 기다려주세요.");
	}
}

//경로안내 전체체크
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

//경로안내 개별체크
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

//선택항목 경로안내 변경
function applyAllRouteFlag(routeFlag) {
	
	//체크한 박스 
	var checkedCnt = $("input[name='oneCheckBox[]']:checked").length;
	
	if(checkedCnt < 1) {
		
		alert("경로안내를 변경할 직원을 체크해주세요.")
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
	var alarmMsg = "";
	
	if(routeFlag == "Y") {
		
		alarmMsg = "선택한 직원의 경로안내 정보를 적용하시겠습니까?";
	}
	else {
		
		alarmMsg = "선택한 직원의 경로안내 정보를 해제하시겠습니까?";
	}
	
	if(confirm(alarmMsg)) {//값 셋팅
		
		$("#all_route_apply_form input[name='employeeSeqsStr']").val(employeeSeqsStr);
		$("#all_route_apply_form input[name='routeFlag']").val(routeFlag);
		
		var parameters = $("#all_route_apply_form").serialize();
		
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/employee/updateEmployeeAllRouteApply.ezax'/>",
			data:parameters ,
			success:function(data){
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					alert(data.errorMessage);
					document.location.reload();
				}
			}
		});
	}
}

//직원정보 액셀다운로드
function excelDownload() {
	
	$("form[name='excel_form']").submit();
}

$(function() {
	
	//title 속성이 들어있으면 tooltip 적용
	$(document).tooltip();
});
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="employee"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">직원정보</h2>     
            
      		<c:if test="${not empty orgCodeList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li <c:if test="${empty searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/employee/employeeList.ez"/>">전체</a>
                    </li>
                	<c:forEach var="item" items="${orgCodeList}">
                    <li <c:if test="${item.code == searchVO.sGukCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/employee/employeeList.ez?sGukCode=${item.code}"/>">${item.name}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
           	<form name="all_route_apply_form" id="all_route_apply_form">
           	<input type="hidden" name="employeeSeqsStr" value="">
           	<input type="hidden" name="routeFlag" value="">
           	</form>
           	
           	<form name="delete_employee_form" id="delete_employee_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	</form>
           	
           	<form name="update_all_employee_form" id="update_all_employee_form" style="display:none;">
           	<input type="hidden" name="gukCode" value="${searchVO.sGukCode}">
           	<input type="hidden" name="gukName" value="">
           	<input type="hidden" name="departCode" value="${searchVO.sDepartCode}">
           	</form>
           	           	
           	<form name="sort_employee_form" id="sort_employee_form" style="display:none;">
           	<input type="hidden" name="employeeSeq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           	
           	<br />
           	
		    <div class="item-col3-wrapper">
		    	
		    	<form name="excel_form" method="get" action="<c:url value='/smtmng/department/employee/excelDownloadEmployee.ez'/>" target="excel_iframe">
		    		<input type="hidden" name="sGukCode" value="${searchVO.sGukCode}">
		    		<input type="hidden" name="sDepartCode" value="${searchVO.sDepartCode}">
		    		<input type="hidden" name="sTeamCode" value="${searchVO.sTeamCode}">
		    		<input type="hidden" name="sUserId" value="${searchVO.sUserId}">
		    		<input type="hidden" name="sName" value="${searchVO.sName}">
		    		<input type="hidden" name="sApiCheckFlag" value="${searchVO.sApiCheckFlag}">
		    	</form>
		    	
		    	<iframe name="excel_iframe" id="excel_iframe" src="about:blank" style="display:none;"></iframe>
		    	
		    	<form name="frm" id="frm" method="get" onSubmit="fn_Search('1');return false;">
		    	
					<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
				
					<div class="table-wrapper">
						
						<table class="table">
							<colgroup>
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>
							   		<th class="text-left">국</th>
							   		<td>
							   			<select name="sGukCode" onchange="changeGuk();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${orgCodeList}">
							   				<option value="${item.code}" <c:if test="${item.code == searchVO.sGukCode}">selected</c:if>>${item.name}</option>
							   				</c:forEach>
							   			</select>
							   		</td>
							   		
							   		<th class="text-left">부서/읍면동</th>
							   		<td>
							   			<select name="sDepartCode" onchange="changeDepart();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${departCodeList}">
							   				<option value="${item.departCode}" <c:if test="${item.departCode == searchVO.sDepartCode}">selected</c:if>>${item.departName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>	
							   									   		
							   		<th class="text-left">팀</th>
							   		<td>
							   			<select name="sTeamCode" onchange="changeTeam();">
							   				<option value="">== 전체 ==</option>
							   				<c:forEach var="item" items="${teamCodeList}">
							   				<option value="${item.teamCode}" <c:if test="${item.teamCode == searchVO.sTeamCode}">selected</c:if>>${item.teamName}</option>
							   				</c:forEach>
							   			</select>
							   		</td>	
							    </tr>
							</tbody>
						</table>
						
						<table class="table" style="margin-top:5px;">
							<colgroup>
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:120px;">
								<col style="width:200px;">
								<col style="width:200px;">
							   	<col>
							</colgroup>
							<tbody>
							   	<tr>							   		
							   		<th class="text-left">아이디</th>
							   		<td><input type="text" id="sUserId" class="width100" name="sUserId" value="${searchVO.sUserId}" ></td>							   		
							   		<th class="text-left">이름</th>
							   		<td><input type="text" id="sName" class="width100" name="sName" value="${searchVO.sName}" ></td>					   		
							   		<th class="text-left">API체크</th>
							   		<td>
							   			<select name="sApiCheckFlag">
							   				<option value="">== 전체 ==</option>
							   				<option value="Y" <c:if test="${searchVO.sApiCheckFlag == 'Y'}">selected</c:if>>API 체크됨</option>
							   				<option value="N" <c:if test="${searchVO.sApiCheckFlag == 'N'}">selected</c:if>>API 체크안됨</option>
							   			</select>
							   		</td>
									<td style="border:0;text-align:center;">
										<button type="submit" class="btn blue">검색</button>
										<button type="button" class="btn" onclick="document.location.href='<c:url value='/smtmng/department/employee/employeeList.ez?sBuildingCode='/>';">전체</button>
									</td>									
							    </tr>
							</tbody>
						</table>
					</div>
				</form>
				
				<h3 class="title2">
					검색결과 <small>[총 <strong class="text-blue">${paginationInfo.totalRecordCount}</strong>건]</small>
				</h3>
				
				<div class="align-col2-wrapper">
				
					<div class="l-area">
	                   	<button type="button" class="btn black" onclick="applyAllRouteFlag('Y');">선택항목 경로안내 적용</button>
	                    <button type="button" class="btn" onclick="applyAllRouteFlag('N');">선택항목 경로안내 해제</button>
	                    <span style="color:blue;font-size:13px;line-height:150%;">
						 * 직원정보는 매일 새벽 1시 20분에 자동 업데이트 됩니다.
						</span>
	                </div>
	                <div class="r-area">
	                	<c:if test="${not empty searchVO.sDepartCode}">
							<div style="color:red;font-size:20px;font-weight:bold;display:none;" id="updateDepartEmployeeAllDiv">* [국 &gt; 부서] 전체 갱신중입니다 잠시만 기다려주세요.</div>
							<button type="button" class="btn green" id="updateDepartEmployeeAllBtn" onclick="updateDepartEmployeeAllPre();">[부서] 직원정보 전체갱신</button>
						</c:if>
						
						<c:if test="${not empty searchVO.sGukCode}">
							<div style="color:red;font-size:20px;font-weight:bold;display:none;" id="updateGukEmployeeAllDiv">* [국] 전체 갱신중입니다 잠시만 기다려주세요.</div>
							<button type="button" class="btn black" id="updateGukEmployeeAllBtn" onclick="updateGukEmployeeAllPre();">[국] 직원정보 전체갱신</button>
						</c:if>
						
						<button type="button" class="btn green" onclick="excelDownload();">액셀다운로드</button>
						
	                </div>
						
				</div>
				
				
		    	<div class="table-wrapper">
					
					
						
		    		<table class="table center">
						<colgroup>
							<col style="width:40px;">
							<col style="width:80px;">
							<col style="width:130px;">
							<col style="width:150px;">
							<col>
							<col style="width:120px;">
							<col style="width:80px;">
							<col style="width:80px;">
							<col style="width:150px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:80px;">
							<col style="width:80px;">
							<col style="width:100px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="allCheckBox" value="1" onclick="allCheck();"></th>
								<th>번호</th>
								<th>부서명</th>
								<th>팀명</th>
								<th>직위</th>
								<th>이름</th>
								<th>이름초성</th>
								<th>일련번호</th>
								<th>아이디</th>
								<th>디스플레이사진</th>
								<th>디스플레이업무</th>
								<th>경로안내</th>
								<th>API 체크</th>
								<th>
									<div style="display:inline-flex;align-item:center;">									
										<div style="padding-top:2px;">복무연계</div>
										<span class="material-icons" style="color:#FF7E00;" title="직원안내도에서 복무정보를 보여줄지 여부를 설정합니다.">help_center</span>
									</div>
								</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>><input type="checkbox" name="oneCheckBox[]" value="${item.employeeSeq}" onclick="oneCheck($(this));"></td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>><c:out value="${(searchVO.pageIndex-1) * searchVO.recordCountPerPage + status.count}"/></td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.departName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.teamName}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.position}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.name}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.userNameCho}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.employeeSeq}</td>
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>${item.userId}</td>
								
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.memberImgPath}">
									<img src="/images/admin/icon/check2.png" alt="체크">
									</c:if>
								</td>
								
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${not empty item.deskJob}">
									<img src="/images/admin/icon/check2.png" alt="체크">
									</c:if>
								</td>
								
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.routeFlag == 'Y'}">
									<img src="/images/admin/icon/check2.png" alt="체크">
									</c:if>
								</td>
								
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.apiCheckFlag == 'Y'}">
									<img src="/images/admin/icon/temp/blue_check.png" alt="체크">
									</c:if>
								</td>
										
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<c:if test="${item.emptyApplyFlag == 'Y'}">
									<img src="/images/admin/icon/check2.png" alt="체크">
									</c:if>
								</td>
												
								<td <c:if test="${item.apiCheckFlag eq 'N'}">style="background-color:#AFA2A2;"</c:if>>
									<button type="button" class="btn blue sm" onclick="updateEmployeePop('${item.employeeSeq}');">수정</button>
									<button type="button" class="btn red sm" onclick="deleteEmployee('${item.employeeSeq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="15">등록된 직원정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue" onclick="insertEmployeePop();">직원정보등록</button>
					</div>
		    	</div>
		    	
		    	<!--페이징-->
				<div class="paging-wrap">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_Search" />
					</ul>
				</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

<script>
$(function() {
	
	<c:if test="${not empty searchVO.sDepartCode || not empty searchVO.sGukCode}">
	//부서 선택에 따른 일괄버튼 명 변경
	setBtnText();
	</c:if>
	
});
</script>

</body>
</html>