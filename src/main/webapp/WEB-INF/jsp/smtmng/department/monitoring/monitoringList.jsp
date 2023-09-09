<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>직원안내도 모니터링 - 부서관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//디스플레이 화면 보기
function viewDisplay(facilityCode) {
	
	var displayUrl = "/organization/charts.ez?sFacilityCode=" + facilityCode;
	window.open(displayUrl);
}

//삭제
function deleteMonitoring(seq) {
	
	//삭제할 데이터 셋팅
	$("#delete_monitoring_form input[name='seq']").val(seq);
	
	// confirm.del= 삭제하시겠습니까?
	if(confirm("<spring:message code='confirm.del'/>")){
		
		var parameters = $("#delete_monitoring_form").serialize();
		$.ajax({
			type:"post", 
			dataType:"json",
			async:false,
			url:"<c:url value='/smtmng/department/monitoring/monitoringDelete.ezax'/>",
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

//페이지 새로고침 시간 (초)
var reloadTime = ${reloadTime3} * 60;

//페이지 새로고침 남은시간
function timer() {
	 
	//남은시간 text 구하기
	var resultTxt = changeTimeStr(reloadTime);
	
	//남은시간 셋팅
	$("#leftTime").html(resultTxt);
}

//초를 시간 문자열로 변경한다.
function changeTimeStr(reloadTime2) {
	 
	var nowSeconds = Number(reloadTime2);
	
	var hour = parseInt(nowSeconds / 3600);
	var min = parseInt((nowSeconds % 3600)/60);
	var sec = nowSeconds % 60;
	
	var hourTxt = "";
	if(hour > 0) {
		
		hourTxt = hour + "시간 ";
	}
	
	var minTxt = "";
	if(min > 0) {
		
		minTxt = min + "분 ";
	}
	
	var secTxt = "";
	if(sec > 0) {
		
		secTxt = sec + "초";
	}

	var resultTxt = hourTxt + minTxt + secTxt;
	
	return resultTxt;
}

//새로고침 타이머
var reloadTimer;

/**
 * 남은세션시간 표시시작
 * 메소드명 : startSessionTimer
 * 작성일 : 2018. 9. 28. 오후 12:20:41
 * 작성자 : 김승범
 * @param 
 * @return
 */
function startReloadTimer() {
	 
	 //타이머 생성
	 reloadTimer = setInterval(function() {
		
		reloadTime = reloadTime - 1;
		
		//세션시간이 만료되면 로그아웃 처리
		if(reloadTime < 1) {
			
			//리로드 대신 해당 페이지 호출
			document.location.reload();
		}
		
		timer();
	}, 1000);
}

//새로고침 기준시간변경
function changeReLoadTime3() {
	
	//새로고침 기준시간
	var reloadTime3 = $("select[name='reloadTime3']").val();
	
	//페이지 이동 URL
	var locationUrl = "/smtmng/department/monitoring/monitoringList.ez?reloadTime3=" + reloadTime3 + "&responseMin=${responseMin}";
	
	<c:if test="${empty searchVO.sBuildingCode}">
	//선택된 건물코드가 있으면
	locationUrl += "&sBuildingCode=${searchVO.sBuildingCode}";
	</c:if>
	
	//페이지 이동
	document.location.href = locationUrl;
}

//응답 기준시간변경(분)
function changeCompareTime() {
	
	//응답 기준시간
	var responseMin = $("select[name='responseMin']").val();
	
	//페이지 이동 URL
	var locationUrl = "/smtmng/department/monitoring/monitoringList.ez?reloadTime3=${reloadTime3}&responseMin=" + responseMin;
	
	<c:if test="${empty searchVO.sBuildingCode}">
	//선택된 건물코드가 있으면
	locationUrl += "&sBuildingCode=${searchVO.sBuildingCode}";
	</c:if>
	
	//페이지 이동
	document.location.href = locationUrl;
}

//중복부서 색상변경
function checkDuple() {
	
	$("td[class^='nm_']").each(function() {
		
		var cls = $(this).attr("class");

		var dupleCnt = $("td." + cls).length;

		if(dupleCnt > 1) {
			
			$(this).css("color","blue");
			$(this).next().css("color","blue");
		}
	});
}

$(function() {
	
	startReloadTimer();
	
	checkDuple();
});
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="department"/>
		<jsp:param name="admin_menu2" value="monitoring"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">직원안내도 모니터링</h2>                    
           	
           	<form name="delete_monitoring_form" id="delete_monitoring_form" style="display:none;">
           		<input type="hidden" name="seq" value="">
           	</form> 
            
            <c:if test="${not empty buildingList}">
            <!-- 3Depth Menu (메뉴없을 시 삭제) -->
            <nav class="depth3-menu">
                <ul>
                    <li <c:if test="${empty searchVO.sBuildingCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/monitoring/monitoringList.ez?reloadTime3=${reloadTime3}&responseMin=${responseMin}"/>">전체건물</a>
                    </li>
                	<c:forEach var="item" items="${buildingList}">
                    <li <c:if test="${item.buildingCode == searchVO.sBuildingCode}">class="active"</c:if>>
                        <a href="<c:url value="/smtmng/department/monitoring/monitoringList.ez?sBuildingCode=${item.buildingCode}&reloadTime3=${reloadTime3}&responseMin=${responseMin}"/>">${item.buildingName}</a>
                    </li>
                	</c:forEach>
                </ul>
            </nav>
            <!-- //3Depth Menu (메뉴없을 시 삭제) -->
          	</c:if>
          	
		    <div class="item-col3-wrapper">
		    	
		    	<div class="table-wrapper">
					
					<div class="btn-wrap" style="float:left;color:blue;font-size:16px;margin:0;text-align:left;line-height:180%;">
					 	<span style="font-weight:bold;">[ 기준시간 : ${nowDatetime} ]</span>
			    		<br>
			    		<select name="responseMin" onchange="changeCompareTime();">
							<option value="10" <c:if test="${responseMin == '10'}">selected</c:if>>10분</option>
							<option value="15" <c:if test="${responseMin == '15'}">selected</c:if>>15분</option>
							<option value="20" <c:if test="${responseMin == '20'}">selected</c:if>>20분</option>
							<option value="25" <c:if test="${responseMin == '25'}">selected</c:if>>25분</option>
							<option value="30" <c:if test="${responseMin == '30'}">selected</c:if>>30분</option>
							<option value="35" <c:if test="${responseMin == '35'}">selected</c:if>>35분</option>
							<option value="40" <c:if test="${responseMin == '40'}">selected</c:if>>40분</option>
							<option value="45" <c:if test="${responseMin == '45'}">selected</c:if>>45분</option>
							<option value="50" <c:if test="${responseMin == '50'}">selected</c:if>>50분</option>
							<option value="55" <c:if test="${responseMin == '55'}">selected</c:if>>55분</option>
							<option value="60" <c:if test="${responseMin == '60'}">selected</c:if>>60분</option>
						</select>		
						동안 응답이 있는 경우 (<img src="/images/admin/icon/temp/blue_check.png" alt="check">)
						,
						응답이 없는 경우 (<img src="/images/admin/icon/temp/red_info.png" alt="info">)
					</div>
					
					<div class="btn-wrap" style="float:right;color:red;font-size:16px;font-weight:bold;margin:0;padding-top:28px;">
						
					 	[<span style="color:black;" id="leftTime"></span>] 후에 자동 새로고침 됩니다.
					 	
					 	&nbsp;&nbsp;&nbsp;&nbsp;
					 	
						새로고침 기준시간 : <select name="reloadTime3" onchange="changeReLoadTime3();">
							<option value="1"  <c:if test="${reloadTime3 == '1'}">selected</c:if>>1분</option>
							<option value="5"  <c:if test="${reloadTime3 == '5'}">selected</c:if>>5분</option>
							<option value="10" <c:if test="${reloadTime3 == '10'}">selected</c:if>>10분</option>
							<option value="15" <c:if test="${reloadTime3 == '15'}">selected</c:if>>15분</option>
							<option value="20" <c:if test="${reloadTime3 == '20'}">selected</c:if>>20분</option>
							<option value="25" <c:if test="${reloadTime3 == '25'}">selected</c:if>>25분</option>
							<option value="30" <c:if test="${reloadTime3 == '30'}">selected</c:if>>30분</option>
							<option value="35" <c:if test="${reloadTime3 == '35'}">selected</c:if>>35분</option>
							<option value="40" <c:if test="${reloadTime3 == '40'}">selected</c:if>>40분</option>
							<option value="45" <c:if test="${reloadTime3 == '45'}">selected</c:if>>45분</option>
							<option value="50" <c:if test="${reloadTime3 == '50'}">selected</c:if>>50분</option>
							<option value="55" <c:if test="${reloadTime3 == '55'}">selected</c:if>>55분</option>
							<option value="60" <c:if test="${reloadTime3 == '60'}">selected</c:if>>60분</option>
						</select>
						
						
					</div>
					
		    		<table class="table center">
						<colgroup>
							<col style="width:100px;">
							<col style="width:200px;">
							<col style="width:200px;">
							<col style="width:100px;">
							<col style="width:80px;">
							<col>
							<col style="width:180px;">
							<col style="width:200px;">
							<col style="width:150px;">
						</colgroup>
						<thead>
							<tr>
								<th>상태</th>
								<th>최종응답시간</th>
								<th>응답아이피</th>
								<th>건물명</th>
								<th>층</th>
								<th>시설명</th>
								<th>시설코드</th>
								<th>직원안내도</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<c:if test="${fn:length(resultList) > 0}">
							<c:forEach items="${resultList}" var="item" varStatus="status">
							<tr>
								<td>
									<c:if test="${item.responseYn == 'Y'}">
									<img src="/images/admin/icon/temp/blue_check.png" alt="check">
									</c:if>
									
									<c:if test="${item.responseYn != 'Y'}">
									<img src="/images/admin/icon/temp/red_info.png" alt="info">
									</c:if>
								</td>
								<td>
									<c:if test="${not empty item.regDttm && fn:length(item.regDttm) > 16}">
									${fn:substring(item.regDttm,0,16)}
									</c:if>
								</td>
								<td>${item.ip}</td>
								<td>${buildingNameMap.get(item.buildingCode)}</td>
								<td>${floorNameMap.get(item.floorCode)}</td>
								<td class="nm_${item.facilityCode}">${item.facilityName}</td>
								<td>${item.facilityCode}</td>
								<td>
									<button type="button" class="btn green sm" onclick="viewDisplay('${item.facilityCode}');">직원안내도보기</button>
								</td>
								<td>
									<button type="button" class="btn red sm" onclick="deleteMonitoring('${item.seq}');">삭제</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(resultList) == 0}">
							<!-- 조회된 자료가 없을 시 -->
							<tr>
								<td colspan="9">직원안내도 모니터링 정보가 없습니다.</td>
							</tr>
							</c:if>
							
						</tbody>
					</table>
					
		    	</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>